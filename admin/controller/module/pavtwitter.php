<?php 
class ControllerModulePavtwitter extends Controller {
	private $error = array();

	private $data = array();

	public function index() {

		$this->data['objlang'] = $this->language;
		$this->data['objurl'] = $this->url;

		$this->load->language('module/pavtwitter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		$this->load->model('tool/image');

		if( isset($this->request->get['module_id']) && isset($this->request->get['delete']) ){
			$this->model_extension_module->deleteModule( $this->request->get['module_id'] );
			$this->response->redirect($this->url->link('module/pavtwitter', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {


			$action = isset($this->request->post["action"]) ? $this->request->post["action"] : "";
			unset($this->request->post['pavtwitter_module']['action']);

		 	$data = array();
			foreach ($this->request->post['pavtwitter_module'] as $key => $value) {
		 	 	$data = $value;
		 	 	break;
		 	}


			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('pavtwitter', $data );
			} else {
				$this->model_extension_module->editModule( $this->request->get['module_id'], $data );
			}

			$this->session->data['success'] = $this->language->get('text_success');
			if( isset($this->request->get['module_id']) ) {
				$this->response->redirect($this->url->link('module/pavtwitter', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL'));
			}else{
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}

		}

		$this->_language();


 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->error['dimension'])) {
			$this->data['error_dimension'] = $this->error['dimension'];
		} else {
			$this->data['error_dimension'] = array();
		}

		$this->_breadcrumbs();

		$this->data['action'] = $this->url->link('module/pavtwitter', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['pavproducts_status'])) {
			$this->data['pavproducts_status'] = $this->request->post['pavproducts_status'];
		} else {
			$this->data['pavproducts_status'] = $this->config->get('pavproducts_status');
		}

		$default = array(
			'widget_id' => '366766896986591232',
			'count' => '',
			'username'		=> 'pavothemes',
			'theme'	=> 'light',
			'nickname_color'=> '000000',
			'name_color'	=>'000000',
			'link_color'	=> 'CC0000',
			'title_color'	=> '000000',
			'border_color'	=> 'FFFFFF',
			'chrome'	=> array(),
			'name' => ''
		);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			$module_info = array_merge( $default, $module_info );
			$this->data['selectedid'] = $this->request->get['module_id'];


			$this->data['subheading'] = $this->language->get('text_edit_module') . $module_info['name'];
			$this->data['action'] = $this->url->link('module/pavtwitter', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL');
		}else {
			$module_info = $default;
			$this->data['selectedid'] = 0;
			$this->data['subheading'] = $this->language->get('text_create_new_module');
			$this->data['action'] = $this->url->link('module/pavtwitter', 'token=' . $this->session->data['token'], 'SSL');
		}

		$modules = array( 0=> $module_info );

		$moduletabs = $this->model_extension_module->getModulesByCode( 'pavtwitter' );
	 	$this->data['link'] = $this->url->link('module/pavtwitter', 'token=' . $this->session->data['token'] . '', 'SSL');
 		$this->data['modules'] = $modules;


 		$this->data['moduletabs'] = $moduletabs;


 		$this->data['olang']  = $this->language;

    	$this->document->addScript('view/javascript/pavtwitter/jscolor/jscolor.js');

    	if (isset($this->request->post['pavtwitter_status'])) {
			$this->data['pavtwitter_status'] = $this->request->post['pavtwitter_status'];
		} else {
			$this->data['pavtwitter_status'] = $this->config->get('pavtwitter_status');
		}

    	$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['column_right'] = $this->load->controller('common/column_right');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->data['themes'] = array('light','dark');
    	$this->data['chromes'] = array( 'noheader',
		                                'nofooter',
		                                'noborders',
		                                'noscrollbar',
		                                'transparent');

    	$this->load->model('design/layout');

		$this->data['layouts'] = array();

		$this->data['layouts'][] = array('layout_id'=>99999, 'name' => $this->language->get('all_page') );

		$this->data['layouts'] = array_merge($this->data['layouts'],$this->model_design_layout->getLayouts());

    	$this->load->model('design/banner');

		$this->data['banners'] = $this->model_design_banner->getBanners();

		$this->response->setOutput($this->load->view('module/pavtwitter.tpl', $this->data));
	}

	public function _language(){
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_username'] = $this->language->get('entry_username');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['entry_widgetid'] = $this->language->get('entry_widgetid');
	    $this->data['entry_theme'] = $this->language->get('entry_theme');
	    $this->data['entry_linkcolor'] = $this->language->get('entry_linkcolor');
	    $this->data['entry_bordercolor'] = $this->language->get('entry_bordercolor');
	    $this->data['entry_width'] = $this->language->get('entry_width');
	    $this->data['entry_height'] = $this->language->get('entry_height');
	    $this->data['entry_showreply'] = $this->language->get('entry_showreply');
	    $this->data['entry_chrome'] = $this->language->get('entry_chrome');
	    $this->data['entry_widget_help'] = $this->language->get('entry_widget_help');
	    $this->data['entry_count_help'] = $this->language->get('entry_count_help');
	    
	    $this->data['entry_nickname_color'] = $this->language->get('entry_nickname_color');
	    $this->data['entry_name_color'] = $this->language->get('entry_name_color');
	    $this->data['entry_title_color'] = $this->language->get('entry_title_color');

	    $this->data['entry_chrome_help'] = $this->language->get('entry_chrome_help');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_save_edit'] = $this->language->get('button_save_edit');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_module_add'] = $this->language->get('button_module_add');
		$this->data['button_remove'] = $this->language->get('button_remove');
    	$this->data['tab_module'] = $this->language->get('tab_module');
	}

	public function  _breadcrumbs(){
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/pavtwitter', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/pavtwitter')) {
			$this->error['warning'] = $this->language->get('error_username');
		}

		if (isset($this->request->post['pavtwitter_module'])) {
			foreach ($this->request->post['pavtwitter_module'] as $key => $value) {
				if( isset($value['username'] ) || isset($value['username'] )){
					if( !isset($value['username'])){
						$this->error['dimension'][$key] = $this->language->get('error_username');
					}
				}
			}
		}


		return !$this->error;
	}

}
?>