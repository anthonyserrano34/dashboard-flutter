import '/constants.dart';
import 'package:flutter/material.dart';
import '/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = StatusPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value = itemName;
  isHovering(String itemName) => hoverItem.value = itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case StatusPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case StorePageRoute:
        return _customIcon(Icons.trending_down, itemName);
      case UsersPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case LoginPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: primaryColor);
    return Icon(icon,
        color: isHovering(itemName) ? primaryColor : secondaryColor);
  }
}
