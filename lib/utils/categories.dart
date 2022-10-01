import 'package:marvelgo/models/category.dart';
import 'package:marvelgo/screens/screens.dart';

List<Category> catergories = [
  Category("Character", './assets/images/superhero.png', Character.route),
  Category("Comics", './assets/images/superhero1.png', Comic.route),
  Category("Movies", './assets/images/superhero2.png', '/movie'),
  Category("Series", './assets/images/superhero3.png', '/series'),
  Category("Creator", './assets/images/superhero4.png', '/creattor'),
  Category("News", './assets/images/superhero5.png', '/news'),
];
