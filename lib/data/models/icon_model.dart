import 'package:flutter/material.dart';

class IconModel {
  final IconData icon; 
  final String key; 

  IconModel(this.icon, this.key);

  factory IconModel.fromJson(Map<String, dynamic> json) {
    return IconModel(
      json['path'] as IconData,
      json['key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': icon,
      'key': key,
    };
  }
}
