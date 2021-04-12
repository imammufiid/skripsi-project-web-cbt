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