<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * KUISKU
 * name
 * email
 * 
 */

class CosineSimilarity
{
   protected $data_a;
   protected $data_b;

   public function __construct(array $data_a, array $data_b)
   {
      $this->data_a = $data_a;
      $this->data_b = $data_b;
   }

   /**
    * Mengambil nilai similaritas (kesamaan)
    * Rentang hasil: 0 - 1
    * Rumus: sum(ai * bi) / (root(sum(ai^2)) * root(sum(bi^2)))
    *
    * @return float
    */
   public function calculate(): float
   {
      $top = $this->getTop();
      $div = $this->getDivider();

      return $top / $div;
   }

   /**
    * Kalkulasi nilai atas (angka yang mau dibagi)
    * Rumus: sum(ai * bi)
    *
    * @return float
    */
   private function getTop(): float
   {
      $data_a = $this->data_a;
      $data_b = $this->data_b;

      $sum = 0;
      foreach ($data_a as $i => $a) {
         $b = isset($data_b[$i]) ? $data_b[$i] : null;

         // Jika salah satu dari a atau b nilainya null ...
         if (is_null($a) || is_null($b)) {
            continue; // ... skip
         }

         $sum += $a * $b;
      }

      return $sum;
   }

   /**
    * Kalkulasi nilai pembagi
    * Rumus: root(sum(ai^2)) * root(sum(bi^2))
    *
    * @return float
    */
   private function getDivider(): float
   {
      $data_a = $this->data_a;
      $data_b = $this->data_b;

      $root_sum_square_a = $this->rootSumSquares($data_a);
      $root_sum_square_b = $this->rootSumSquares($data_b);
      return $root_sum_square_a * $root_sum_square_b;
   }

   private function rootSumSquares(array $data): float
   {
      // Kalkulasi nilai kuadrat masing-masing item dari data
      // [1, null, 2] -> [1, 0, 4] (null diubah jadi 0)
      $squares = array_map(function ($x) {
         return is_null($x) ? 0 : $x * $x;
      }, $data);

      // Summary hasil kuadrat
      // [1, 0, 4] -> 5
      $sum_squares = array_sum($squares);
      // Kembalikan akar dari summary
      return sqrt($sum_squares);
   }

   /**
    * Static function untuk menyederhanakan
    * pemanggilan fungsi calculate tanpa harus
    * inisiasi class terlebih dehulu
    *
    * @return float
    */
   public static function calc(array $data_a, array $data_b): float
   {
      return (new static($data_a, $data_b))->calculate();
   }


   /**
    * function untuk memproses kalimat/dokument
    * 
    * @param $sentence string json_encode
    * @param $sentencekey string json_encode
    *
    */
   function getData($sentence, $sentenceKey)
   {
      $arrayOfSentence = json_decode($sentence);
      $arrayOfSentenceKey = json_decode($sentenceKey);
      $countTermSentenceKey = array_count_values($arrayOfSentenceKey);

      $resultIntersect = $this->intersect($arrayOfSentence, $arrayOfSentenceKey);

      $result = $this->calc($resultIntersect, $countTermSentenceKey);

      return $result;
   }

   /**
    * function untuk menyamakan term kalimat/dokumen dgn kalimat/dokumen key
    * dan menghitung term per kalimat/dokumen
    * 
    * @param $sentence array
    * @param $sentencekey array
    *
    * @return array
    */
   function intersect($arrayOfAnswer = [], $arrayOfkey = [])
   {
      $intersect = array_intersect($arrayOfAnswer, $arrayOfkey); // hasil kata setelah disamakan dengan kata kunci jawaban
      $countTermAnswerInDoc = array_count_values($intersect); // menghitung jumlah kata per dokumen

      return $countTermAnswerInDoc;
   }
}
