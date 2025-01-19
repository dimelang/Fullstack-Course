void condition() {
  int hari = 4;

  if (hari == 1) {
    print("Senin");
  } else if (hari == 2) {
    print("Selasa");
  } else if (hari == 3) {
    print("Rabu");
  } else if (hari == 4) {
    print("Kamis");
  } else if (hari == 5) {
    print("Jumat");
  } else if (hari == 6) {
    print("Sabtu");
  } else if (hari == 7) {
    print("Minggu");
  }

  switch (hari) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Nilai salah");
      break;
  }
}
