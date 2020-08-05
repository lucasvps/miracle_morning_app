import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/stores/auth_store.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Drawer(
            child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: AppThemeLight().getTheme().primaryColor),
            accountName: Text(
              //"Oi",
              Modular.get<AuthStore>().userName,
              style: GoogleFonts.pangolin(
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              //"Oi",
              Modular.get<AuthStore>().userEmail,
              style: GoogleFonts.yanoneKaffeesatz(
                fontSize: 18,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage:
                  AssetImage('lib/app/assets/images/rocket.png'),
            ),
          ),
          customListTile(
              icon: EvaIcons.messageCircle,
              title: 'Frase do dia',
              subtitle: 'Descubra qual a sua frase do dia!',
              pageTo: '/quote'),
          customListTile(
              icon: EvaIcons.bookOpen,
              title: 'Afirmações',
              subtitle: 'Afirmações para antes de dormir!',
              pageTo: '/afirmations'),
          customListTile(
              icon: EvaIcons.folder,
              title: 'Histórico',
              subtitle: 'Veja seu histórico de hábitos!',
              pageTo: '/historic'),
          customListTile(
              icon: EvaIcons.star,
              title: 'Avaliação',
              subtitle: 'Avalie o aplicativo e nos ajude a melhorar!',
              pageTo: '/slides'),
        ]));
      }),
    );
  }

  Widget customListTile(
      {String title, String subtitle, String pageTo, IconData icon}) {
    return Card(
      color: Color(0xffFFF176).withOpacity(0.9),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: GoogleFonts.yanoneKaffeesatz(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.yanoneKaffeesatz(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Modular.to.pushNamed(pageTo);
        },
      ),
    );
  }
}
