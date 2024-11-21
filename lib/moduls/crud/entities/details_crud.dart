import 'package:flutter/material.dart';
import 'package:learning/moduls/crud/post_services.dart';
import 'post.dart';

class Detail extends StatefulWidget {
  final Post? post;
  final VoidCallback onUpdate;

  const Detail({Key? key, this.post, required this.onUpdate}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  final PostService _postService = PostService();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post?.title ?? '');
    _bodyController = TextEditingController(text: widget.post?.body ?? '');
  }

  Future<void> _savePost() async {
    if (_formKey.currentState!.validate()) {
      final post = Post(
        id: widget.post?.id ?? 0,
        title: _titleController.text,
        body: _bodyController.text,
      );

      if (widget.post == null) {
        // Crear nuevo post
        await _postService.createPost(post);
      } else {
        // Actualizar post existente
        await _postService.updatePost(post);
      }
      widget.onUpdate();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? 'Crear Post' : 'Editar Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePost,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
