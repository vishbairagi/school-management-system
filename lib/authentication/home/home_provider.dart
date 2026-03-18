import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/authentication/api_routes/api_routes.dart';
import 'package:school_management/authentication/models/Home/dashboard_model.dart';
import 'package:school_management/authentication/pref_keys/pref_keys.dart';
import 'package:school_management/authentication/shared_prefernces/common_utils.dart';


class DashboardProvider with ChangeNotifier {
  bool _isLoading = false;
  DashboardModel _homeModel = DashboardModel();

  bool get isLoading => _isLoading;
  DashboardModel get homeModel => _homeModel;

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

    var apiUrl = Uri.parse(ApiRoutes.DASHBOARD);

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
        print("Dashboard   -- $responseBody");
        _homeModel = DashboardModel.fromJson(responseBody); // Map JSON to model
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
