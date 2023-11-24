import 'dart:convert';
import 'package:dth/_api_endpoints/api_endpoints.dart';
import 'package:dth/_models/uploaded_image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageUploadService extends ChangeNotifier {
  final String api = '$apiHOME/store_temp_img';

  Future<UploadedImage> uploadImage(String path) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.files.add(await http.MultipartFile.fromPath('image', path));

      // Send the request
      var response = await request.send();

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the response
        final Map<String, dynamic> responseData =
            json.decode(await response.stream.bytesToString());

        // Create a model object from the response data
        UploadedImage uploadedImage = UploadedImage.fromJson(responseData);

        return uploadedImage;
      } else {
        // Handle other status codes

        throw Exception('Failed to upload image: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors during the request
      print('Error during image upload: $error');
      throw Exception('Error during image upload: $error');
    }
  }
}
