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

   function get_by_tessoal_limit($tm_tesuser_id, $limit)
   {
      $this->db->where('tm_tesuser_id="' . $tm_tesuser_id . '"')
         ->join('cbt_soal', 'cbt_tes_soal.tessoal_soal_id = cbt_soal.soal_id')
         ->from($this->table)
         ->limit($limit);
      return $this->db->get();
   }

   function getStudentAnswerByTessoalID($tessoalID)
   {
      return $this->db->get_where("text_mining_answer_view", ["tessoal_id" => $tessoalID])->row_array();
   }

   function getTeacherAnswerBySoalID($soalID)
   {
      return $this->db->get_where("text_mining_kunci_view", ["soal_id" => $soalID])->row_array();
   }

   function getAllAnswerBySoalID($soalID)
   {
      return $this->db->get_where("text_mining_answer_view", ["soal_id" => $soalID])->result_array();
   }

   public function getAllSoalByTesId($testId = 0)
   {
      return $this->db->get_where("all_question_by_tes_view", ["tes_id" => $testId])->result();
   }

   public function getAllStudentByTest($testId = 0)
   {
      /**
       * ! please add where clause if nilai/score != 0
       */
      return $this->db->get_where("text_mining_answer_view", ["tes_id" => $testId])->result();
   }

   public function getTesById($tesId = 0)
   {
      return $this->db->select('tes_id, tes_nama, tes_score_right, tes_score_wrong, tes_max_score')
      ->get_where('cbt_tes', ['tes_id' => $tesId])
      ->result();
   }

   /**
	 * * SYNOYNM RECOGNITION
	 */
	function synonym_recognition($array = [])
	{
		foreach ($array as $key => $value) {
			$synonym = $this->db->select("word")
				->from("cbt_synonym")
				->where("synonym", $value)
				->get()
				->row();

			if ($synonym != null) {
				$array[$key] = $synonym->word;
			}
		}

		return $array;
	}

   function insert_synonym_recognition($synonymRecognition, $tmId) {
      $data = [
         "tm_synonym_recognition"   => $synonymRecognition
      ];
      return $this->db->where("tm_id", $tmId)->update($this->table, $data);
   }
}
