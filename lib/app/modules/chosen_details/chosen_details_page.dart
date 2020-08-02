import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/models/category_chosen_model.dart';
import 'package:miracle_morning_app/app/models/date_status_model.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_page.dart';
import 'chosen_details_controller.dart';
import 'package:intl/intl.dart';

class ChosenDetailsPage extends StatefulWidget {
  final String title;
  final CategoryChosenModel model;
  const ChosenDetailsPage({Key key, this.title = "ChosenDetails", this.model})
      : super(key: key);

  @override
  _ChosenDetailsPageState createState() => _ChosenDetailsPageState();
}

class _ChosenDetailsPageState
    extends ModularState<ChosenDetailsPage, ChosenDetailsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeLight().getTheme().primaryColor,
        title: Text(
          widget.model.name,
          style: GoogleFonts.patrickHand(fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: AppThemeLight().getTheme().primaryColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      //image: DecorationImage(image: AssetImage(widget.model.image))
                    ),
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: SvgPicture.asset('lib/app/assets/svg/progress.svg'),
                  ),
                  Flexible(
                    child: Container(
                      child: FutureBuilder(
                          future: controller.store
                              .dateStatusByChosen(widget.model.id),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.active:
                              case ConnectionState.waiting:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                                break;
                              case ConnectionState.none:
                                return Text('erro 1');
                                break;
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          'Ocorreu um erro, recarregue a página!'));
                                }
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: Text(
                                    'Você não possui registros anteriores!',
                                    style: TextStyle(fontSize: 20),
                                  ));
                                } else {
                                  if (snapshot.data.toString() == '[]') {
                                    return Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Center(
                                          child: Text(
                                        'Você ainda não tem um histórico de progresso. O melhor dia para começar é hoje!',
                                        style: TextStyle(fontSize: 25),
                                      )),
                                    );
                                  }
                                  return Column(
                                    //mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Seu progresso até aqui :",
                                          style: GoogleFonts.yanoneKaffeesatz(
                                              fontSize: 32,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 10,
                                            shadowColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: GridView.builder(
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4,
                                                        childAspectRatio: 1.55),
                                                //scrollDirection: Axis.horizontal,
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  var list = snapshot.data;

                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                        child: Text(
                                                          formatDate(
                                                              DateFormat(
                                                                      "yyyy-MM-dd")
                                                                  .parse(
                                                                list[index]
                                                                    .date,
                                                              ),
                                                              [
                                                                dd,
                                                                '/',
                                                                mm,
                                                              ]).toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: list[index]
                                                                  .status
                                                              ? AppThemeLight()
                                                                  .getTheme()
                                                                  .primaryColor
                                                              : Colors.red,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                break;
                            }
                            return Container();
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Início : " +
                        formatDate(
                            DateFormat("yyyy-MM-dd").parse(
                              widget.model.beginDate,
                            ),
                            [dd, '/', mm, '/', yyyy]).toString(),
                    style: GoogleFonts.yanoneKaffeesatz(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Final : " +
                        formatDate(
                            DateFormat("yyyy-MM-dd").parse(
                              widget.model.endDate,
                            ),
                            [dd, '/', mm, '/', yyyy]).toString(),
                    style: GoogleFonts.yanoneKaffeesatz(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
