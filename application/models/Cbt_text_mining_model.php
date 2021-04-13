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

   function update($kolom, $isi, $data)
    {
        $this->db->where($kolom, $isi)
            ->update($this->table, $data);
    }

   function save_batch($data)
   {
      //$this->db->query($sql);
      $this->db->insert_batch($this->table, $data);
   }

   function get_by_testuser_limit($tesuser_id, $limit)
   {
      $this->db->where('tm_tesuser_id="' . $tesuser_id . '"')
         ->join('cbt_tes_soal', 'cbt_text_mining.tm_soal_id = cbt_tes_soal.tessoal_soal_id')
         ->from($this->table)
         ->limit($limit);
      return $this->db->get();
   }

   function get_by_tessoal_limit($tm_tesuser_id, $limit){
      $this->db->where('tm_tesuser_id="'.$tm_tesuser_id.'"')
               ->join('cbt_soal', 'cbt_tes_soal.tessoal_soal_id = cbt_soal.soal_id')
               ->from($this->table)
               ->limit($limit);
      return $this->db->get();
  }
}
