<?php
class ControllerInformationInformation extends Controller {
	public function index() {
		$this->load->language('information/information');

				  
				  $this->load->language('module/xform');
				  $this->load->model('xform/xform'); 
				  $formId = isset($this->request->get['formId'])? $this->request->get['formId'] : 0; 
				  $formId = (!$formId && isset($this->request->post['form_id']))? $this->request->post['form_id']: $formId;
				  if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->model_xform_xform->validateForm($formId,$this->request->post['data'])) {
		
             			$formdata=array();
			 			$formdata['formId']     = $formId;
						$formdata['userIP'] = $_SERVER['REMOTE_ADDR'];
			 			$formdata['userAgent'] = $_SERVER['HTTP_USER_AGENT'];
			 			$formdata['submitDate'] = date('Y-m-d H:i:s');
			 			$formdata['userId']= ($this->customer->isLogged())? $this->customer->getId(): 0;
			 			$formdata['storeId']= $this->config->get('config_store_id');
		
			 
			 			$recordId=$this->model_xform_xform->addFormRecord($formdata);
			 			$this->model_xform_xform->processFormData($recordId,$this->request->post['data']);
			 
						$this->model_xform_xform->processFormEmail($recordId);
			  
						$formInfo= $this->model_xform_xform->getForm($formId);
			
			            $redirect=($formInfo['successType']=='redirect' && $formInfo['successURL'])?$formInfo['successURL']: $this->url->link('xform/xform/success', 'formId='.$formId, 'SSL');
			 
			            $this->response->redirect($redirect);
		           } 
			   
			

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$this->document->setTitle($information_info['meta_title']);
			$this->document->setDescription($information_info['meta_description']);
			$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			$data['heading_title'] = $information_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

				  
				  if (preg_match('/\[xform\](\d+)\[\/xform\]/', $data['description'],$xforms)) {
					$formId = $xforms[1];
					$formdata = (isset($this->request->post['data']) && is_array($this->request->post['data']))?$this->request->post['data']:array();
		        	$form_html=$this->model_xform_xform->renderForm($formId,$formdata);
		        	$data['description'] = str_replace('[xform]'.$formId.'[/xform]', $form_html, $data['description']);
		     	 }  
			   
			

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/information.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/information.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}