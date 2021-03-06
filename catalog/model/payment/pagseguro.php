<?php
class ModelPaymentPagseguro extends Controller {

	public function getMethod() {
		return array();
	}
	
	/* Captura token de autorização */
	public function captureToken() {
		
		if ($this->config->get('pagseguro_modo_teste')){
			$url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/sessions/';
		} else {
			$url = 'https://ws.pagseguro.uol.com.br/v2/sessions/';
		}
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array(
			'email' => $this->config->get('pagseguro_email'),
			'token' => $this->config->get('pagseguro_token')
		)));
		
		$response = curl_exec($ch);
		
		curl_close($ch);
		
		$this->session->data['xml'] = $url;
		
		/*var_dump($response);
		
		if ($response == 'Unauthorized') {}
			return $response;
		
		echo '<br><br><Br>';
		
		
		return $xml->id;*/
		
		libxml_use_internal_errors(true);
		
		$xml = simplexml_load_string($response);
		
		if ($xml) {
			return $xml->id;
		} else {
			return $response;
		}
	}
	
	/* Envia os dados da transação par ao pagseguro  */
	public function transition($data) {
		
		if ($this->config->get('pagseguro_modo_teste')){
			$url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/transactions/';
		} else {
			$url = 'https://ws.pagseguro.uol.com.br/v2/transactions/';
		}
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		
		$response = curl_exec($ch);
		
		curl_close($ch);
		
		$xml = simplexml_load_string($response);
		
		$this->session->data['pagseguro_data'] = http_build_query($data);
		$this->session->data['pagseguro_response'] = $response;
		
		if (isset($xml->error)){
			$json = array(
				'error' => $xml->error
			);
		} else {
			$json = $xml;
		}
		
		return $json;
	}
	
	/* Captura o tipo de frete (1 - PAC; 2 - Sedex; 3 - Outros) */
	public function getShippingType() {
		if(preg_match('/correios/', $this->session->data['shipping_method']['code'])) {
			if(preg_match('/(41106|41068)/', $this->session->data['shipping_method']['code'])) {
				return 1;
			} else {
				return 2;
			}
		} else {
			return 3;
		}
	}

	/* Captura o número da residência */
	public function getAddressNumber($custom_field) {
		if (array_key_exists($this->config->get('pagseguro_numero_residencia'), $custom_field)) {
			return $custom_field[$this->config->get('pagseguro_numero_residencia')];
		} else {
			return 0;
		}
	}

	/* Verifica as notificações */
	public function notification($notificationCode = false) {
		if ($notificationCode === false) {
			return false;
		}
		
		/* Verifica se está em modo de teste */
		if ($this->config->get('pagseguro_modo_teste')){
			$url = 'https://ws.sandbox.pagseguro.uol.com.br/v3/transactions/notifications/';
		} else {
			$url = 'https://ws.pagseguro.uol.com.br/v3/transactions/notifications/';
		}
		
		/* Captura o código da notificação */
		$url .= $notificationCode;
		
		/* Captura o E-mail do lojista */
		$url .= '?email=' . $this->config->get('pagseguro_email');
		
		/* Captura o token de acesso */
		$url .= '&token=' . $this->config->get('pagseguro_token');
		
		/* Envia uma requisição para obtenção dos dados */
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		
		$response = curl_exec($ch);
		
		curl_close($ch);
		
		$xml = simplexml_load_string($response);
		
		/* Verifica se há erros */
		if (!$xml->error) {
			return array(
				'order_id' => preg_replace('/[^0-9]/', '', $xml->reference),
				'status' => $xml->status
			);
		} else {
			$this->log->write('Falha na notificação do PagSeguro. Errr: ' . $xml->error->message);
			
			return false;
		}
		
	}

	/* Shipping Free */
	public function shippingFree() {
		if (isset($this->session->data['coupon'])) {
			$this->load->language('total/coupon');

			$this->load->model('checkout/coupon');

			$coupon_info = $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);
			
			if ($coupon_info['shipping']) {
				return true;
			}
			
			return false;
		} else {
			return false;
		}
	}
	
	/* Shipping Free */
	public function discount($total) {
		if (isset($this->session->data['coupon'])) {
			$this->load->language('total/coupon');

			$this->load->model('checkout/coupon');

			$coupon_info = $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);

			if ($coupon_info) {
				$discount_total = 0;

				if (!$coupon_info['product']) {
					$sub_total = $this->cart->getSubTotal();
				} else {
					$sub_total = 0;

					foreach ($this->cart->getProducts() as $product) {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$sub_total += $product['total'];
						}
					}
				}

				if ($coupon_info['type'] == 'F') {
					$coupon_info['discount'] = min($coupon_info['discount'], $sub_total);
				}

				foreach ($this->cart->getProducts() as $product) {
					$discount = 0;

					if (!$coupon_info['product']) {
						$status = true;
					} else {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$status = true;
						} else {
							$status = false;
						}
					}

					if ($status) {
						if ($coupon_info['type'] == 'F') {
							$discount = $coupon_info['discount'] * ($product['total'] / $sub_total);
						} elseif ($coupon_info['type'] == 'P') {
							$discount = $product['total'] / 100 * $coupon_info['discount'];
						}
					}

					$discount_total += $discount;
				}

				// If discount greater than total
				if ($discount_total > $total) {
					$discount_total = $total;
				}

				$total -= $discount_total;
			}
		}
		
		return $total;
	}
}