<?php
if (!function_exists("start_time")) {
   function start_time() {
      $r = explode(' ', microtime());
        $r = $r[1] + $r[0];
        return $r;
   }
}

if (!function_exists("end_time")) {
   function end_time($starttime, $message = "") {
      $r = explode(' ', microtime());
        $r = $r[1] + $r[0];
        $r = round($r - $starttime, 4);
        return $r ;
   }
}

if (!function_exists("human_rate")) {
   function human_rate($resultCS = 0.0): float {
      $rate  = $resultCS == 1;
      $rate1 = $resultCS < 1 && $resultCS > 0.9;
      $rate2 = $resultCS < 0.9 && $resultCS > 0.8;
      $rate3 = $resultCS < 0.8 && $resultCS > 0.7;
      $rate4 = $resultCS < 0.7 && $resultCS > 0.6;
      $rate5 = $resultCS < 0.6 && $resultCS > 0.5;
      $rate6 = $resultCS < 0.5 && $resultCS > 0.4;
      $rate7 = $resultCS < 0.4 && $resultCS > 0.3;
      $rate8 = $resultCS < 0.3 && $resultCS > 0.2;
      $rate9 = $resultCS < 0.2 && $resultCS > 0.1;
      
      if ($rate && $rate1) {
         return 100.0;
      } else if ($rate2) {
         return 90.0;
      } else if ($rate3) {
         return 80.0;
      } else if ($rate4) {
         return 70.0;
      } else if ($rate5) {
         return 60.0;
      } else if ($rate6) {
         return 50.0;
      } else if ($rate7) {
         return 40.0;
      } else if ($rate8) {
         return 30.0;
      } else if ($rate9) {
         return 20.0;
      } else {
         return 0.0;
      }

   }
}