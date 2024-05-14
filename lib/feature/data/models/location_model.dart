import 'package:flutter_application_1/feature/domain/entities/entities.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
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
