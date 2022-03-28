import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_social/stores/user.dart';
import 'package:flutter_social/utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final user = GetIt.I.get<User>();

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    void _fail() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Falha ao entrar!'),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 4),
      ));
    }

    void _login() async {
      _formKey.currentState.save();
      final response = await user.login(_email, _password);
      (response) ? Navigator.pushNamed(context, '/home') : _fail();
    }

    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    final pageTitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Entrar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        Text(
          "Olá, tudo bem ?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );

    final emailField = TextFormField(
      onSaved: (data) {
        _email = data;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.envelope,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );

    final passwordField = TextFormField(
      onSaved: (data) {
        _password = data;
      },
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.lock,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
    );

    final loginForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[emailField, passwordField],
        ),
      ),
    );

    final loginBtn = Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.green.shade900),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: () => _login(),
        style: ElevatedButton.styleFrom(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(7.0),
            ),
            primary: Colors.green.shade900),
        child: Text(
          'CONFIRMAR',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );

    final forgotPassword = Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/reset_password'),
        child: Center(
          child: Text(
            'Esqueceu a Senha ?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    final newUser = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/register_user'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Novo Usuário?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' Criar Conta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
          decoration: BoxDecoration(gradient: primaryGradient),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              pageTitle,
              loginForm,
              loginBtn,
              forgotPassword,
              newUser
            ],
          ),
        ),
      ),
    );
  }
}
