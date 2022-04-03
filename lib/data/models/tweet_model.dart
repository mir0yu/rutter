import 'dart:convert';

class TweetModel {
  final int id;
  final String text;
  final String owner;
  final int likes_count;
  final int comments_count;
  final String comments;
  final String created_at;
  final String modified_at;
  TweetModel({
    required this.id,
    required this.text,
    required this.owner,
    required this.likes_count,
    required this.comments_count,
    required this.comments,
    required this.created_at,
    required this.modified_at,
  });

  TweetModel copyWith({
    int? id,
    String? text,
    String? owner,
    int? likes_count,
    int? comments_count,
    String? comments,
    String? created_at,
    String? modified_at,
  }) {
    return TweetModel(
      id: id ?? this.id,
      text: text ?? this.text,
      owner: owner ?? this.owner,
      likes_count: likes_count ?? this.likes_count,
      comments_count: comments_count ?? this.comments_count,
      comments: comments ?? this.comments,
      created_at: created_at ?? this.created_at,
      modified_at: modified_at ?? this.modified_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'text': text});
    result.addAll({'owner': owner});
    result.addAll({'likes_count': likes_count});
    result.addAll({'comments_count': comments_count});
    result.addAll({'comments': comments});
    result.addAll({'created_at': created_at});
    result.addAll({'modified_at': modified_at});

    return result;
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
      owner: map['owner'] ?? '',
      likes_count: map['likes_count']?.toInt() ?? 0,
      comments_count: map['comments_count']?.toInt() ?? 0,
      comments: map['comments'] ?? '',
      created_at: map['created_at'] ?? '',
      modified_at: map['modified_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TweetModel.fromJson(String source) => TweetModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TweetModel(id: $id, text: $text, owner: $owner, likes_count: $likes_count, comments_count: $comments_count, comments: $comments, created_at: $created_at, modified_at: $modified_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TweetModel &&
        other.id == id &&
        other.text == text &&
        other.owner == owner &&
        other.likes_count == likes_count &&
        other.comments_count == comments_count &&
        other.comments == comments &&
        other.created_at == created_at &&
        other.modified_at == modified_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    text.hashCode ^
    owner.hashCode ^
    likes_count.hashCode ^
    comments_count.hashCode ^
    comments.hashCode ^
    created_at.hashCode ^
    modified_at.hashCode;
  }
}