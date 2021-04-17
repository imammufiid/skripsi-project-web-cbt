<?php
if (!function_exists("intersect")) {
   function intersect($arrayOfAnswer, $arrayOfkey)
    {
        $intersect = array_intersect($arrayOfAnswer, $arrayOfkey); // hasil kata setelah disamakan dengan kata kunci jawaban
        $countTermAnswerInDoc = array_count_values($intersect); // menghitung jumlah kata per dokumen

        return $countTermAnswerInDoc;
    }
}

if (!function_exists("term_frecuency")) {
    function term_frecuency($arrayOfAnswer, $arrayOfkey) {
        $intersect = array_intersect($arrayOfAnswer, $arrayOfkey); // hasil kata setelah disamakan dengan kata kunci jawaban
        $intersectKey = array_intersect($arrayOfkey, $arrayOfkey); // hasil kata setelah disamakan dengan kata kunci jawaban
        $tfAnswer = array_count_values($intersect); // menghitung jumlah kata per dokumen
        $tfAnswerKey = array_count_values($intersectKey); // menghitung jumlah kata per dokumen

        return [
            "answer" => $tfAnswer,
            "key"    => $tfAnswerKey
        ];
    }
}