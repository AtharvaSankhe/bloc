import 'package:bloc_api/repository/post_repo.dart';
import 'package:flutter/material.dart';

import 'model/posts.dart';
import 'screen/homescreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  PostRepository postRepository = PostRepository();
  List<Post>post = await postRepository.fetchPosts() ;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}

