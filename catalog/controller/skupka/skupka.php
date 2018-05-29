<?php
class ControllerSkupkaSkupka extends Controller {
    public function index() {
        $this->load->language('skupka/skupka');

        $this->load->model('skupka/skupka');
        $data['skupka_title'] = $this->model_skupka_skupka->getTitle();
        $data['skupka_descr'] = $this->model_skupka_skupka->getDscr();

        $skupka_input_pagehead = $this->model_skupka_skupka->getPagehead();
        $skupka_input_pagedescr = $this->model_skupka_skupka->getPagedescr();
        $data['skupka_page_header'] = $skupka_input_pagehead[0]['pagehead'];
        $data['skupka_page_descr'] = $skupka_input_pagedescr[0]['pagedescr'];


        $this->document->setTitle($data['skupka_title'][0]['skupka_meta_title']);
        $this->document->setDescription($data['skupka_descr'][0]['skupka_meta_descr']);
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        $data['title'] = $this->language->get('title');
        $data['text'] = $this->language->get('text');
        $data['my_var'] = $this->language->get('my_var');
        $data['skupka_h1'] = $this->language->get('skupka_h1');
        $data['skupka_desc'] = $this->language->get('skupka_desc');
        $data['skupka_tablehead'] = $this->language->get('skupka_tablehead');

        //Хлебные крошки
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
        'href' => $this->url->link('common/home'),
        'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
        'href' => $this->url->link('mypage/mypage'),
        'text' => $this->language->get('text')
        );

        //добавляем проверку к роутеру
        if (isset($this->request->get['route'])) {
        $this->document->addLink(HTTP_SERVER, 'canonical');
        }

        //получаем категории
        $data['categories'] = array();
        $data['categories'] = $this->model_skupka_skupka->getCategories();
        //первой категорией у нас будут телефоны
        //по этому получаем их в отдельный массив
        //остальные будут подгружатся через Ajax в тот же div
        $data['phones'] = array();
        $data['phones'] =  $this->model_skupka_skupka->getProducts(1);


        //подключаем header и footer
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        //подключаем шаблон
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/skupka/skupka.tpl')) {
               $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/skupka/skupka.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/skupka/skupka.tpl', $data));
        }
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