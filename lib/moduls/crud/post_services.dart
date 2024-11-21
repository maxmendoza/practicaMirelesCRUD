import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning/moduls/crud/entities/post.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Error al cargar los posts');
    }
  }

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear el post');
    }
  }

  Future<Post> updatePost(Post post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${post.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al actualizar el post');
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Error al eliminar el post');
    }
  }
}
