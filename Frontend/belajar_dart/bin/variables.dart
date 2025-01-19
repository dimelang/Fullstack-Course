void variables() {
  String name = "John"; // menyimpan data teks
  num age = 20; // menyimpan semua jenis tipe data numerik (integer atau double)
  int usia = 20; // menyimpan bilangan bulat
  double berat = 60.5; // menyimpan bilangan pecahan
  bool is_married = false; // menyimpan nilai true/false

  List data = [
    'John',
    20,
    60.5
  ]; // menyimpan data array dengan berbagai tipe data
  List<int> score = [80, 90, 70, 76, 100]; // array untuk menampung data integer
  print(
      "Total score: ${score[0] + score[1] + score[2] + score[3] + score[4]}"); // akses element menggunakan index yang dimulai dari 0

  Set<String> names = {
    "John",
    "Doe"
  }; // digunakan untuk menampung data dengan nilai yang unik
  Set<int> scores = {1, 2, 3, 4};
  print(scores.elementAt(
      0)); // akses element menggunakan fungsi elementAt dan indek element

  // tipe data berbasis key-value
  Map records = {"nama": "John", 2: "Doe", "usia": 20};
  print(
      "Nama: ${records['nama']}, Nama tengah: ${records[2]}, Usia: ${records['usia']}");

  var coba = 2; // inisialisasi variable dengan tipe data berdasarkan nilainya

  // hampir sama dengan var, namun memiliki kelebihan yaitu mampu melakukan casting tipe data secara otomatis
  dynamic x = 10;
  x = "D";
  print(x);
}
