import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/authentication/api_routes/api_routes.dart';
import 'package:school_management/authentication/models/HomeWork/homework_model.dart';
import 'package:school_management/authentication/pref_keys/pref_keys.dart';
import 'package:school_management/authentication/shared_prefernces/common_utils.dart';


class HomeworksProvider with ChangeNotifier {
  bool _isLoading = false;
  HomeworkResponse _homeworkModel = HomeworkResponse();

  bool get isLoading => _isLoading;
  HomeworkResponse get homeworkModel => _homeworkModel;

  // Fetch holiday data
  Future<void> home() async {
    _setLoading(true); // Start loading
    String? token = await CommonUtils.getPref(PrefKeys.token);

    // Handle case where token is not available
    if (token == null) {
      Fluttertoast.showToast(
        msg: "No token available, please log in again.",
        backgroundColor: Colors.red,
      );
      _setLoading(false);
      return;
    }

    var apiUrl = Uri.parse(ApiRoutes.Homeworks);

    try {
      final response = await http.get(
        apiUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      // Handle the response
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print("Live Classes   -- $responseBody");
        _homeworkModel = HomeworkResponse.fromJson(responseBody); // Map JSON to model
        _setLoading(false);
        notifyListeners();
      } else {
        throw Exception('Failed to load holiday data');
      }
    } catch (e) {
      _setLoading(false);
      Fluttertoast.showToast(
        msg: "Error Dashboard: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  // Set the loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
