import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:travelmate/model/postModelclaa.dart';

class postscreen_controller with ChangeNotifier {
  bool Uploading = false;
  final storgeRef = FirebaseStorage.instance.ref();
  var collectionReference = FirebaseFirestore.instance.collection("Posts");
  List<postModel> postList = [];
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  File? selectedFile;

  postscreen_controller() {
    getVideoPhoto(RequestType.all);
    addPostListner();
  }
//RETRIEVE MEDIA FOR THE FIRST ALBUM
  AssetPathEntity? currentAlbum;

  //HOLD RETRIEVED ASSETS
  List<AssetEntity> assets = [];

  //STORE SELECTED ASSETS
  // List<AssetEntity> selectedAssets = [];

  List<AssetPathEntity> albums = [];

  getVideoPhoto(RequestType type) async {
    isLoading = true;
    notifyListeners();
    //CHECK IF STORAGE PERMISSION IS GRANTED
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth == false) {
      await PhotoManager.openSetting();
    } else {
      //NOW GET ALBUMS THAT HAVE MEDIA IN THEM THEN GET ALL MEDIA IN THEM
      await requestAlbums(type).then(
        (allAlbums) async {
          albums = allAlbums;
          if (albums.isNotEmpty) {
            currentAlbum = albums.first;
          } else {
            isLoading = false;
          }
          notifyListeners();
          //GET MEDIA FOR THE FIRST ALBUM
          if (currentAlbum != null) {
            await requestAlbumAssets(currentAlbum!).then(
              (allAssets) {
                assets = allAssets;
                //STOP LOADING
                // if (assets.isNotEmpty) {
                isLoading = false;
                // }
                notifyListeners();
              },
            );
          }
        },
      );
    }
  }

  Future requestAlbumAssets(AssetPathEntity album) async {
    //SET THE 'END' TO THE HIGHEST NUMBER POSSIBLE
    final List<AssetEntity> assets = await album.getAssetListRange(
      start: 0,
      end: 1000000000000,
    );

    return assets;
  }

  Future requestAlbums(RequestType type) async {
    final List<AssetPathEntity> albums =
        await PhotoManager.getAssetPathList(type: type);
    if (albums.isEmpty) {
      return albums;
    }
    List<AssetPathEntity> newList = <AssetPathEntity>[];
    newList.add(albums.removeAt(0));
    albums.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    newList.addAll(albums);
    return newList;
  }

  selectFile(File? path) {
    selectedFile = path;
    notifyListeners();
  }

  Future addPost(postModel postmodel) async {
    var collectionReference = FirebaseFirestore.instance.collection("Posts");
    final data = {
      "image": postmodel.image,
      "caption": postmodel.caption,
      "location": postmodel.location
    };
    await collectionReference.add(data);
  }

// data retrive from data base
  addPostListner() {
    collectionReference.snapshots().listen((event) {
      log(event.docs.length.toString());
      postList = event.docs
          .map((e) => postModel(
              caption: e["caption"],
              location: e["location"],
              image: e["image"],
              id: e.id))
          .toList();
      notifyListeners();
    });
  }

  deletePost(String id) async {
    await collectionReference.doc(id).delete();
  }

  // image adding to firestorage

  Future<String?> addPostImage(File image, String id) async {
    var imageRef = storgeRef.child('postImages/$id.jpg');

    try {
      await imageRef.putFile(image);
      return await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
