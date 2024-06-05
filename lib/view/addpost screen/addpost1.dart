import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/view/addpost%20screen/postscreen2.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  XFile? files;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close)),
            title: Text(
              "New Post",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    var selectedFile =
                        context.read<postscreen_controller>().selectedFile;
                    if (selectedFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("select a image")));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => PostScreen(
                              imagefile: context
                                  .read<postscreen_controller>()
                                  .selectedFile!,
                            ),
                          ));
                    }
                  },
                  child: Text("post"))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(children: [
                  InkWell(
                    onTap: () async {
                      files = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (files != null) {
                        context
                            .read<postscreen_controller>()
                            .selectFile(File(files!.path));
                      } else {}
                    },
                    child: Consumer<postscreen_controller>(
                      builder: (context, value, child) => Container(
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: value.selectedFile == null
                                ? null
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(value.selectedFile!))),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0150,
                    right: 155,
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 100,
                        color: Colors.white.withOpacity(.4),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Icon(
                        Icons.expand,
                        color: Colors.white,
                        size: 30,
                      ))
                ])
              ],
            ),
          ),
          Consumer<postscreen_controller>(
            builder: (context, value, child) {
              if (value.assets.isEmpty && value.isLoading == false)
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(value.currentAlbum == null
                        ? 'No video album found!'
                        : 'Album is empty'),
                  ),
                );
              if (value.isLoading == true)
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              if (value.assets.isNotEmpty)
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final entity = value.assets[index];
                      return GestureDetector(
                        onTap: () async {
                          value.selectFile(await entity.file);
                          // Get.to(
                          //   VideoConverterPage(
                          //     filePath: (await entity.file)!.path,
                          //   ),
                          //   // arguments: VideoArguments(
                          //   //     filePath: (await entity.file)!.path),
                          // );
                          // Navigator.pushNamed(
                          //   context,
                          //   VideoConverterPage.routeName,
                          //   arguments: VideoArguments(assetEntity: entity),
                          // );
                          // getVideoInfo((await entity.file)!.path);

                          // if (selectedAssets.contains(entity)) {
                          //   setState(() {
                          //     selectedAssets.remove(entity);
                          //   });
                          // } else {
                          //   setState(() {
                          //     selectedAssets.add(entity);
                          //   });
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: assetMediaWidget(entity /*, selectedAssets*/),
                        ),
                      );
                    },
                    childCount: value.assets.length,
                  ),
                );

              return SliverGrid(
                  delegate:
                      SliverChildBuilderDelegate((context, index) => Container(
                            color: Colors.amber,
                          )),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ));
            },
          )
        ],
      ),
    );
  }

  Widget assetMediaWidget(entity /*, selectedAssets*/) => Stack(
        children: [
          Positioned.fill(
            child: AssetEntityImage(
              entity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.black38,
                  ),
                );
              },
            ),
          ),
          if (entity.type == AssetType.video)
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${entity.height}p',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          // if (entity.type == AssetType.video)
          //   Positioned.fill(
          //     child: Align(
          //       alignment: Alignment.bottomLeft,
          //       child: Padding(
          //         padding: const EdgeInsets.all(5),
          //         child: Text(
          //           formatTime(timeInSecond: entity.duration.toDouble()),
          //           style: const TextStyle(
          //               color: Colors.white,
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //               shadows: [
          //                 Shadow(
          //                   color: Colors.black,
          //                   blurRadius: 10,
          //                   offset: Offset(1, 1),
          //                 )
          //               ]),
          //         ),
          //       ),
          //     ),
          //   ),
          //ADD AN ICON FOR SELECTED ASSETS
          // if (selectedAssets.contains(entity))
          //   Positioned.fill(
          //     child: Container(
          //       color: Colors.blueAccent.withOpacity(0.3),
          //       child: const Icon(
          //         Icons.check,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
        ],
      );
}
