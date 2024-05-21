class FaqItem {
  String title;
  String description;

  FaqItem({required this.title, required this.description});
}

final faqItem = [
  FaqItem(
    title:
        '''1. Apa itu aplikasi "Deteksi Dini PMK pada Sapi Berdasarkan Image?"''',
    description:
        "Aplikasi ini adalah alat bantu berbasis teknologi yang dirancang untuk mendeteksi dini penyakit mulut dan kuku (PMK) pada sapi melalui analisis gambar. Dengan menggunakan teknologi pengenalan gambar dan kecerdasan buatan, aplikasi ini dapat mengidentifikasi tanda-tanda PMK dari foto-foto sapi.",
  ),
  FaqItem(
      title: "2. Bagaimana cara kerja aplikasi ini?",
      description:
          "Aplikasi ini bekerja dengan memanfaatkan algoritma pengenalan gambar. Pengguna cukup mengambil foto bagian tubuh sapi yang dicurigai terkena PMK, seperti mulut, kaki, atau kuku. Gambar tersebut kemudian diunggah ke aplikasi, dan sistem akan menganalisisnya untuk mendeteksi tanda-tanda PMK."),
  FaqItem(
      title: "3. Apa saja gejala PMK yang dapat dideteksi oleh aplikasi ini?",
      description:
          "Aplikasi ini dirancang untuk mendeteksi beberapa gejala umum PMK, seperti luka atau lesi di mulut, air liur berlebihan, lepuh atau luka pada kaki, dan perubahan pada kuku."),
  FaqItem(
      title: "4. Apakah aplikasi ini bisa diandalkan?",
      description:
          "Aplikasi ini menggunakan algoritma kecerdasan buatan yang telah dilatih dengan ribuan gambar untuk memastikan akurasi yang tinggi. Meskipun demikian, hasil deteksi dari aplikasi sebaiknya dikonfirmasi dengan pemeriksaan fisik oleh dokter hewan."),
  FaqItem(
      title: "5. Bagaimana cara mengunduh dan menggunakan aplikasi ini?",
      description: '''
  Aplikasi ini tersedia di Google Play Store dan Apple App Store. Setelah mengunduh dan menginstal aplikasi, pengguna dapat mengikuti langkah-langkah berikut:

  Buka aplikasi dan daftar/masuk dengan akun pengguna.
  Pilih opsi "Deteksi PMK".
  Ambil foto bagian tubuh sapi yang dicurigai terkena PMK atau unggah foto yang sudah ada.
  Tunggu beberapa saat hingga aplikasi selesai menganalisis gambar.
  Lihat hasil analisis dan rekomendasi tindakan selanjutnya.
  '''),
  FaqItem(
      title: "6. Apakah data yang diunggah aman?",
      description:
          "Ya, semua data yang diunggah ke aplikasi dijaga kerahasiaannya dan hanya digunakan untuk keperluan analisis PMK. Aplikasi ini menggunakan enkripsi data untuk memastikan keamanan informasi pengguna."),
  FaqItem(
      title:
          "7. Apa yang harus dilakukan jika hasil deteksi menunjukkan tanda-tanda PMK?",
      description:
          "Jika aplikasi mendeteksi adanya tanda-tanda PMK, disarankan untuk segera menghubungi dokter hewan untuk pemeriksaan lebih lanjut dan mendapatkan penanganan yang tepat."),
  FaqItem(
      title: "8. Apakah aplikasi ini gratis?",
      description:
          "Aplikasi ini tersedia dalam versi gratis dengan fitur dasar. Untuk fitur lanjutan dan analisis yang lebih mendetail, pengguna dapat berlangganan versi premium."),
  FaqItem(
      title: "9. Apakah aplikasi ini bisa digunakan untuk hewan lain selain sapi?",
      description:
      "Saat ini, aplikasi ini khusus dirancang untuk mendeteksi PMK pada sapi. Versi untuk hewan lain mungkin akan dikembangkan di masa depan berdasarkan permintaan dan kebutuhan."),
  FaqItem(
      title: "10. Bagaimana cara melaporkan masalah atau memberi masukan tentang aplikasi ini?",
      description:
      '''Pengguna dapat melaporkan masalah atau memberikan masukan melalui menu "Bantuan" atau "Hubungi Kami" di dalam aplikasi. Tim dukungan kami akan siap membantu dan menanggapi setiap masukan dengan cepat.'''),
];
