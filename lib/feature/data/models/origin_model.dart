import 'package:flutter_application_1/feature/domain/entities/entities.dart';

class OriginModel extends OriginEntity {
  OriginModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'],
      url: json['url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
