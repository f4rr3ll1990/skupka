<?php

class ControllerSkupkaSkupka extends Controller { 
	private $error = array(); // объявляем переменную - массив с возможными ошибками
	public function index() { 
		$this->load->language('skupka/skupka');
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('skupka/skupka');
        $skupka_input_title = $this->model_skupka_skupka->getTitle();
        $skupka_input_descr = $this->model_skupka_skupka->getDscr();
        $skupka_input_pagehead = $this->model_skupka_skupka->getPagehead();
        $skupka_input_pagedescr = $this->model_skupka_skupka->getPagedescr();

        $data['skupka_title'] = $skupka_input_title[0]['skupka_meta_title'];
        $data['skupka_descr'] = $skupka_input_descr[0]['skupka_meta_descr'];
        $data['skupka_page_header'] = $skupka_input_pagehead[0]['pagehead'];
        $data['skupka_page_descr'] = $skupka_input_pagedescr[0]['pagedescr'];


		// регистрируем модуль
        $this->load->model('setting/setting');

        $data['token'] = $this->session->data['token'];
		// хлебные крошки, нужны для оформления модуля "как все"
		$data['breadcrumbs'] = array();
		// Добавляем по одной крошки, сначала ссылка на главную страницу
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'), // text_home по всей видимости доступен отовсюду
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		// добавляем ссылку на список с модулями, прописано в своем языковом файле
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);


        //получаем категории
        $data['categories'] = array();        
        $data['categories'] = $this->model_skupka_skupka->getCategories();
        //первой категорией у нас будут телефоны
        //по этому получаем их в отдельный массив
        //остальные будут подгружатся через Ajax в тот же div
        $data['phones'] = array();
        $data['phones'] =  $this->model_skupka_skupka->getProducts(1);
		
		
		
//____________________________________________________________________________________		
		
		// подключаем с админской части шапки колонки слева и футера 
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
// передаем данные на отрисовку
		$this->response->setOutput($this->load->view('skupka/skupka.tpl', $data));
	}
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'skupka/skupka')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

    public function deleteProduct(){

            // получаем значения
            $delprod = ($this->request->post['id']) ? $this->request->post['id'] : 0;
            // массив вывода
            $json = array();
            if (!$delprod) {
                    $json['error'] = 'no id';
            } else {
                    $this->load->model('skupka/skupka');
                    foreach($delprod as $d){
                        $json['com_id'][] = $this->model_skupka_skupka->deleteRow($d);
                    }

            }
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
    }

    public function addProduct(){

                // получаем значения
                $prodname = ($this->request->post['prname']) ? $this->request->post['prname'] : '';
                $prodcat = ($this->request->post['prcategory']) ? $this->request->post['prcategory'] : '';
                // массив вывода
                $json = array(); 
                $this->load->model('skupka/skupka');     
                $json['com_id'][] = $this->model_skupka_skupka->addRow($prodname, $prodcat);

                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
    }

    public function addCategory(){
        
                        // получаем значения
                        $catname = ($this->request->post['name']) ? $this->request->post['name'] : '';
                        // массив вывода
                        $json = array();  
                        $this->load->model('skupka/skupka');     
                        $json['com_id'][] = $this->model_skupka_skupka->addCat($catname);
        
                        $this->response->addHeader('Content-Type: application/json');
                        $this->response->setOutput(json_encode($json));
    }

    public function deleteCategory(){
        
                    // получаем значения
                    $delcat = ($this->request->post['id']) ? $this->request->post['id'] : 0;
                    // массив вывода
                    $json = array();
                    if (!$delcat) {
                            $json['error'] = 'no id';
                    } else {
                            $this->load->model('skupka/skupka');
                            $json['com_id'][] = $this->model_skupka_skupka->deleteCat($delcat);      
                    }
                    $this->response->addHeader('Content-Type: application/json');
                    $this->response->setOutput(json_encode($json));
    }

    
    public function saveSettings(){
        
                        // получаем значения
                        $head = ($this->request->post['head']) ? $this->request->post['head'] : '';
                        $descr = ($this->request->post['descr']) ? $this->request->post['descr'] : '';
                        $pagehead = ($this->request->post['pagehead']) ? $this->request->post['pagehead'] : '';
                        $pagedescr = ($this->request->post['pagedescr']) ? $this->request->post['pagedescr'] : '';
                        // массив вывода
                        $json = array();  
                        $this->load->model('skupka/skupka');     
                        $json['com_id'][] = $this->model_skupka_skupka->saveStgs($head, $descr, $pagehead, $pagedescr);
        
                        $this->response->addHeader('Content-Type: application/json');
                        $this->response->setOutput(json_encode($json));
    }

        //Получаем товары по ajax
    public function getProductsAjax(){
        
        // получаем значение категории
        $category_id = ($this->request->post['category']) ? $this->request->post['category']:1;
        //получаем товары
        $data['products'] = array();
        $this->load->model('skupka/skupka');
        $data['products'] = $this->model_skupka_skupka->getProducts($category_id);
        $json = $data['products'];
        //формируем ответ
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }
	
}
