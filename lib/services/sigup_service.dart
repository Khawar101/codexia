import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:codexia/services/model/authModel.dart';
import 'package:codexia/services/model/hotelModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SigupService {

  
  String? imagePath;
  uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    imagePath = image!.path;
  }

  Authentication? authdata;

  authentication(email, password, name, phone, confirmPassword) async {
    try {
      var uri =
          Uri.parse('https://codexia.xyz/food/public/api/app/register-user');

      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      });

      File photo = File(imagePath!);
      // Add fields to the request
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['confirm_password'] = confirmPassword;

      // Add file to the request
      var photoStream = http.ByteStream(Stream.castFrom(photo.openRead()));
      var photoLength = await photo.length();
      var photoMultipartFile = http.MultipartFile(
          'photo', photoStream, photoLength,
          filename: 'photo.png');
      request.files.add(photoMultipartFile);

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
         authdata =
            Authentication.fromJson(jsonDecode(responseBody));
        log(responseBody);
        log(authdata.toString());
        return authdata;
      } else {
        // throw Exception('Failed to load album');
      }
    } catch (e) {
      log("===========>$e");
      throw e; // rethrow the exception after logging
    }
  }

  ///next data

List<HotelData>? hotelData;

hotelDataGet() async {
  try {
    var response = await http.get(
      Uri.parse("https://codexia.xyz/food/public/api/app/get-homepage-data"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authdata!.token.toString()}',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> hotelDataMap = jsonDecode(response.body);
      
      // Assuming 'HotelData.fromJson' method handles a map
      hotelData = [HotelData.fromJson(hotelDataMap)];

      log(response.body);
      log(hotelData.toString());
      return hotelData;
    }
  } catch (e) {
    log("======>list==$e");
  }
}

}
