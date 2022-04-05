/// id : 5
/// text : "kjahsdkjhaskjdh text"
/// owner : "mirosh"
/// likes_count : 0
/// comments_count : 3
/// comments : "http://0.0.0.0:8080/api/v1/tweet/comments/5/"
/// created_at : "2022-03-29 09:24:25"
/// modified_at : "2022-04-04 13:53:22"

class TweetModel {
  TweetModel({
      this.id, 
      this.text, 
      this.owner, 
      this.likesCount, 
      this.commentsCount, 
      this.comments, 
      this.createdAt, 
      this.modifiedAt,});

  TweetModel.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    owner = json['owner'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    comments = json['comments'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }
  int? id;
  String? text;
  String? owner;
  int? likesCount;
  int? commentsCount;
  String? comments;
  String? createdAt;
  String? modifiedAt;
TweetModel copyWith({  int? id,
  String? text,
  String? owner,
  int? likesCount,
  int? commentsCount,
  String? comments,
  String? createdAt,
  String? modifiedAt,
}) => TweetModel(  id: id ?? this.id,
  text: text ?? this.text,
  owner: owner ?? this.owner,
  likesCount: likesCount ?? this.likesCount,
  commentsCount: commentsCount ?? this.commentsCount,
  comments: comments ?? this.comments,
  createdAt: createdAt ?? this.createdAt,
  modifiedAt: modifiedAt ?? this.modifiedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['owner'] = owner;
    map['likes_count'] = likesCount;
    map['comments_count'] = commentsCount;
    map['comments'] = comments;
    map['created_at'] = createdAt;
    map['modified_at'] = modifiedAt;
    return map;
  }

}