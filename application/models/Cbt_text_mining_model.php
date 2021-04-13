<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Cbt_text_mining_model extends CI_Model
{
   public $table = 'cbt_tes_soal';

   function __construct()
   {
      parent::__construct();
   }

   function save($data)
   {
      var_dump($data);die;
      $this->db->insert($this->table, $data);
      return $this->db->insert_id();
   }
}
