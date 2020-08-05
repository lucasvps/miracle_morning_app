import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/models/category_model.dart';
import 'category_detail_controller.dart';

class CategoryDetailPage extends StatefulWidget {
  final String title;
  final CategoryModel model;
  const CategoryDetailPage({Key key, this.title = "CategoryDetail", this.model})
      : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState
    extends ModularState<CategoryDetailPage, CategoryDetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb9d7d9),
        appBar: AppBar(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text(
            widget.model.name,
            style: GoogleFonts.patrickHand(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                //height: double.infinity,
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
                            child: Hero(
                              tag: widget.model.image,
                              child: SvgPicture.asset(widget.model.image),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.model.description,
                                  style: GoogleFonts.patrickHand(fontSize: 24),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
