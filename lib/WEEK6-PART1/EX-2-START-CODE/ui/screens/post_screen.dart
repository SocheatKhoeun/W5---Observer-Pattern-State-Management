import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../providers/async_value.dart';
import '../providers/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the post provider from the context
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // Fetch new posts when refresh button is tapped
            onPressed: () => postProvider.fetchPost(45),
            icon: const Icon(Icons.update),
          ),
        ],
      ),
      body: Center(child: _buildBody(postProvider)), // Display content based on the state
    );
  }

  Widget _buildBody(PostProvider postProvider) {
    final postValue = postProvider.postValue;

    // If no data is available, prompt the user to refresh
    if (postValue == null) {
      return const Text('Tap refresh to display posts');
    }

    // Handle different states of the post data
    switch (postValue.state) {
      case AsyncValueState.loading:
        return const CircularProgressIndicator(); // Show a loading indicator

      case AsyncValueState.error:
        return Text('Error: ${postValue.error}'); // Show an error message

      case AsyncValueState.success:
        final posts = postValue.data!;
        
        // Show message if list is empty
        if (posts.isEmpty) {
          return const Text('No posts available'); 
        }
        return PostsList(posts: posts);
    }
  }
}

// Widget to display a list of posts
class PostsList extends StatelessWidget {
  const PostsList({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
    );
  }
}

// Widget to display a single post in a card format
class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.description),
    );
  }
}
