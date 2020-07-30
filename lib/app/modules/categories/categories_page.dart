import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_page.dart';
import 'categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  final String title;
  const CategoriesPage({Key key, this.title = "Categories"}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState
    extends ModularState<CategoriesPage, CategoriesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: controller.store.repository.getCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      child: Text('Ocorreu um erro, recarregue a página!'));
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: Text(
                    'Você não possui registros anteriores!',
                    style: TextStyle(fontSize: 20),
                  ));
                } else {
                  if (snapshot.data.toString() == '[]') {
                    return Center(
                        child: Text(
                      'Você não possui registros anteriores!',
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Card(
                              shadowColor: AppThemeLight().getTheme().accentColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 16, 16, 16),
                                          child: Text(
                                            list[index].name,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: RaisedButton(
                                                color: Colors.yellow,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50))),
                                                onPressed: () {},
                                                child: Text('Iniciar Hábito'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: RaisedButton(
                                                color: AppThemeLight()
                                                    .getTheme()
                                                    .primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50))),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CategoryDetailPage(
                                                                model: list[
                                                                    index])),
                                                  );
                                                },
                                                child: Text('Ver sobre'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Hero(
                                      tag: list[index].image,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: AspectRatio(
                                          aspectRatio: 1.15,
                                          child: SvgPicture.asset(
                                            list[index].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }

                break;
            }
            return Container();
          }),
    );
  }
}
