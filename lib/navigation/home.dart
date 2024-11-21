import 'package:flutter/material.dart';
import 'package:learning/moduls/crud/entities/details_crud.dart';
import 'package:learning/moduls/crud/entities/post.dart';
import 'package:learning/moduls/crud/post_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PostService _postService = PostService();
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _postService.fetchPosts();
  }

  void _refresh() {
    setState(() {
      _posts = _postService.fetchPosts();
    });
  }

  Future<void> _addPost() async {
    final newPost = await _postService.createPost(
      Post(id: 0, title: 'Nuevo Post', body: 'Descripción nueva'),
    );
    _refresh();
  }

  Future<void> _deletePost(Post post) async {
    await _postService.deletePost(post.id);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          }
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      post: post,
                      onUpdate: _refresh,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deletePost(post),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addPost,
      ),
    );
  }
}
