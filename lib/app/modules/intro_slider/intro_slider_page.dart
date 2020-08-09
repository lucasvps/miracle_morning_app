import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'intro_slider_controller.dart';

class IntroSliderPage extends StatefulWidget {
  final String title;
  final width;
  final height;
  const IntroSliderPage({Key key, this.title = "IntroSlider", this.width, this.height})
      : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState
    extends ModularState<IntroSliderPage, IntroSliderController> {
  //use 'controller' variable to access controller

  List<Slide> slides = new List();
  

  @override
  void initState() {
    
    super.initState();
    slides.add(
      new Slide(
        maxLineTitle: 3,
        heightImage: double.parse(widget.height) * 0.4,
        //widthImage: 330,
        marginTitle: EdgeInsets.only(top: 50),
        title: "O que é o milagre da manhã?",
        styleDescription: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25),
        description:
            "Para o autor Hal Elrod, esse é o método mais simples e eficaz para melhorar qualquer área de nossa vida. Um processo simples, porém revolucionário. Uma jornada milagrosa.",
        pathImage: "lib/app/assets/images/career.png",
        backgroundColor: Color(0xff50B5BA),
      ),
    );
    slides.add(
      new Slide(
        maxLineTitle: 3,
        heightImage: double.parse(widget.height) * 0.4,
        //widthImage: 330,
        marginTitle: EdgeInsets.only(top: 50),
        title: "E como isso funciona na prática?",
        styleDescription: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25),
        description:
            "Acordar mais cedo do que o costume todos os dias, de 30 a 60 minutos antes, e dedicar a primeira hora do dia para melhorar a si mesmo, praticando algumas atividades voltadas para o desenvolvimento pessoal.",
        pathImage: "lib/app/assets/images/meditation.png",
        backgroundColor: Color(0xff50B5BA),
      ),
    );
    slides.add(
      new Slide(
        maxLineTitle: 3,
        heightImage: double.parse(widget.height) * 0.4,
        //widthImage: 330,
        marginTitle: EdgeInsets.only(top: 50),
        title: "E quais os benefícios?",
        styleDescription: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25),
        description:
            "O método vai lhe trazer mais energia, motivação, clareza e concentração, e com o tempo ainda mais resultados virão, como melhor qualidade de vida, maior renda, mais disciplina, menos estresse é até perda de peso.",
        pathImage: "lib/app/assets/images/winner_.png",
        backgroundColor: Color(0xff50B5BA),
      ),
    );

    slides.add(
      new Slide(
        maxLineTitle: 3,
        heightImage: double.parse(widget.height) * 0.4,
        //widthImage: 330,
        marginTitle: EdgeInsets.only(top: 50),
        title: "Lembre-se!",
        styleDescription: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25),
        description:
            "Sua vida poderá ser e será melhor, mas somente depois que você investir tempo todos os dias para transformar-se na pessoa que precisa ser para aperfeiçoar sua vida. É exatamente o que esses próximos trinta dias de sua vida podem ser — um novo começo e um novo você.",
        pathImage: "lib/app/assets/images/time.png",
        backgroundColor: Color(0xff50B5BA),
      ),
    );
  }

   

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      nameSkipBtn: "Pular",
      nameNextBtn: "Next",
      nameDoneBtn: "Go",
      namePrevBtn: "Prev",
      slides: this.slides,
      onDonePress: () {
        Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/home'));
      },
    );
  }
}
