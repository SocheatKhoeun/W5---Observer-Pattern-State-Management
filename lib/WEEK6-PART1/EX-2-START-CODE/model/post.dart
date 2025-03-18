import '../../EX-2-START-CODE/dto/post_dto.dart';

class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});
  
  ///
  ///Converts a PostDto object into a Post object
  ///
  factory Post.fromDto(PostDto dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      description: dto.body,
    );
  }
}