import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_social/utils/colors.dart';

import '../stores/register.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final register = GetIt.I.get<Register>();

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    final pageTitle = Container(
      child: Text(
        "Cadastro",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
    );

    final formFieldSpacing = SizedBox(
      height: 30.0,
    );

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFormField('Nome', LineIcons.user),
            formFieldSpacing,
            _buildFormField('Endereço de Email', LineIcons.envelope),
            formFieldSpacing,
            _buildFormField('Numero de Telefone', LineIcons.mobile_phone),
            formFieldSpacing,
            _buildFormField('Senha', LineIcons.lock),
            formFieldSpacing,
          ],
        ),
      ),
    );

    final gender = Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          _buildSelectSexRadio(0),
          _buildRadioText("Masculino", 0),
          _buildSelectSexRadio(1),
          _buildRadioText("Feminino", 1),
          _buildSelectSexRadio(2),
          _buildRadioText("Outro", 2),
        ],
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
            onPressed: () => Navigator.of(context).pushNamed('/home'),
            child: Text(
              'Criar Conta',
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,
                    registerForm,
                    gender,
                    submitBtn
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon) {
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
    );
  }

  Widget _buildSelectSexRadio(int sexValue) {
    return Observer(
      builder: (_) => Radio(
        value: sexValue,
        groupValue: register.genderRadioBtnVal,
        onChanged: (value) => register.handleGenderChange(value),
      ),
    );
  }

  Widget _buildRadioText(String sexDescription, int sexValue) {
    return GestureDetector(
      child: Text(sexDescription),
      onTap: () => register.handleGenderChange(sexValue),
    );
  }

  @override
  void dispose() {
    register.handleGenderChange(-1);
    super.dispose();
  }
}
