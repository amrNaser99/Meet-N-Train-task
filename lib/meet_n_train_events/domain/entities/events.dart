import 'package:meetntrain/meet_n_train_events/data/models/image_url_model.dart';
import '../../data/models/tag_model.dart';
import '../../data/models/users_model.dart';

class Events {
  final int? id;
  final String? title;
  final String? description;
  final int? spots;
  final int? price;
  final double? lat;
  final double? lon;
  final String? placeName;
  final String? featuredImage;
  final String? deeplink;
  final String? date;
  final int? tagId;
  final int? createdBy;
  final int? communityId;
  final String? whatsapp_link;
  final List<ImageUrlModel>? images;
  final String? finish_date;
  final String? paymentMethod;
  final int? location_id;
  final int? cancelled_at;
  final List<UsersModel>? users;
  final TagModel? tag;
  final dynamic community;
  final bool? isWaiting;
  final bool? isJoined;
  final int? joinedUsersCount;
  final int? checkedInCount;
  final int? paidAmount;
  final int? ownerEarnings;

  Events({
   this.id,
    this.title,
    this.description,
    this.spots,
    this.price,
    this.lat,
    this.lon,
    this.placeName,
    this.featuredImage,
    this.deeplink,
    this.date,
    this.tagId,
    this.createdBy,
    this.communityId,
    this.paymentMethod,
    this.whatsapp_link,
    this.images,
    this.finish_date,
    this.location_id,
    this.cancelled_at,
    this.users,
    this.tag,
    this.community,
    this.isWaiting,
    this.isJoined,
    this.joinedUsersCount,
    this.checkedInCount,
    this.paidAmount,
    this.ownerEarnings,
  });



}
