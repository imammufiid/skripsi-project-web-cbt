<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class SimpleChecker extends CI_Controller
{
    private $kunci_jawaban = [
        "Citra, gagasan, dan gaya hidup yang baru menyebar dengan sangat cepat ke seluruh pelosok dunia",
        "Belum, karena belum bisa menciptakan produk global dan tingkat Pendidikan masyarakat belum mampu bersaing dengan bangsa lain",
        "Berkembang pesatnya teknologi informasi, Adanya integrase ekonomi dunia",
        "Mengajukan rancangan undang-undang yang berkaitan dengan otonomi daerah",
        "Mengikuti pemilu yang diadakan"
    ];

    private $jawaban_siswa = [
        [
            // 1
            "Kebudayaan asing yang masuk ke dalam Indonesia, kebudayaan merupakan adat dan istiadat yang dibuat oleh leluhur terdahulu",
            "Siap, karena bangsa Indonesia sudah bisa mengatasi pengaruh globalisasi yang terjadi di Indonesia",
            "Perkembangan ilmu pengetahuan dan teknologi, mudahnya transportasi",
            "Bertugas membuat undang-undang berkaitan dengan otonomi daerah",
            "Mengikuti pemilu yang terjadi di Indonesia"
        ],
        [
            // 2
            "Suatu kegiatan masyarakat yang menjadi ciri khas",
            "Siap ",
            "Mudah diakses, mudah dipahami",
            "Menyampaikan aspirasi rakyat, mengesahkan undang-undang ",
            "Mengikuti pemilu "
        ],
        [
            // 3
            "Kebudayaan kebarat-baratan yang mempengaruhi penampilan gaya perilaku, kebudayaan yang popular di kalangan anak muda",
            "Belum, karena masih harus memperbaiki lagi agar dampak negatif tidak berdampak besar",
            "perkembangan teknologi dan pengetahuan, kerjasama antar negara ",
            "Bertugas mengatur daerah, merancang undang-undang, mengatur keuangan, mengawasi pelaksaan undang-undang ",
            "Antusias mengikuti pemilu, menggunakan hak pilihnya"
        ],
        [
            // 4
            "Kebudayaan : Segala sesuatu yang berkaitan dengan akal dan budi manusia. Kebudayaan pop : kebudayaan yang populer/merambah ke seluruh dunia",
            "Belum, karena kurangnya edukasi pada masyarakat terhadap dampak negatif dari globalisasi ",
            "Teknologi dan perdagangan bebas ",
            "Merancang undang-undang otonomi daerah, memberikan rancangan undang-undang pada DPR, mengawasi dan melaksanakan undang-undang",
            "mengikuti pelaksanaan pemilu "
        ],
        [
            // 5
            "Kebudayaan : segala sesuatu yang berkaitan dengan budi & akal manusia, Pop : populer/terkenal ",
            "Siap, karena bangsa Indonesia mempunayi pegangan atau dasar yakni Pancasila",
            "Peningkatan ilmu pengetahuan dan teknologi, perdangan bebas ",
            "Merancang undang-undang otonomi daerah, memberikan rancangan undang-undang kepada DPR, mengawasi pelaksaan undang-undang",
            "Ikut serta dalam pemilu "
        ],
        [
            // 6
            "Kebudayaan yang memakai budaya pop",
            "Belum, karena globalisasi sangat rumit ",
            "",
            "Untuk mengawasi masyarakat/daerah/pedesaan ",
            "Untuk membahas negara Indonesia "
        ],
        [
            // 7
            "Kebudayaan pop adalah kebudayaan asing yang masik ke dalam negeri, kebudayaan merupakan adat istiadat yang turun menurun dari nenek moyang terdahulu ",
            "Sudah siap, untuk menerima segala pengaruh globalisasi kerana mayoritas masyarakat bangsa Indonesia sudah bisa memilih dan memilah pengaruh globalisasi mana yang baik dan buruk ",
            "Factor dalam teknologi dan informasi, perdagangan bebas ",
            "Tugas : merancang undang-undang yang berkaitan dengan otonomi daerah. Wewenang : mengwasi pembuatan undang-undang ",
            "Mengikuti pemilu "
        ],
        [
            // 8
            "Budaya yang dimiliki setiap daerah yang mengamalkan nilai nilai luhur bangsa ",
            "Belum, karena Indonesia perlu mengikutkan social budaya dan sosialisasi ",
            "Pemebebasan HAM, kerjasama antar negara",
            "merancang undang-undang otonomi daerah ",
            "mengawasi jalannya pemilu "
        ],
        [
            // 9
            "Kebudayaan yang mengarah kebarat-baratan",
            "Siap saja, tetapi masyarakat harus bisa memilah-milah agar tidak terjerumus dalam dampak globalisasi ",
            "Pembebasan HAM, pembebasan media dan pers ",
            "Merancang undang-undang otonomi daerah, mengawasi pelaksaan undang-undang",
            "Mengikuti pemilu "
        ],
        [
            // 10
            "Kebudayaan yang berasal dari barat dapat mempengaruhi penampilan, pergaulan pada Indonesia, merupakan gagasan dari karya masyarakat ",
            "Siap, tapi masyarakat harus bisa memilah segala dampak dari globalisasi, agar tidak terjerumus ke dalam hal yang tidak baik dan terkena dampak negatif ",
            "Pembebasan HAM, kerjasama antar negara, kebebasan media atau pers ",
            "Merancang undang-undang dasar otonomi daerah, dan mengawasi pelaksanaan undang-undang ",
            "Mengikuti adanya kegiatan pemilu "
        ],
        [
            // 11
            "Kebudayaan yang dari barat kenudian diadaptasi dari barbagai negara ",
            "Menurut saya Indonesia sudah siap menerima proses globalisasi hal itu yang menjadi contoh adalah yaitu orang-orang sekarang mulai menggunakan aplikasi belanja online untuk menjual/membeli barang ",
            "Perdagangn bebas dan kerjasama antar negara ",
            "Merancang undang-undang uang berkaitan otonomi daerah dan mengawasi jalannya pelaksanaan undang-undang ",
            "Mengawasi pemilu dan pertisipasi dalam hak pilih "
        ],
        [
            // 12
            "Kebudayaan adalah bentuk apresiasi masyarakat terhadap peninggalan nenek moyang ",
            "Belum, kerana masih banyak pemuda yang belum menanamkan rasa nasionalisme ",
            "Pembebasan HAM, kerjasama antar negara ",
            "Merancang undang-undang otonomi daerah ",
            "Untuk mengikuti adanya pemilu "
        ]
    ];

    public function index()
    {
        $tmKunciJawaban = []; // array of result text mining kunci jawaban
        foreach ($this->kunci_jawaban as $key => $value) {
            $itemTmKunciJawaban = $this->prepocessing->create($value);
            array_push($tmKunciJawaban, $itemTmKunciJawaban);
        }

        $tmJawabanSiswa = []; // semua siswa
        foreach ($this->jawaban_siswa as $key => $value) {
            $tmItemJawabanSiswa = []; // masing-masing siswa
            foreach ($value as $key => $item) {
                $itemJawabanSiswa = $this->prepocessing->create($item);
                array_push($tmItemJawabanSiswa, $itemJawabanSiswa);
            }
            array_push($tmJawabanSiswa, $tmItemJawabanSiswa);
        }

        $soalNo = 2;
        $allData = [];
        foreach ($tmJawabanSiswa as $noSiswa => $jawabanSiswa) {
            $synonymRecognition = $this->_synonym_recognition(
                $jawabanSiswa[$soalNo - 1]['stemming'], 
                $tmKunciJawaban[$soalNo - 1]["stemming"]
            );
            
            $calc = $this->_calculateCosineSimilarity(
                $synonymRecognition["answer"], 
                $synonymRecognition["answer_key"],
                10
            );

            $itemData = [
                "no_siswa"  => $noSiswa + 1,
                "tm_kunci"  => $tmKunciJawaban[$soalNo - 1],
                "tm_siswa"  => $jawabanSiswa[$soalNo - 1],
                "sr_kunci"  => $synonymRecognition["answer_key"],
                "sr_siswa"  => $synonymRecognition["answer"],
                "result_cs"  => $calc["tessoal_nilai"],
                "result_nilai"  => $calc["tessoal_human_point"]
            ];

            array_push($allData, $itemData);

        }

        echo json_encode($allData);
        
    }

    private function _synonym_recognition($answer, $answerKey)
    {
        // var_dump($answer);
        // var_dump($answerKey);
        // load helper
        $this->load->helper('intersect_helper');
        $this->load->model('cbt_text_mining_model');

        // * Synonym Recognition
        // TODO : get same value of array answer and key
        $sameValue = array_intersect(
            json_decode($answer),
            json_decode($answerKey)
        );
        // ! if $sameValue is empty return 0

        // TODO : get different value off array answer and key
        $diffAnswer = array_diff(
            json_decode($answer),
            json_decode($answerKey)
        );

        $diffAnswerKey = array_diff(
            json_decode($answerKey),
            json_decode($answer)
        );

        // TODO : from different value check synonym from db
        // ! check if empty diff array
        // ! if empty next
        $answerSynonym = [];
        if ($diffAnswer != null || !empty($diffAnswer)) {
            $answerSynonym = $this->cbt_text_mining_model->synonym_recognition($diffAnswer);
        }

        // var_dump($answerSynonym);
        
        $answerKeySynonym = [];
        if ($diffAnswerKey != null || !empty($diffAnswerKey)) {
            $answerKeySynonym = $this->cbt_text_mining_model->synonym_recognition($diffAnswerKey);
        }

        // var_dump($answerKeySynonym);

        // TODO : and merge to array same value
        $newAnswer = array_merge($sameValue, $answerSynonym);
        $newAnswerKey = array_merge($sameValue, $answerKeySynonym);

        $data = [
            "answer"         => $newAnswer,
            "answer_key"    => $newAnswerKey
        ];
        // var_dump($data);

        return $data;
    }

    private function _calculateCosineSimilarity(
		$answer = "",
		$answerKey  = "",
		float $scoreRight = 0.0
	) {
		// load helper
		$this->load->helper('intersect_helper');

		// --------------------------
		// 3. calculate term frekuensi
		$termFrecuency = term_frecuency(
			$answer,
			$answerKey
		);
		// 4. get score right from params
		// 5. calculate cosine similarity with lib Cosine_Similarity
		$calc = 0;
		if (empty($termFrecuency["answer"]) || empty($termFrecuency["key"])) {
			$data['tessoal_nilai'] = 0;
			$data['tessoal_human_point'] = 3;
		} else {
			$this->load->library("MyCs");
			$calc = $this->mycs->calculate($termFrecuency["answer"], $termFrecuency["key"]);
			$humanRate = human_rate($calc, $scoreRight);
			$data['tessoal_nilai'] = $calc;
			$data['tessoal_human_point'] = $humanRate;
		}

		$result = [
			"data"	=> $data
		];
		return $data;
	}
}
