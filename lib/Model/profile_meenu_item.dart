import 'package:flutter/cupertino.dart';

class ProfileMenuItem {
  String? title;
  String? content;
  IconData? imageName;

  ProfileMenuItem({this.title, this.content, this.imageName});
  factory ProfileMenuItem.fromJson(Map<String, dynamic> json) {
    return ProfileMenuItem(
        title: json["title"],
        imageName: json["image"],
        content: json["content"]);
  }
}
