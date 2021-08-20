<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * KUISKU
 * name
 * email
 * 
 */

class Filtering
{
    private $stopwords = array(
        "ada", "adalah", "adanya", "adapun", "agak", "agaknya", "agar",
        "akan", "akankah", "akhir", "akhiri", "akhirnya", "aku", "akulah",
        "amat", "amatlah", "anda", "andalah", "antar", "antara", "antaranya",
        "apa", "apaan", "apabila", "apakah", "apalagi", "apatah", "artinya",
        "asal", "asalkan", "atas", "atau", "ataukah", "ataupun", "awal", "awalnya",
        "bagai", "bagaikan", "bagaimana", "bagaimanakah", "bagaimanapun", "bagi",
        "bagian", "bahkan", "bahwa", "bahwasanya", "baik", "bakal", "bakalan",
        "balik", "banyak", "bapak", "baru", "bawah", "beberapa", "begini",
        "beginian", "beginikah", "beginilah", "begitu", "begitukah", "begitulah",
        "begitupun", "bekerja", "belakang", "belakangan", "belum", "belumlah",
        "benar", "benarkah", "benarlah", "berada", "berakhir", "berakhirlah",
        "berakhirnya", "berapa", "berapakah", "berapalah", "berapapun", "berarti",
        "berawal", "berbagai", "berdatangan", "beri", "berikan", "berikut",
        "berikutnya", "berjumlah", "berkali-kali", "berkata", "berkehendak",
        "berkeinginan", "berkenaan", "berlainan", "berlalu", "berlangsung",
        "berlebihan", "bermacam", "bermacam-macam", "bermaksud", "bermula",
        "bersama", "bersama-sama", "bersiap", "bersiap-siap", "bertanya",
        "bertanya-tanya", "berturut", "berturut-turut", "bertutur", "berujar",
        "berupa", "besar", "betul", "betulkah", "biasa", "biasanya", "bila",
        "bilakah", "bisa", "bisakah", "boleh", "bolehkah", "bolehlah", "buat",
        "bukan", "bukankah", "bukanlah", "bukannya", "bulan", "bung", "cara",
        "caranya", "cukup", "cukupkah", "cukuplah", "cuma", "dahulu", "dalam", "dan",
        "dapat", "dari", "daripada", "datang", "dekat", "demi", "demikian",
        "demikianlah", "dengan", "depan", "di", "dia", "diakhiri", "diakhirinya",
        "dialah", "diantara", "diantaranya", "diberi", "diberikan", "diberikannya",
        "dibuat", "dibuatnya", "didapat", "didatangkan", "digunakan", "diibaratkan",
        "diibaratkannya", "diingat", "diingatkan", "diinginkan", "dijawab", "dijelaskan",
        "dijelaskannya", "dikarenakan", "dikatakan", "dikatakannya", "dikerjakan",
        "diketahui", "diketahuinya", "dikira", "dilakukan", "dilalui", "dilihat",
        "dimaksud", "dimaksudkan", "dimaksudkannya", "dimaksudnya", "diminta", "dimintai",
        "dimisalkan", "dimulai", "dimulailah", "dimulainya", "dimungkinkan", "dini",
        "dipastikan", "diperbuat", "diperbuatnya", "dipergunakan", "diperkirakan",
        "diperlihatkan", "diperlukan", "diperlukannya", "dipersoalkan", "dipertanyakan",
        "dipunyai", "diri", "dirinya", "disampaikan", "disebut", "disebutkan", "disebutkannya",
        "disini", "disinilah", "ditambahkan", "ditandaskan", "ditanya", "ditanyai",
        "ditanyakan", "ditegaskan", "ditujukan", "ditunjuk", "ditunjuki", "ditunjukkan",
        "ditunjukkannya", "ditunjuknya", "dituturkan", "dituturkannya", "diucapkan",
        "diucapkannya", "diungkapkan", "dong", "dua", "dulu", "empat", "enggak",
        "enggaknya", "entah", "entahlah", "guna", "gunakan", "hal", "hampir", "hanya",
        "hanyalah", "hari", "harus", "haruslah", "harusnya", "hendak", "hendaklah", "hendaknya",
        "hingga", "ia", "ialah", "ibarat", "ibaratkan", "ibaratnya", "ibu", "ingat",
        "ingat-ingat", "ingin", "inginkah", "inginkan", "ini", "inikah", "inilah",
        "itu", "itukah", "itulah", "jadi", "jadilah", "jadinya", "jangan", "jangankan",
        "janganlah", "jauh", "jawab", "jawaban", "jawabnya", "jelas", "jelaskan",
        "jelaslah", "jelasnya", "jika", "jikalau", "juga", "jumlah", "jumlahnya", "justru",
        "kala", "kalau", "kalaulah", "kalaupun", "kalian", "kami", "kamilah", "kamu",
        "kamulah", "kan", "kapan", "kapankah", "kapanpun", "karena", "karenanya", "kasus",
        "kata", "katakan", "katakanlah", "katanya", "ke", "keadaan", "kebetulan", "kecil",
        "kedua", "keduanya", "keinginan", "kelamaan", "kelihatan", "kelihatannya", "kelima",
        "keluar", "kembali", "kemudian", "kemungkinan", "kemungkinannya", "kenapa",
        "kepada", "kepadanya", "kesampaian", "keseluruhan", "keseluruhannya", "keterlaluan",
        "ketika", "khususnya", "kini", "kinilah", "kira", "kira-kira", "kiranya", "kita",
        "kitalah", "kok", "kurang", "lagi", "lagian", "lah", "lain", "lainnya", "lalu",
        "lama", "lamanya", "lanjut", "lanjutnya", "lebih", "lewat", "lima", "luar",
        "macam", "maka", "makanya", "makin", "malah", "malahan", "mampu", "mampukah",
        "mana", "manakala", "manalagi", "masa", "masalah", "masalahnya", "masih",
        "masihkah", "masing", "masing-masing", "mau", "maupun", "melainkan", "melakukan",
        "melalui", "melihat", "melihatnya", "memang", "memastikan", "memberi", "memberikan",
        "membuat", "memerlukan", "memihak", "meminta", "memintakan", "memisalkan",
        "memperbuat", "mempergunakan", "memperkirakan", "memperlihatkan", "mempersiapkan",
        "mempersoalkan", "mempertanyakan", "mempunyai", "memulai", "memungkinkan",
        "menaiki", "menambahkan", "menandaskan", "menanti", "menanti-nanti", "menantikan",
        "menanya", "menanyai", "menanyakan", "mendapat", "mendapatkan",
        "mendatang", "mendatangi", "mendatangkan", "menegaskan", "mengakhiri", "mengapa",
        "mengatakan", "mengatakannya", "mengenai", "mengerjakan", "mengetahui", "menggunakan",
        "menghendaki", "mengibaratkan", "mengibaratkannya", "mengingat", "mengingatkan",
        "menginginkan", "mengira", "mengucapkan", "mengucapkannya", "mengungkapkan", "menjadi",
        "menjawab", "menjelaskan", "menuju", "menunjuk", "menunjuki", "menunjukkan",
        "menunjuknya", "menurut", "menuturkan", "menyampaikan", "menyangkut", "menyatakan",
        "menyebutkan", "menyeluruh", "menyiapkan", "merasa", "mereka", "merekalah",
        "merupakan", "meski", "meskipun", "meyakini", "meyakinkan", "minta", "mirip",
        "misal", "misalkan", "misalnya", "mula", "mulai", "mulailah", "mulanya", "mungkin",
        "mungkinkah", "nah", "naik", "namun", "nanti", "nantinya", "nyaris", "nyatanya",
        "oleh", "olehnya", "pada", "padahal", "padanya", "pak", "paling", "panjang",
        "pantas", "para", "pasti", "pastilah", "penting", "pentingnya", "per", "percuma",
        "perlu", "perlukah", "perlunya", "pernah", "persoalan", "pertama", "pertama-tama",
        "pertanyaan", "pertanyakan", "pihak", "pihaknya", "pukul", "pula", "pun", "punya",
        "rasa", "rasanya", "rata", "rupanya", "saat", "saatnya", "saja", "sajalah", "saling",
        "sama", "sama-sama", "sambil", "sampai", "sampai-sampai", "sampaikan", "sana",
        "sangat", "sangatlah", "satu", "saya", "sayalah", "se", "sebab", "sebabnya",
        "sebagai", "sebagaimana", "sebagainya", "sebagian", "sebaik", "sebaik-baiknya",
        "sebaiknya", "sebaliknya", "sebanyak", "sebegini", "sebegitu", "sebelum", "sebelumnya",
        "sebenarnya", "seberapa", "sebesar", "sebetulnya", "sebisanya", "sebuah", "sebut",
        "sebutlah", "sebutnya", "secara", "secukupnya", "sedang", "sedangkan", "sedemikian",
        "sedikit", "sedikitnya", "seenaknya", "segala", "segalanya", "segera", "seharusnya",
        "sehingga", "seingat", "sejak", "sejauh", "sejenak", "sejumlah", "sekadar", "sekadarnya",
        "sekali", "sekali-kali", "sekalian", "sekaligus", "sekalipun", "sekarang", "sekarang",
        "sekecil", "seketika", "sekiranya", "sekitar", "sekitarnya", "sekurang-kurangnya",
        "sekurangnya", "sela", "selain", "selaku", "selalu", "selama", "selama-lamanya",
        "selamanya", "selanjutnya", "seluruh", "seluruhnya", "semacam", "semakin", "semampu",
        "semampunya", "semasa", "semasih", "semata", "semata-mata", "semaunya", "sementara",
        "semisal", "semisalnya", "sempat", "semua", "semuanya", "semula", "sendiri",
        "sendirian", "sendirinya", "seolah", "seolah-olah", "seorang", "sepanjang",
        "sepantasnya", "sepantasnyalah", "seperlunya", "seperti", "sepertinya", "sepihak",
        "sering", "seringnya", "serta", "serupa", "sesaat", "sesama", "sesampai", "sesegera",
        "sesekali", "seseorang", "sesuatu", "sesuatunya", "sesudah", "sesudahnya", "setelah",
        "setempat", "setengah", "seterusnya", "setiap", "setiba", "setibanya",
        "setidak-tidaknya", "setidaknya", "setinggi", "seusai", "sewaktu", "siap",
        "siapa", "siapakah", "siapapun", "sini", "sinilah", "soal", "soalnya", "suatu",
        "sudah", "sudahkah", "sudahlah", "supaya", "tadi", "tadinya", "tahu", "tahun",
        "tak", "tambah", "tambahnya", "tampak", "tampaknya", "tandas", "tandasnya", "tanpa",
        "tanya", "tanyakan", "tanyanya", "tapi", "tegas", "tegasnya", "telah", "tempat",
        "tengah", "tentang", "tentu", "tentulah", "tentunya", "tepat", "terakhir", "terasa",
        "terbanyak", "terdahulu", "terdapat", "terdiri", "terhadap", "terhadapnya",
        "teringat", "teringat-ingat", "terjadi", "terjadilah", "terjadinya", "terkira",
        "terlalu", "terlebih", "terlihat", "termasuk", "ternyata", "tersampaikan",
        "tersebut", "tersebutlah", "tertentu", "tertuju", "terus", "terutama", "tetap",
        "tetapi", "tiap", "tiba", "tiba-tiba", "tidak", "tidakkah", "tidaklah", "tiga",
        "tinggi", "toh", "tunjuk", "turut", "tutur", "tuturnya", "ucap", "ucapnya",
        "ujar", "ujarnya", "umum", "umumnya", "ungkap", "ungkapnya", "untuk", "usah",
        "usai", "waduh", "wah", "wahai", "waktu", "waktunya", "walau", "walaupun", "wong",
        "yaitu", "yakin", "yakni", "yang"
    );

    protected $stopwords2 = array(
        "ajak", "akan", "beliau", "khan", "lah", "dong", "ahh", "sob", "elo", "so",
        "kena", "kenapa", "yang", "dan", "tidak", "agak", "kata", "bilang", "sejak",
        "kagak", "cukup", "jua", "cuma", "hanya", "karena", "oleh", "lain", "setiap",
        "untuk", "dari", "dapat", "dapet", "sudah", "udah", "selesai", "punya", "belum",
        "boleh", "gue", "gua", "aku", "kamu", "dia", "mereka", "kami", "kita", "jika",
        "bila", "kalo", "kalau", "dalam", "nya", "atau", "seperti", "mungkin", "sering",
        "kerap", "acap", "harus", "banyak", "doang", "kemudian", "nyala", "mati",
        "milik", "juga", "mau", "dimana", "apa", "kapan", "kemana", "selama", "siapa",
        "mengapa", "dengan", "kalian", "bakal", "bakalan", "tentang", "setelah", "hadap",
        "semua", "hampir", "antara", "sebuah", "apapun", "sebagai", "di", "tapi", "lainnya",
        "bagaimana", "namun", "tetapi", "biar", "pun", "itu", "ini", "suka", "paling",
        "mari", "ayo", "barangkali", "mudah", "kali", "sangat", "banget", "disana", "disini",
        "terlalu", "lalu", "terus", "trus", "sungguh", "telah", "mana", "apanya", "ada",
        "adanya", "adalah", "adapun", "agaknya", "agar", "akankah", "akhirnya", "akulah",
        "amat", "amatlah", "anda", "andalah", "antar", "diantaranya", "antaranya", "diantara",
        "apaan", "apabila", "apakah", "apalagi", "apatah", "ataukah", "ataupun", "bagai",
        "bagaikan", "sebagainya", "bagaimanapun", "sebagaimana", "bagaimanakah", "bagi",
        "bahkan", "bahwa", "bahwasanya", "sebaliknya", "sebanyak", "beberapa", "seberapa",
        "begini", "beginian", "beginikah", "beginilah", "sebegini", "begitu", "begitukah",
        "begitulah", "begitupun", "sebegitu", "belumlah", "sebelum", "sebelumnya", "sebenarnya",
        "berapa", "berapakah", "berapalah", "berapapun", "betulkah", "sebetulnya", "biasa",
        "biasanya", "bilakah", "bisa", "bisakah", "sebisanya", "bolehkah", "bolehlah", "buat",
        "bukan", "bukankah", "bukanlah", "bukannya", "percuma", "dahulu", "daripada", "dekat",
        "demi", "demikian", "demikianlah", "sedemikian", "depan", "dialah", "dini", "diri",
        "dirinya", "terdiri", "dulu", "enggak", "enggaknya", "entah", "entahlah", "terhadap",
        "terhadapnya", "hal", "hanyalah", "haruslah", "harusnya", "seharusnya", "hendak",
        "hendaklah", "hendaknya", "hingga", "sehingga", "ia", "ialah", "ibarat", "ingin",
        "inginkah", "inginkan", "inikah", "inilah", "itukah", "itulah", "jangan", "jangankan",
        "janganlah", "jikalau", "justru", "kala", "kalaulah", "kalaupun", "kamilah", "kamulah",
        "kan", "kau", "kapankah", "kapanpun", "dikarenakan", "karenanya", "ke", "kecil",
        "kepada", "kepadanya", "ketika", "seketika", "khususnya", "kini", "kinilah", "kiranya",
        "sekiranya", "kitalah", "kok", "lagi", "lagian", "selagi", "melainkan", "selaku",
        "melalui", "lama", "lamanya", "selamanya", "lebih", "terlebih", "bermacam", "macam",
        "semacam", "maka", "makanya", "makin", "malah", "malahan", "mampu", "mampukah",
        "manakala", "manalagi", "masih", "masihkah", "semasih", "masing", "maupun", "semaunya",
        "memang", "merekalah", "meski", "meskipun", "semula", "mungkinkah", "nah", "nanti",
        "nantinya", "nyaris", "olehnya", "seorang", "seseorang", "pada", "padanya", "padahal",
        "sepanjang", "pantas", "sepantasnya", "sepantasnyalah", "para", "pasti", "pastilah",
        "per", "pernah", "pula", "merupakan", "rupanya", "serupa", "saat", "saatnya",
        "sesaat", "aja", "saja", "sajalah", "saling", "bersama", "sama", "sesama", "sambil",
        "sampai", "sana", "sangatlah", "saya", "sayalah", "se", "sebab", "sebabnya",
        "tersebut", "tersebutlah", "sedang", "sedangkan", "sedikit", "sedikitnya", "segala",
        "segalanya", "segera", "sesegera", "sejenak", "sekali", "sekalian", "sekalipun",
        "sesekali", "sekaligus", "sekarang", "sekitar", "sekitarnya", "sela", "selain",
        "selalu", "seluruh", "seluruhnya", "semakin", "sementara", "sempat", "semuanya",
        "sendiri", "sendirinya", "seolah", "sepertinya", "seringnya", "serta", "siapakah",
        "siapapun", "disinilah", "sini", "sinilah", "sesuatu", "sesuatunya", "suatu",
        "sesudah", "sesudahnya", "sudahkah", "sudahlah", "supaya", "tadi", "tadinya", "tak",
        "tanpa", "tentu", "tentulah", "tertentu", "seterusnya", "tiap", "setidaknya",
        "tidakkah", "tidaklah", "toh", "waduh", "wah", "wahai", "sewaktu", "walau", "walaupun",
        "wong", "yaitu", "yakni"
    );

    public function getToken($token, $nbrwords2 = 5)
    {
        // include 'koneksi.php';
        $filter = str_word_count($token, 1); // mengambil term
        array_walk($filter, array(
            $this,
            'filter'
        ));
        $filter = array_diff($filter, $this->stopwords2); // mencari yg beda antar 2 array
        $wordCount = array_count_values($filter); // menghitung jumlah kata yg sama
        arsort($wordCount);

        $jumlah = count($wordCount);
        // $masukkan3;
        $hasilFilter = "";
        foreach ($wordCount as $key => $hasil) {
            $hasilFilter = $key;
        }
        $wordCount = array_slice($wordCount, 0);
        array_keys($wordCount);
        return $hasilFilter;
    }
    private function filter(&$hasil, $key)
    {
        $hasil = strtolower($hasil);
    }
    private function setStopwords()
    {
        $this->stopwords = array();
    }
}
