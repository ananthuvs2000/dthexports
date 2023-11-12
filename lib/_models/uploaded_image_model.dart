class UploadedImage {
  final String imagePath;

  UploadedImage({required this.imagePath});

  factory UploadedImage.fromJson(Map<String, dynamic> json) {
    return UploadedImage(
      imagePath:
          json['image_path'] ?? '', // replace 'imagePath' with the actual field name from your API
    );
  }
}
