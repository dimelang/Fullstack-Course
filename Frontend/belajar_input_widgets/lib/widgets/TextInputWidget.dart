import 'package:flutter/material.dart';

class Textinputwidget extends StatefulWidget {
  const Textinputwidget({super.key});

  @override
  State<Textinputwidget> createState() => _TextinputwidgetState();
}

class _TextinputwidgetState extends State<Textinputwidget> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
          onSubmitted: (value) {
            print("Username: $value");
          },
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  _emailController.clear();
                },
                icon: Icon(Icons.clear)),
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (value) {
            print("Email: $value");
          },
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  _passwordController.clear();
                },
                icon: Icon(Icons.clear)),
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (value) {
            print(
                "Password: ${List<String>.generate(value.length, (i) => "*").join()}");
          },
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: () {
            print("Username: ${_usernameController.text}");
            print("Email: ${_passwordController.text}");
          },
          label: Text("Simpan"),
          icon: Icon(Icons.save),
        )
      ],
    );
  }
}
