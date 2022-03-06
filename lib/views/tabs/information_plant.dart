import '../../utils/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/utils.dart';

class InformationPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image = Container(
      height: 300.0,
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        image: DecorationImage(
          // Imagem da plata Aqui
          image: AvailableImages.appLogo,
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

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 0.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              Column(children: const [
                Accordion(
                  title: 'Informações da Planta',
                  content:
                      'Plantae é o reino da natureza que agrupa as plantas, em um vasto conjunto de organismos eucariotas multicelulares, sem motilidade e predominantemente autotróficos fotossintéticos',
                ),
                Accordion(
                    title: 'Geolocalização',
                    content:
                        'Fusce ex mi., commodo ut bibendum sit amet, faucibus ac felis. Nullam vel accumsan turpis, quis pretium ipsum. Pellentesque tristique, diam at congue viverra, neque dolor suscipit justo, vitae elementum leo sem vel ipsum'),
                Accordion(title: 'Responsável', content: 'Fulano de Tal'),
              ]),
              //   _accordion('', 'content'),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                      ),
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(gradient: primaryGradient),
                      ),
                      Positioned(top: 100, right: 0, left: 0, child: info)
                    ],
                  ),
                  secondCard,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
