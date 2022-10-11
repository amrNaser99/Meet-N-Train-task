
import 'package:meetntrain/meet_n_train_events/domain/entities/image_url.dart';

class ImageUrlModel  extends ImageUrl{
  ImageUrlModel({ super.imageUrl});


  factory ImageUrlModel.fromJson(Map<String, dynamic> json) {
    return ImageUrlModel(
      imageUrl: json['url'],
    );
  }

}
