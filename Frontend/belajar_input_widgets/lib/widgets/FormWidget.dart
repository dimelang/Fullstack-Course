import 'package:flutter/material.dart';

class Formwidget extends StatefulWidget {
  const Formwidget({super.key});

  @override
  State<Formwidget> createState() => _FormwidgetState();
}

class _FormwidgetState extends State<Formwidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  List<String> _items = List<String>.generate(10, (i) => 'Item ${i + 1}');
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
          width: 2,
        )),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username wajib diisi";
                    }
                    return null;
                  },
                  cursorColor: Colors.grey,
                  controller: _usernameController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            _usernameController.clear();
                          },
                          icon: Icon(Icons.clear)),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      contentPadding: EdgeInsets.all(20),
                      labelStyle: TextStyle(color: Colors.blue.shade200),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade400),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade500),
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username wajib diisi";
                    }
                    return null;
                  },
                  cursorColor: Colors.grey,
                  controller: _emailController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            _emailController.clear();
                          },
                          icon: Icon(Icons.clear)),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(20),
                      labelStyle: TextStyle(color: Colors.blue.shade200),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade400),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade500),
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
                DropdownButtonFormField(
                  hint: Text('Pilih item'),
                  items: _items
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Item wajib dipilih";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      label: Text("Simpan"),
                      icon: Icon(Icons.save),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      label: Text("Reset"),
                      icon: Icon(Icons.delete),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
