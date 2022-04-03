import 'dart:convert';

class CommentModel {
  final int id;
  final String text;
  final String owner;
  final int likes_count;
  final int comments_count;
  final String comments;
  final int parent;
  final String created_at;
  final String modified_at;
  CommentModel({
    required this.id,
    required this.text,
    required this.owner,
    required this.likes_count,
    required this.comments_count,
    required this.comments,
    required this.parent,
    required this.created_at,
    required this.modified_at,
  });

  CommentModel copyWith({
    int? id,
    String? text,
    String? owner,
    int? likes_count,
    int? comments_count,
    String? comments,
    int? parent,
    String? created_at,
    String? modified_at,
  }) {
    return CommentModel(
      id: id ?? this.id,
      text: text ?? this.text,
      owner: owner ?? this.owner,
      likes_count: likes_count ?? this.likes_count,
      comments_count: comments_count ?? this.comments_count,
      comments: comments ?? this.comments,
      parent: parent ?? this.parent,
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
    result.addAll({'parent': parent});
    result.addAll({'created_at': created_at});
    result.addAll({'modified_at': modified_at});

    return result;
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
      owner: map['owner'] ?? '',
      likes_count: map['likes_count']?.toInt() ?? 0,
      comments_count: map['comments_count']?.toInt() ?? 0,
      comments: map['comments'] ?? '',
      parent: map['parent']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      modified_at: map['modified_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModel(id: $id, text: $text, owner: $owner, likes_count: $likes_count, comments_count: $comments_count, comments: $comments, parent: $parent, created_at: $created_at, modified_at: $modified_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentModel &&
        other.id == id &&
        other.text == text &&
        other.owner == owner &&
        other.likes_count == likes_count &&
        other.comments_count == comments_count &&
        other.comments == comments &&
        other.parent == parent &&
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
    parent.hashCode ^
    created_at.hashCode ^
    modified_at.hashCode;
  }
}