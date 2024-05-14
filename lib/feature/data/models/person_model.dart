import 'package:flutter_application_1/feature/data/models/location_model.dart';
import 'package:flutter_application_1/feature/data/models/origin_model.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  // ignore: use_super_parameters
  const PersonModel(
      {required id,
      required name,
      required status,
      required species,
      required type,
      required gender,
      required origin,
      required location,
      required image,
      required episode,
      required url,
      required created})
      : super(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            episode: episode,
            url: url,
            created: created);
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      //super params from json
      origin:
          json['origin'] != null ? OriginModel.fromJson(json['origin']) : null,
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
      image: json['image'],
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin,
      'location': location,
      'image': image,
      'episode': episode,
      'url': url,
      'created': created
    };
  }
}
