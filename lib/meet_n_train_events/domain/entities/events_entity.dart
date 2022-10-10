import 'package:meetntrain/meet_n_train_events/data/models/event_model.dart';

class EventsEntity extends EventsModel {
  EventsEntity(
      {super.id,
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
      super.ownerEarnings});

  factory EventsEntity.fromJson(Map<String, dynamic> json) {
    return EventsEntity(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      lat: json['lat'],
      lon: json['lon'],
      placeName: json['place_name'],
      featuredImage: json['featured_image'],
      deeplink: json['deeplink'],
      date: json['date'],
      tagId: json['tag_id'],
      createdBy: json['created_by'],
      // communityId: json['community_id'],
      // whatsapp_link: json['whatsapp_link'],
      // images: (json['images'] as List)
      //     .map((e) => ImageUrlEntity.fromJson(e))
      //     .toList(),
      // finish_date: json['finish_date'],
      // location_id: json['location_id'],
      // cancelled_at: json['cancelled_at'],
      // users:
      //     (json['users'] as List).map((e) => UsersEntity.fromJson(e)).toList(),
      // tag: TagEntity.fromJson(json['tag']),
      // community: CommunityEntity.fromJson(json['community']),
      // isWaiting: json['is_waiting'],
      // isJoined: json['is_joined'],
      // joinedUsersCount: json['joined_users_count'],
      // checkedInCount: json['checked_in_count'],
      // paidAmount: json['paid_amount'],
      // ownerEarnings: json['owner_earnings'],
    );
  }
}
