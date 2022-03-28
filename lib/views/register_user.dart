import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/stores/validate.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final validate = GetIt.I.get<Validate>();

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formFieldSpacing = SizedBox(
      height: 30.0,
    );

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _name('Nome', LineIcons.user),
            formFieldSpacing,
            _email('Endereço de Email', LineIcons.envelope),
            formFieldSpacing,
            _pais('Pais', LineIcons.map),
            formFieldSpacing,
            _estado('Estado', LineIcons.map),
            formFieldSpacing,
            _cidade('Cidade', LineIcons.map),
            formFieldSpacing,
            _endereco('Endereço', LineIcons.map),
            formFieldSpacing,
            _password('Senha', LineIcons.lock),
            formFieldSpacing,
          ],
        ),
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          color: primaryColor,
          elevation: 10.0,
          shadowColor: Colors.white70,
          child: MaterialButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.of(context).pushNamed('/home');
              }
            },
            child: const Text(
              'Cadastrar',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro'), backgroundColor: Colors.orangeAccent),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    registerForm,
                    submitBtn,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _name(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      validator: validate.name,
    );
  }

  Widget _email(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      validator: validate.email,
    );
  }

  Widget _password(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      obscureText: true,
      validator: validate.password,
    );
  }

  String dropdownValuePais = 'Pais';
  Widget _pais(String label, IconData icon) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black38,
          ),
        ),
        dropdownColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValuePais = newValue;
          });
        },
        items: <String>['Pais', 'Pais 2', 'Pais 3', 'Pais 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList());
  }

  String dropdownValueEstado = 'Estado';
  Widget _estado(String label, IconData icon) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black38,
          ),
        ),
        dropdownColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValueEstado = newValue;
          });
        },
        items: <String>['Estado', 'Estado 2', 'Estado 3', 'Estado 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList());
  }

  String dropdownValueCidade = 'Cidade';
  Widget _cidade(String label, IconData icon) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black38,
          ),
        ),
        dropdownColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValueCidade = newValue;
          });
        },
        items: <String>['Cidade', 'Cidade 2', 'Cidade 3', 'Cidade 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList());
  }

  String dropdownValueEndereco = 'Endereço';
  Widget _endereco(String label, IconData icon) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.black38,
          ),
        ),
        dropdownColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValueEndereco = newValue;
          });
        },
        items: <String>['Endereço', 'Endereço2', 'Endereço 3', 'Endereço 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
