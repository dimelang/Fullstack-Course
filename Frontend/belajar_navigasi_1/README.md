# Belajar Navigasi 1

## 🗂️ Repository Structure

```plaintext
.
├── belajar_input_widgets/            # Flutter frontend project
│   └── lib/                          # Flutter source code
│       |── pages                     # Flutter pages list
│       |    |── Homepage.dart        # Homepage (contains button navigation for move to Secondpage and Profilepage)
│       |    |── Secondapage.dart     # Secondpage (contains content from Homepage)
│       |    |── Thirdpage.dart       # Example of a page redirect from Secondpage
│       |    └── Profilepage.dart     # Example of route page from Homepage (use argument as content in page)
|       └── main.dart                 # Main program (Contains route)
└── pubspec.yaml                      # Dependencies