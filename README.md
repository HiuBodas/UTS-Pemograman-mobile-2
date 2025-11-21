# UTS-Pemograman-mobile-2
1. State management dengan Cubit membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis karena Cubit mampu menyimpan dan mengelola state transaksi secara terpusat, seperti daftar pesanan, jumlah item, dan total harga. Perhitungan diskon dilakukan di dalam Cubit sehingga logika bisnis tidak bercampur dengan UI. Setiap ada perubahan transaksi seperti menambah, menghapus, atau mengubah jumlah item, Cubit otomatis menghitung ulang total harga termasuk diskon dan mengirim state terbaru ke UI secara reaktif. Hal ini membuat tampilan harga dan diskon selalu ter-update, lebih rapi, serta meminimalkan bug karena semua perhitungan dilakukan di satu tempat.

2. Perbedaan antara diskon per item dan diskon total transaksi yaitu: diskon per item merupakan potongan harga yang diberikan pada setiap produk secara individual, misalnya makanan harga Rp20.000 mendapat diskon 10% sehingga menjadi Rp18.000 per item. Sedangkan diskon total transaksi adalah potongan harga yang diberikan setelah semua item dihitung, biasanya jika memenuhi syarat tertentu. Contohnya total belanja Rp120.000 mendapat diskon 10% sehingga menjadi Rp108.000. Dalam aplikasi kasir, diskon per item digunakan untuk promo spesifik produk, sedangkan diskon total transaksi memberikan insentif belanja lebih banyak karena dihitung pada akhir pembayaran.

3. Penggunaan widget Stack pada tampilan kategori menu di aplikasi Flutter memberikan manfaat dalam penyusunan UI karena Stack memungkinkan beberapa elemen ditumpuk secara rapi dalam satu widget. Dengan Stack, indikator kategori aktif seperti highlight, badge, atau teks dapat ditempatkan di atas gambar kategori tanpa merusak layout utama. Hal ini membuat desain lebih fleksibel, menarik, dan tetap terstruktur rapi sehingga pengguna dapat dengan mudah melihat kategori yang dipilih.

Penjelasan Proyek Aplikasi Kasir – Flutter + Cubit

Proyek ini merupakan aplikasi kasir sederhana yang dibangun menggunakan Flutter sebagai framework UI dan Cubit sebagai state management. Aplikasi ini dirancang untuk mendukung proses pemesanan makanan dan minuman pada sebuah restoran atau kafe. Pengguna dapat memilih kategori menu, menambahkan pesanan, menghitung total biaya, serta mendapatkan potongan harga otomatis sesuai ketentuan.

Aplikasi memiliki fitur pengelolaan pesanan menggunakan state management Cubit. Saat pengguna menambahkan atau mengubah jumlah menu yang dipesan, Cubit menyimpan seluruh daftar pesanan dan melakukan perhitungan total harga secara otomatis, termasuk penerapan diskon. Hal ini memastikan data transaksi tetap konsisten di setiap halaman aplikasi.

Selain diskon per item, aplikasi juga menerapkan diskon total transaksi sebesar 10% apabila total belanja melebihi Rp100.000. Penerapan logika diskon dilakukan langsung di dalam Cubit agar UI tetap bersih dan mudah dikelola. Ketika state berubah, tampilan total harga pada halaman ringkasan pesanan akan otomatis diperbarui.

Untuk menampilkan kategori menu, aplikasi menggunakan widget Stack yang memungkinkan penumpukan elemen UI secara fleksibel. Hal ini memberikan efek visual yang menarik seperti highlight kategori aktif atau label kategori pada gambar.

Secara keseluruhan, aplikasi ini menggabungkan konsep state management modern, logika bisnis terstruktur, dan desain UI interaktif untuk memberikan pengalaman pengguna yang lebih baik. Aplikasi ini juga dapat dikembangkan lebih lanjut seperti penambahan database, metode pembayaran, dan integrasi struk digital.
