import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/long_text.dart';
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
      backgroundColor: Color(0xffb9d7d9),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: AppThemeLight().getTheme().primaryColor,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Leia essas Afirmações todas as noites antes de dormir, e SINTA a diferença quando você acordar!',
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "PRIMEIRA : " + LongText.FIRST_AFIRMATION,
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "SEGUNDA : " + LongText.SECOND_AFIRMATION,
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "TERCEIRA : " + LongText.THIRD_AFIRMATION,
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "QUARTA : " + LongText.FOURTH_AFIRMATION,
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
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
