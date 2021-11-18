import 'dart:convert';
import 'dart:io';

import 'package:agro_tools/app/modules/main/submodules/community/models/channel.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/repositories/thread_repository.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:universal_io/io.dart' as IO;
part 'thread_new_post_store.g.dart';

class ThreadNewPostStore = ThreadNewPostStoreBase with _$ThreadNewPostStore;

abstract class ThreadNewPostStoreBase with Store {
  final ThreadRepository _repository;
  QuillController? quillController;
  final FocusNode focusNode = FocusNode();

  bool isLoading = false;

  ThreadNewPostStoreBase(this._repository) {
    loadFromAssets();
  }

  // Renders the image picked by imagePicker from local file storage
  // You can also upload the picked image to any server (eg : AWS s3
  // or Firebase) and then return the uploaded image URL.
  @action
  Future<String> onImagePickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    // final appDocDir = await getApplicationDocumentsDirectory();
    // final copiedFile =
    //     await file.copy('${appDocDir.path}/${basename(file.path)}');
    isLoading = true;
    String? newPath =
        await _repository.uploadFile(file.path, basename(file.path));
    print("resultado: $newPath");
    isLoading = false;
    if (newPath != null) {
      return newPath;
    }

    throw Exception('Ocorreu um erro ao adicionar imagem');
  }

  // Renders the video picked by imagePicker from local file storage
  // You can also upload the picked video to any server (eg : AWS s3
  // or Firebase) and then return the uploaded video URL.
  @action
  Future<String> onVideoPickCallback(File file) async {
    isLoading = true;
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  // Renders the video picked by imagePicker from local file storage
  // You can also upload the picked video to any server (eg : AWS s3
  // or Firebase) and then return the uploaded video URL.
  @action
  Future<String> onFilePickCallback(File file) async {
    isLoading = true;
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
  }

  

  @action
  Future<void> loadFromAssets() async {
    isLoading = true;
    final doc = Document()..insert(0, '');
    quillController = QuillController(
        document: doc, selection: const TextSelection.collapsed(offset: 0));
    isLoading = false;
  }

  @action
  bool isDesktop() => !kIsWeb && !Platform.isAndroid && !Platform.isIOS;

  @action
  Future<String?> openFileSystemPickerForDesktop(BuildContext context) async {
    isLoading = true;
    return await FilesystemPicker.open(
      context: context,
      rootDirectory: await getApplicationDocumentsDirectory(),
      fsType: FilesystemType.file,
      fileTileSelectMode: FileTileSelectMode.wholeTile,
    );
  }

  @action
  Future<String?> webImagePickImpl(
      OnImagePickCallback onImagePickCallback) async {
    isLoading = true;
    final result =
        await new ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) {
      return null;
    }

    // Take first, because we don't allow picking multiple files.
    final fileName = result.name;
    final file = File(fileName);

    return onImagePickCallback(file);
  }

  @action
  Future<void> sendComment() async {
    Thread? thread;
    try {
      isLoading = true;
      var json = jsonEncode(quillController?.document.toDelta().toJson());
      thread = await this._repository.store(thread: Thread(body: json));
    } catch (e) {
      print(e);
      isLoading = false;
    } finally {
      isLoading = false;
      if (thread != null) {
        Modular.to.pop();
      }
    }
  }
}
