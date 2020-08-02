import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'quote_controller.dart';

class QuotePage extends StatefulWidget {
  final String title;
  const QuotePage({Key key, this.title = "Quote"}) : super(key: key);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends ModularState<QuotePage, QuoteController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeLight().getTheme().primaryColor,
        title: Text(
          'Frase Motivacional do Dia!',
          style: GoogleFonts.patrickHand(),
        ),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  'lib/app/assets/svg/quote.svg',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                SizedBox(
                  height: 50,
                ),
                controller.store.quote != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListTile(
                              title: Text(
                                controller.store.quote,
                                style: GoogleFonts.patrickHand(fontSize: 24),
                              ),
                              subtitle: Text(
                                '- ' + controller.store.author,
                                style: GoogleFonts.patrickHand(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: controller.store.adManager.isOdd
                          ? () {
                            // TODO : RODAR ANUNCIO AQUI E .THEN()
                              controller.store.repository
                                  .randomQuote()
                                  .then((value) async {
                                controller.store.setAuthor(value.author);
                                controller.store.setQuote(value.quote);

                                controller.store.increaseAdManager();
                              });
                            }
                          : () {
                              controller.store.repository
                                  .randomQuote()
                                  .then((value) async {
                                controller.store.setAuthor(value.author);
                                controller.store.setQuote(value.quote);

                                controller.store.increaseAdManager();
                              });
                            },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Gerar frase motivacional!',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
