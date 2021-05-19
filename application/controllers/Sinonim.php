<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * KUISKU
 * name
 * email
 * 
 */
class Sinonim extends CI_Controller
{
   var $jsonDict;
   public function index()
   {
      echo "Hello Synonym";
   }

   function store($id = 0)
   {
      $file = file_get_contents(FCPATH . 'dict/dict' . $id . '.json');
      $jsonDict = json_decode($file, true);
      foreach ($jsonDict as $key => $value) {
         foreach ($value['sinonim'] as $keySin => $valSin) {
            $data = [
               'word'   => $key,
               'tag'    => $value['tag'],
               'synonym'   => $valSin,
            ];
            $this->db->insert('cbt_synonym', $data);
         }
      }
      echo "Done dict" . $id . ".json";
   }
}
