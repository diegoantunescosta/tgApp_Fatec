import 'package:flutter/material.dart';
import 'package:flutter_social/utils/colors.dart';



class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: const MyCustomForm(),
      ),
    );
  }
}
final formFieldSpacing = SizedBox(
  height: 30.0,
);

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(


        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 20),
          Text('Cadastro',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 40.0,),),
          TextFormField(
              decoration: const InputDecoration(contentPadding: const EdgeInsets.all(20.0),
              icon: Icon(Icons.person),
              hintText: 'Qual é seu nome ?',
              labelText: 'Nome',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o seu nome';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(contentPadding: const EdgeInsets.all(20.0),
              icon: Icon(Icons.email),
              hintText: 'Qual é seu email ?',
              labelText: 'Email',

            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o seu email';
              }
              return null;
            },
          ),
         TextFormField(
            decoration: const InputDecoration(contentPadding: const EdgeInsets.all(20.0),
              icon: Icon(Icons.call_end),
              hintText: 'Qual o número do seu Celular ?',
              labelText: 'Número de Celular',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o seu número de celular';
              }
              return null;
            },
          ),
          TextFormField( obscureText: true, obscuringCharacter:"*",
            decoration: const InputDecoration(contentPadding: const EdgeInsets.all(20.0),
              icon: Icon(Icons.password),
              hintText: 'Qual sua senha ?',
              labelText: 'Digite sua senha',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o sua senha';
              }
              return null;
            },
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,

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
              child: const Text('Cadastrar',  style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: Colors.white,
              ),
              ),
            ),
          ),
          ),
        ],
      ),
    );

  }
}