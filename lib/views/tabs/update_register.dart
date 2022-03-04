import 'package:flutter_social/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/stores/validate.dart';


class UpdateRegister extends StatefulWidget {
  @override
  _UpdateRegisterState createState() => _UpdateRegisterState();
}

final validate = GetIt.I.get<Validate>();

class _UpdateRegisterState extends State<UpdateRegister> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final text = Text(
      'Atualização de Cadastro',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 30.0,
          color: Colors.black),
    );

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
          ),
        ],
      ),
    );

    final image = Container(
      height: 300.0,
      width: 200.0,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(14.0),
        image: DecorationImage(

          // Imagem da plata Aqui
          image: AvailableImages.user,
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
              'Atualizar',
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
    final info = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              // child: Padding(
              //   padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  image,
                ],
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    text,
                    info,
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
        labelText: label = 'Chozé',
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
        labelText: label = 'choze@email.com',
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

  Widget _pais(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label = 'Brasil',
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

  Widget _estado(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label = 'São Paulo',
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

  Widget _cidade(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label = 'Pompeia',
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

  Widget _endereco(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label = ' Rua Equador, 19',
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



  @override
  void dispose() {
    super.dispose();
  }
}
