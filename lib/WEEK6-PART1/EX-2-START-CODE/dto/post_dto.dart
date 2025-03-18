class PostDto {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostDto({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  ///
  /// Convert json to PostDto
  /// 
  factory PostDto.fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    assert(json['title'] is String);
    assert(json['body'] is String);
    assert(json['userId'] is int);

    return PostDto(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}