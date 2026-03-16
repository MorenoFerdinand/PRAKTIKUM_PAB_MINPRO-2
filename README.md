| NAMA | NIM | KELAS |
| :--- | :--- | :--- |
| MORENO FERDINAND FARHANTINO | 2409116097 | C`24 |

# Aplikasi Manajemen Pengajuan Beasiswa (Supabase Integrated)

Aplikasi **Manajemen Pengajuan Beasiswa**  ini merupakan pengembangan dari proyek sebelumnya. Kini, aplikasi telah terintegrasi sepenuhnya dengan **Supabase** sebagai backend untuk penyimpanan data secara *real-time* dan sistem autentikasi pengguna.

---

## Deskripsi Aplikasi
Aplikasi ini berfungsi sebagai platform administrasi untuk mengelola data beasiswa secara digital. Pada pembaruan Mini Project 2 ini, fokus utama adalah pada **sinkronisasi cloud**, keamanan data menggunakan **Supabase Auth**, dan fleksibilitas tampilan dengan fitur **Dark Mode**. Seluruh data dikelola secara dinamis melalui database server Supabase.

---

## Fitur Utama (CRUD & Auth)
Sesuai dengan ketentuan Mini Project 2, aplikasi ini memiliki fungsi manajemen data lengkap:

* **Authentication (Login & Register)**: Fitur keamanan untuk masuk ke aplikasi menggunakan email dan password yang terverifikasi di Supabase Auth.
* **Create (Tambah Data)**: Menambahkan entri beasiswa baru langsung ke tabel database Supabase melalui formulir input.
* **Read (Tampilkan Data)**: Menampilkan daftar beasiswa secara *real-time* dari server cloud menggunakan widget `StreamBuilder`.
* **Update (Ubah Data)**: Memperbarui informasi beasiswa yang sudah ada dengan sinkronisasi otomatis ke server.
* **Delete (Hapus Data)**: Menghapus data secara permanen dari database Supabase.

---

## Widget yang Digunakan
Aplikasi ini dibangun menggunakan widget fundamental Flutter untuk memastikan performa dan sinkronisasi data yang optimal:

| Jenis Widget | Fungsi |
| :--- | :--- |
| **StreamBuilder** | Menangani sinkronisasi data secara *real-time* dari database Supabase. |
| **Scaffold** | Struktur dasar halaman aplikasi (AppBar, Body, FloatingActionButton). |
| **TextField** | Digunakan untuk input Email, Password, dan 3 Field Beasiswa (Nama, Penyelenggara, Syarat). |
| **ListView.builder** | Merender daftar beasiswa dari cloud secara efisien dan dinamis. |
| **Card & ListTile** | Membungkus informasi beasiswa agar terstruktur dan rapi. |
| **ElevatedButton** | Tombol utama untuk memproses autentikasi dan penyimpanan data. |
| **Navigator** | Menangani perpindahan halaman (Multi-page Navigation) antara Auth dan Home. |

#### Nilai Tambah (Advanced Features)

| Fitur | Fungsi |
| :--- | :--- |
| **Supabase Auth** | Menangani sistem pendaftaran dan login pengguna secara aman di sisi server. |
| **Light & Dark Mode** | Fitur untuk mengubah tema aplikasi agar lebih nyaman dipandang. |
| **Dotenv (.env)** | Mengamankan Supabase URL dan Anon Key agar tidak terekspos langsung di kode sumber. |

---

## Struktur Project
```text
lib/
├── pages/
│   ├── home_screen.dart       # Menampilkan List Data dari Supabase
│   ├── login_screen.dart      # Halaman Masuk (Auth)
│   ├── register_screen.dart   # Halaman Daftar (Auth)
│   └── form_screen.dart       # Form Tambah & Edit Data
├── widgets/
│   └── scholarship_card.dart  # Komponen kartu tampilan data
├── .env                       # File konfigurasi API Key (Hidden)
└── main.dart                  # Inisialisasi Supabase & Root App
```

## Lampiran

1. Usser
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/92dca33f-906b-46c6-b4c0-0a844bd542c5" />

---
2. Pendataan
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3b77818e-7603-410d-84f5-69e8cd2c2fdc" />

---
3. Tampilan Awal
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5ee7c66e-4738-459e-aa22-2cfc240ddc13" />

---
4. Edit
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a5a6afc9-fd64-4669-b6e5-41e05ce8634d" />
