void nullSafety() {
  // null safety
  int a = 10; // non-nullable
  int? b; // nullable
  print(a); // 10
  print(b); // null

  String? name;

  // ?. untuk memanggil anggota hanya jika bukan null
  // ?. operator
  print(name?.length); // Output: null

  // ?? untuk memberikan nilai default jika null
  // ?? operator
  print(name ?? "Default Name"); // Output: Default Name

  // ??= untuk menetapkan nilai hanya jika variabel null
  // ??= operator
  name ??= "John";
  print(name); // Output: John

  // ! untuk mengubah nullable menjadi non-nullable (gunakan dengan hati-hati).
  // ! operator
  print(name!.length); // Output: 4

  // late memungkinkan deklarasi variabel non-nullable yang diinisialisasi nanti.
  late String something;
  something = "John";
  print(name); // Output: John
}
