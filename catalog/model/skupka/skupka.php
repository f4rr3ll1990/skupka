<?php
class ModelSkupkaSkupka extends Model {

	public function getTitle () {
        $query = $this->db->query("SELECT skupka_meta_title FROM " . DB_PREFIX . "skupka_settings");
        foreach ($query->rows as $result) {
			$title[] = $result;
        }
        return $title;
    }
    public function getDscr () {
        $query = $this->db->query("SELECT skupka_meta_descr FROM " . DB_PREFIX . "skupka_settings");
        foreach ($query->rows as $result) {
			$descr[] = $result;
		}
        return $descr;
	}
	public function getPagehead () {
        $query = $this->db->query("SELECT pagehead FROM " . DB_PREFIX . "skupka_settings");
        foreach ($query->rows as $result) {
			$pagehead[] = $result;
        }
        return $pagehead;
	}
	public function getPagedescr () {
        $query = $this->db->query("SELECT pagedescr FROM " . DB_PREFIX . "skupka_settings");
        foreach ($query->rows as $result) {
			$pagedescr[] = $result;
        }
        return $pagedescr;
    }
    
	public function getCategories () {
		$categories = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "skupka_category ORDER BY category_id ASC");
		foreach ($query->rows as $result) {
			$categories[] = $result;
		}
		return $categories;
    }
    
	public function getProducts ($category_id) {
		$products = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "skupka_products WHERE product_category = " . $category_id . " ORDER BY product_id DESC");
		foreach ($query->rows as $result) {
			$products[] = $result;
		}
		return $products;
    }
}