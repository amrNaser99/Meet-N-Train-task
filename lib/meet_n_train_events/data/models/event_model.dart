import 'package:meetntrain/meet_n_train_events/data/models/community_model.dart';
import 'package:meetntrain/meet_n_train_events/data/models/image_url_model.dart';
import 'package:meetntrain/meet_n_train_events/data/models/tag_model.dart';
import 'package:meetntrain/meet_n_train_events/data/models/users_model.dart';
import '../../domain/entities/events.dart';

class EventsModel extends Events {
  EventsModel({
    super.id,
    super.title,
    super.description,
    super.spots,
    super.price,
    super.lat,
    super.lon,
    super.placeName,
    super.featuredImage,
    super.deeplink,
    super.date,
    super.tagId,
    super.createdBy,
    super.communityId,
    super.paymentMethod,
    super.whatsapp_link,
    super.images,
    super.finish_date,
    super.location_id,
    super.cancelled_at,
    super.users,
    super.tag,
    super.community,
    super.isWaiting,
    super.isJoined,
    super.joinedUsersCount,
    super.checkedInCount,
    super.paidAmount,
    super.ownerEarnings,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      lat: json['lat'],
      lon: json['lon'],
      placeName: json['placeName'],
      paymentMethod: json['paymentMethod'],
      featuredImage: json['featured_image'],
      deeplink: json['deeplink'],
      date: json['date'],
      tagId: json['tag_id'],
      createdBy: json['created_by'],
      communityId: json['community_id'],
      whatsapp_link: json['whatsapp_link'],
      images: (json['images'] as List)
          .map((e) => ImageUrlModel.fromJson(e))
          .toList(),
      finish_date: json['finish_date'],
      location_id: json['location_id'],
      cancelled_at: json['cancelled_at'],
      users:
          (json['users'] as List).map((e) => UsersModel.fromJson(e)).toList(),
      tag: TagModel.fromJson(json['tag']),
      community: CommunityModel.fromJson(json['community']),
      isWaiting: json['is_waiting'],
      isJoined: json['is_joined'],
      joinedUsersCount: json['joined_users_count'],
      checkedInCount: json['checked_in_count'],
      paidAmount: json['paid_amount'],
      ownerEarnings: json['owner_earnings'],
    );
  }
}
