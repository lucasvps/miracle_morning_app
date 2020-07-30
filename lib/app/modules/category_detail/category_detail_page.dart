import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        appBar: AppBar(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text(widget.model.name),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
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
                        Text(widget.model.description, style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
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
