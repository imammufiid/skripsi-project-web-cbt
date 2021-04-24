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
      $cs = round($resultCS, 2);
            
      if ($cs <= 1.0 && $cs > 0.9) {
         return 100.0;
      } else if ($cs < 0.9 && $cs > 0.8) {
         return 90.0;
      } else if ($cs < 0.8 && $cs > 0.7) {
         return 80.0;
      } else if ($cs < 0.7 && $cs > 0.6) {
         return 70.0;
      } else if ($cs < 0.6 && $cs > 0.5) {
         return 60.0;
      } else if ($cs < 0.5 && $cs > 0.4) {
         return 50.0;
      } else if ($cs < 0.4 && $cs > 0.3) {
         return 40.0;
      } else if ($cs < 0.3 && $cs > 0.2) {
         return 30.0;
      } else if ($cs < 0.2 && $cs > 0.1) {
         return 20.0;
      } else {
         return 0.0;
      }

   }
}