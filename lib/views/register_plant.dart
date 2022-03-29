import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/stores/validate.dart';

class RegisterPlant extends StatefulWidget {
  @override
  _RegisterPlantState createState() => _RegisterPlantState();
}

final validate = GetIt.I.get<Validate>();

class _RegisterPlantState extends State<RegisterPlant> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formFieldSpacing = SizedBox(
      height: 30.0,
    );

    final image = Container(
      height: 600.0,
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        image: DecorationImage(
            // Imagem da plata Aqui
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg')),
      ),
    );
    final imagemplant = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(14.0),
            shadowColor: Colors.white,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
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

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            imagemplant,
            formFieldSpacing,
            _name('Nome', LineIcons.navicon),
            formFieldSpacing,
            _descript('Descrição', LineIcons.navicon),
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
                Navigator.of(context).pushNamed('/panel_plant');
              }
            },
            child: const Text(
              'Cadastrar Planta',
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
          title: const Text('Cadastrar Planta'),
          backgroundColor: Colors.orangeAccent),
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

  String dropdownValueCidade = 'Nome';
  Widget _name(String label, IconData icon) {
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
        items: <String>['Planta 1', 'Planta 2', 'Planta 3', 'Planta 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList());
  }

  Widget _descript(String label, IconData icon) {
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

  @override
  void dispose() {
    super.dispose();
  }
}
