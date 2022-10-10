import 'package:meetntrain/meet_n_train_events/data/models/image_url_model.dart';
import 'package:meetntrain/meet_n_train_events/data/models/tagModel.dart';
import 'package:meetntrain/meet_n_train_events/data/models/users_model.dart';
import 'package:meetntrain/meet_n_train_events/domain/entities/community_entity.dart';
import 'package:meetntrain/meet_n_train_events/domain/entities/image_url_entity.dart';
import 'package:meetntrain/meet_n_train_events/domain/entities/tag_entity.dart';
import 'package:meetntrain/meet_n_train_events/domain/entities/users_entity.dart';

class EventsModel {
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

  EventsModel({
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
          .map((e) => ImageUrlEntity.fromJson(e))
          .toList(),
      finish_date: json['finish_date'],
      location_id: json['location_id'],
      cancelled_at: json['cancelled_at'],
      users:
          (json['users'] as List).map((e) => UsersEntity.fromJson(e)).toList(),
      tag: TagEntity.fromJson(json['tag']),
      community: CommunityEntity.fromJson(json['community']),
      isWaiting: json['is_waiting'],
      isJoined: json['is_joined'],
      joinedUsersCount: json['joined_users_count'],
      checkedInCount: json['checked_in_count'],
      paidAmount: json['paid_amount'],
      ownerEarnings: json['owner_earnings'],
    );
  }
}
