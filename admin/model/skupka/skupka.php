<?php
class ModelSkupkaSkupka extends Model {
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


	public function addRow ($prodname, $prodcat){
		$this->db->query("INSERT INTO " . DB_PREFIX . "skupka_products (`product_name`, `product_category`) VALUES
    ('".$prodname."','".$prodcat."')");
	return 'added';
    }
    
    public function addCat ($catname){
		$this->db->query("INSERT INTO " . DB_PREFIX . "skupka_category (`category_name`) VALUES
    ('".$catname."')");
	return 'added';
    }
    


	public function deleteRow ($msg_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "skupka_products WHERE product_id = ".$msg_id);
	return 'deleted';
    }
    
    public function deleteCat ($msg_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "skupka_category WHERE category_id = ".$msg_id);
	return 'deleted';
    }
    
    
    public function saveStgs ($head, $descr, $pagehead, $pagedescr){
        $this->db->query("UPDATE " . DB_PREFIX . "skupka_settings SET skupka_meta_title='".$head."'");
		$this->db->query("UPDATE " . DB_PREFIX . "skupka_settings SET skupka_meta_descr='".$descr."'");
		$this->db->query("UPDATE " . DB_PREFIX . "skupka_settings SET pagehead='".$pagehead."'");
		$this->db->query("UPDATE " . DB_PREFIX . "skupka_settings SET pagedescr='".$pagedescr."'");
	return 'added';
    }

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

}