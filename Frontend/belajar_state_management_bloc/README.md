# Belajar Global State Management Bloc

Repository ini menyediakan source pelatihan untuk topik Global State Management menggunakan BLoC

---

## **📦 Install Package**
Tambahkan dependency `bloc`
```bash
flutter pub add bloc
flutter pub add flutter_bloc
```
---
## 🗂️ Repository Structure

```plaintext
.
├── lib/                                # Folder source code utama
│   ├── pages/                          # Folder untuk halaman (pages) aplikasi
│   │   ├── Homepage.dart               # Halaman utama aplikasi
│   │   └── Secondpage.dart             # Halaman kedua aplikasi (mengakses nilai dari state yang diubah pada halaman utama)
│   │
│   ├── widgets/                        # Folder untuk widget yang dapat digunakan ulang
│   │   └── ThemeChangerButton.dart     # Widget tombol untuk mengubah tema
│   │
│   ├── bloc/                           # Folder untuk state management menggunakan Bloc
│   │   ├── CounterCubit.dart           # Cubit untuk fitur counter
│   │   └── ThemeChangerCubit.dart      # Cubit untuk mengelola tema aplikasi
│   │
│   └── main.dart                       # Entry point aplikasi Flutter
│
└── pubspec.yaml                        # File untuk mencantumkan dependency dan metadata proyek
