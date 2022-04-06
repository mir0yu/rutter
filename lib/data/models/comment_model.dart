/// id : 29
/// text : "comment for 27 id"
/// owner : "mirosh"
/// likes_count : 0
/// comments_count : 0
/// comments : "http://0.0.0.0:8080/api/v1/tweet/comments/29/"
/// parent : 27
/// created_at : "2022-04-06 20:45:33"
/// modified_at : "2022-04-06 20:45:33"

class CommentModel {
  CommentModel({
      this.id, 
      required this.text,
      this.owner, 
      this.likesCount, 
      this.commentsCount, 
      this.comments, 
      required this.parent,
      this.createdAt, 
      this.modifiedAt,});

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    owner = json['owner'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    comments = json['comments'];
    parent = json['parent'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }
  int? id;
  String text = '';
  String? owner;
  int? likesCount;
  int? commentsCount;
  String? comments;
  int parent = -1;
  String? createdAt;
  String? modifiedAt;
CommentModel copyWith({  int? id,
  String? text,
  String? owner,
  int? likesCount,
  int? commentsCount,
  String? comments,
  int? parent,
  String? createdAt,
  String? modifiedAt,
}) => CommentModel(  id: id ?? this.id,
  text: text ?? this.text,
  owner: owner ?? this.owner,
  likesCount: likesCount ?? this.likesCount,
  commentsCount: commentsCount ?? this.commentsCount,
  comments: comments ?? this.comments,
  parent: parent ?? this.parent,
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
    map['parent'] = parent;
    map['created_at'] = createdAt;
    map['modified_at'] = modifiedAt;
    return map;
  }

}