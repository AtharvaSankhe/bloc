import 'package:bloc_api/repository/networking.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/posts.dart';

class PostRepository{
    Networking networking = Networking();

  Future<List<Post>> fetchPosts() async{
    try{
      Response response = await networking.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      List<Post> posts =  postMaps.map((postmap) => Post.fromJson(postmap)).toList();
      return posts ;
    }catch(e){
      debugPrint("some error occured ${e}");
      // throw e;
      return [];
    }


  }




}