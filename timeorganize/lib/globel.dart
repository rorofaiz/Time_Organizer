import 'package:flutter/cupertino.dart';

class globel {
  static late String name = "Tom";
  static late String nameuser = "";
  static late int sellecteddefult = 1;
  static late int sellectedSkin = -1;
  static late int sellectedEye = -1;
  static late int sellectedHair = -1;
  static late String category = "No category";
  static late Color colorcategory = const Color.fromARGB(255, 173, 178, 184);

  // Getter
  static String getName() {
    return name;
  }

  // Setter
  static void setName(String newName) {
    name = newName;
  }

// Getter
  static String getNameuser() {
    return nameuser;
  }

  // Setter
  static void setNameuser(String newName) {
    nameuser = newName;
  }

  // Getter
  static String getcategory() {
    return category;
  }

  // Setter
  static void setcategory(String newcategory) {
    category = newcategory;
  }

  // Getter
  static Color getcolorcategory() {
    return colorcategory;
  }

  // Setter
  static void setcolorcategory(Color newcategory) {
    colorcategory = newcategory;
  }

  // Getter
  static int getsellecteddefult() {
    return sellecteddefult;
  }

  // Setter
  static void setsellecteddefult(int newsellecteddefult) {
    sellecteddefult = newsellecteddefult;
  }

  // Getter
  static int getsellectedSkin() {
    return sellectedSkin;
  }

  // Setter
  static void setsellectedSkin(int newsellectedSkin) {
    sellectedSkin = newsellectedSkin;
  }

  // Getter
  static int getsellectedEye() {
    return sellectedEye;
  }

  // Setter
  static void setsellectedEye(int newsellectedEye) {
    sellectedEye = newsellectedEye;
  }

  // Getter
  static int getsellectedHair() {
    return sellectedHair;
  }

  // Setter
  static void setsellectedHair(int newsellectedHair) {
    sellectedHair = newsellectedHair;
  }
}
