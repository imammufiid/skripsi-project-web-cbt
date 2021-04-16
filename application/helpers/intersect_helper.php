<?php
if (!function_exists("intersect")) {
   function intersect($arrayOfAnswer, $arrayOfkey)
    {
        $intersect = array_intersect($arrayOfAnswer, $arrayOfkey); // hasil kata setelah disamakan dengan kata kunci jawaban
        $countTermAnswerInDoc = array_count_values($intersect); // menghitung jumlah kata per dokumen

        return $countTermAnswerInDoc;
    }
}