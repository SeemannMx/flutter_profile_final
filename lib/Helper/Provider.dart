import 'package:flutter_profle_application/Helper/Model.dart';

class Provider{

  List<Model> list = [new Model("test", "test", "assets/images/img_cat_00.jpg")];

  List<Model> createTestData(){

   list.clear();

   Model jon = Model("Jon Snow", "Winterfell", "assets/images/img_cat_00.jpg");
   Model minka = Model("Minka", "Riga", "assets/images/img_cat_01.jpg");
   Model tapsi = Model("Tapsi", "München", "assets/images/img_cat_02.jpg");
   Model lenni = Model("Lenni", "Kiel", "assets/images/img_cat_03.jpg");
   Model tigerchen = Model("Tigerchen", "Casablanca", "assets/images/img_cat_04.jpg");
   Model sammy = Model("Sammy", "Berlin", "assets/images/img_dog_00.jpg");
   Model leopold = Model("Leopold", "Cambridge", "assets/images/img_dog_01.jpg");
   Model mrGrey = Model("Mr. Grey", "New York", "assets/images/img_rabbit_00.jpg");
   Model stubsi = Model("Stubsi", "Erfurt", "assets/images/img_rabbit_01.jpg");
   Model mrsGrey = Model("Mrs. Grey", "New York", "assets/images/img_rabbit_02.jpg");
   Model robert = Model("Robert", "Karlsruhe", "assets/images/img_rabbit_03.jpg");
   Model klopfer = Model("Klopfer", "Woods", "assets/images/img_rabbit_04.jpg");
   Model hoppel = Model("Hoppel", "Schwarzwald", "assets/images/img_rabbit_05.jpg");
   Model flauschi = Model("Flauschi", "Zwickau", "assets/images/img_rabbit_06.jpg");
   Model lancelot = Model("Sir Lancelot", "London", "assets/images/img_rabbit_07.jpg");
   Model schlappi = Model("Schlappi", "Narnia", "assets/images/img_rabbit_08.jpg");

   list.add(jon);
   list.add(minka);
   list.add(tapsi);
   list.add(lenni);
   list.add(tigerchen);
   list.add(sammy);
   list.add(leopold);
   list.add(mrGrey);
   list.add(stubsi);
   list.add(mrsGrey);
   list.add(robert);
   list.add(klopfer);
   list.add(hoppel);
   list.add(flauschi);
   list.add(lancelot);
   list.add(schlappi);

   return list;
  }
}