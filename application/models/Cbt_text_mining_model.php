<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Cbt_text_mining_model extends CI_Model
{
   public $table = 'cbt_text_mining';

   function __construct()
   {
      parent::__construct();
   }

   function save($data)
   {
      $this->db->insert($this->table, $data);
      return $this->db->insert_id();
   }

   function save_batch($data){
      //$this->db->query($sql);
      $this->db->insert_batch($this->table, $data);
  }
}
