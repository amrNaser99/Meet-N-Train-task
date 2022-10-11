import 'package:meetntrain/meet_n_train_events/domain/entities/tag.dart';

class TagModel extends Tag {
  TagModel({
    super.id,
    super.title,
    super.icon,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json["id"],
      title: json["title"],
      icon: json["icon"],
    );
  }
}
