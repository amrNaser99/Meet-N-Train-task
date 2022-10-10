import 'package:meetntrain/meet_n_train_events/data/models/tagModel.dart';

class TagEntity extends TagModel {
  TagEntity({
    super.id,
    super.title,
    super.icon,
  });

  factory TagEntity.fromJson(Map<String, dynamic> json) {
    return TagEntity(
      id: json["id"],
      title: json["title"],
      icon: json["icon"],
    );
  }
}
