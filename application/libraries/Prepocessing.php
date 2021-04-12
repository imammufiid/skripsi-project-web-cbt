<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * KUISKU
 * name
 * email
 * Computer Based-Test
 */
class Prepocessing
{

   function caseFolding($sentence = "")
   {
      //rubah alfabet besar menjadi kecil
      $newSentence = strtolower($sentence);
      //hilangkan tanda baca
      $newSentence = str_replace("'", " ", $newSentence);
      $newSentence = str_replace("-", " ", $newSentence);
      $newSentence = str_replace(")", " ", $newSentence);
      $newSentence = str_replace("(", " ", $newSentence);
      $newSentence = str_replace("\"", " ", $newSentence);
      $newSentence = str_replace("/", " ", $newSentence);
      $newSentence = str_replace("=", " ", $newSentence);
      $newSentence = str_replace(".", " ", $newSentence);
      $newSentence = str_replace(",", " ", $newSentence);
      $newSentence = str_replace(":", " ", $newSentence);
      $newSentence = str_replace(";", " ", $newSentence);
      $newSentence = str_replace("!", " ", $newSentence);
      $newSentence = str_replace("?", " ", $newSentence);
      $newSentence = str_replace("`", " ", $newSentence);
      $newSentence = str_replace("~", " ", $newSentence);
      $newSentence = str_replace("@", " ", $newSentence);
      $newSentence = str_replace("#", " ", $newSentence);
      $newSentence = str_replace("$", " ", $newSentence);
      $newSentence = str_replace("%", " ", $newSentence);
      $newSentence = str_replace("^", " ", $newSentence);
      $newSentence = str_replace("&", " ", $newSentence);
      $newSentence = str_replace("*", " ", $newSentence);
      $newSentence = str_replace("_", " ", $newSentence);
      $newSentence = str_replace("+", " ", $newSentence);
      $newSentence = str_replace("[", " ", $newSentence);
      $newSentence = str_replace("]", " ", $newSentence);
      $newSentence = str_replace("<", " ", $newSentence);
      $newSentence = str_replace(">", " ", $newSentence);

      return $newSentence;
   }

   function tokenization($resultCaseFolding = "")
   {
      $hasilToken = [];
      // menghitung jumlah dan memecah kata dalam kalimat
      $token = str_word_count(strtolower($resultCaseFolding), 1);
      foreach ($token as $key => $val) {
         array_push($hasilToken, $val);
      }

      return json_encode($hasilToken);
   }

   function filtering($resultTokenization)
   {
      // require_once('Filtering.php');
      // $filtering = new Filtering();
      $this->CI = &get_instance();

      $hasilFilter = [];
      foreach (json_decode($resultTokenization) as $key => $value) {
         $proses = $this->CI->filtering->getToken($value, 9);
         array_push($hasilFilter, $proses);
      }

      $filterTerm = json_encode(array_values(array_filter($hasilFilter)));
      return $filterTerm;
   }

   function stemming($resultFiltering)
   {
      // include_once 'Stemming.php';
      $stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
      $stemmer = $stemmerFactory->createStemmer();

      $hasilStem = [];
      foreach (json_decode($resultFiltering) as $key => $value) {
         $hasil = $stemmer->stem($value); //proses stemming
         array_push($hasilStem, $hasil);
      }

      $result = json_encode($hasilStem);
      return $result;
   }

   function create($sentence = "", $type)
   {
      if ($sentence == null || empty($sentence)) {
         $result = [
            "status"    => true,
            "message"   => "Sucess",
            "data"      => null
         ];
         return $result;
      }

      if ($type == ANSWER) {
         $start = start_time();
         $returnCF = $this->caseFolding($sentence);
         // insert to db
         $returnToken = $this->tokenization($returnCF);
         // insert to db
         $returnFiltering = $this->filtering($returnToken);
         // insert to db
         $returnStemming = $this->stemming($returnFiltering);
         // insert to db
         $end = end_time($start);

         $result = [
            "status"    => true,
            "message"   => "Sucess Prepocessing",
            "time"      => $end,
            "data"      => $returnStemming
         ];
      } else if ($type == KEY_ANSWER) {
         // for key answer
      } else {
         // exception
      }

      return $result;
   }
}
