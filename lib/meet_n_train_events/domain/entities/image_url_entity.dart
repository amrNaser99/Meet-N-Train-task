import 'package:meetntrain/meet_n_train_events/data/models/image_url_model.dart';

class ImageUrlEntity extends ImageUrlModel {
  ImageUrlEntity({
    super.imageUrl,
  });

  factory ImageUrlEntity.fromJson(Map<String, dynamic> json) {
    return ImageUrlEntity(
      imageUrl: json['url'],
    );
  }
}
