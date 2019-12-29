import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:telcam_app/app_constants/dropbox_config.dart';
import 'package:telcam_app/services/auth_service.dart';

class SearchFoldersService {

  static Future<http.Response> getFoldersList(Map<String, dynamic> body) async {
    String url = SEARCH_FOLDERS_URL;
    var response = await http
        .post(Uri.encodeFull(url), body: json.encode(body) ,headers: {'Authorization': 'Bearer ${AuthService.getToken()}', 'Content-type': 'Application/json'});
    return response;
  }
}