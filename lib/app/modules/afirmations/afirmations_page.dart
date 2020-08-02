import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_page.dart';
import 'afirmations_controller.dart';

class AfirmationsPage extends StatefulWidget {
  final String title;
  const AfirmationsPage({Key key, this.title = "Afirmations"})
      : super(key: key);

  @override
  _AfirmationsPageState createState() => _AfirmationsPageState();
}

class _AfirmationsPageState
    extends ModularState<AfirmationsPage, AfirmationsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeLight().getTheme().primaryColor,
        title: Text(
          "Exemplo das Afirmações para antes de dormir",
          style: GoogleFonts.patrickHand(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      color: AppThemeLight().getTheme().primaryColor,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            //image: DecorationImage(image: AssetImage(widget.model.image))
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child:
                              SvgPicture.asset('lib/app/assets/svg/sleep.svg'),
                        ),
                        Image.asset(
                          'lib/app/assets/images/afirmaçoes.PNG',
                          width: double.maxFinite,
                        ),
                        //Image.asset('lib/app/assets/images/fullafirmations.PNG'),
                        Image.asset('lib/app/assets/images/lastafirmations.PNG',
                            width: double.maxFinite)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
