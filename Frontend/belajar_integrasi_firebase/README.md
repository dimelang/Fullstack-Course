# Belajar Integrasi Firebase

Repository ini menyediakan source pelatihan untuk topik integrasi Layanan Firebase Authentication, Database Real-time, dan Firestore.

---

## Konfigurasi
1. Install Firebase CLI
    1. [Download](https://firebase.google.com/docs/cli?hl=en&authuser=0#install_the_firebase_cli) dan install 
    2. Atau melalui command node
        ```bash
        npm install -g firebase-tools
        ```
2. Login menggunakan command prompt
    ```bash
    firebase login
    ```
3. Install FlutterFire
    ```bash
    dart pub global activate flutterfire_cli
    ```
4. Tambahkan path dari FlutterFire CLI pada PATH environment
5. Tambahkan layanan Authentication, Realtime Database dan Firestore Database pada [console firebase](https://console.firebase.google.com/)
6. Update konfigurasi firebase pada proyek flutter dengan menjalankan command
    ```bash
    flutterfire configure --project=<id-project>
    ```

---

## **📦 Install Package**
Tambahkan dependency
```bash
flutter pub add firebase_core
flutter pub add firebase_auth  // firebase authentication
flutter pub add firebase_database  // database realtime
flutter pub add cloud_firestore  // firestore
```