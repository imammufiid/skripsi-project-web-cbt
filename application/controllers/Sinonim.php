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

   public function __construct()
   {
      parent::__construct();
      $file = file_get_contents(FCPATH . 'dict.json');
      $this->jsonDict = json_decode($file, true);
   }

   public function getSynonym($word = "") {
      if(array_key_exists($word, $this->jsonDict)) {
         echo json_encode([
            'status' => 200,
            'data_sinonim' => $this->jsonDict[$word]['sinonim'] 
         ]);
      } else {
         echo json_encode([
            'message' => null
         ]);
      }
   }

}