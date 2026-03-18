import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../api_routes/api_routes.dart';
import '../../loading_widget/loadingwidget.dart';
import '../../models/login_model.dart';
import '../../pref_keys/pref_keys.dart';
import '../../shared_prefernces/common_utils.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  LoginModel _loginModal = LoginModel();

  bool get isLoading => _isLoading;
  LoginModel get loginModal => _loginModal;

  Future<void> login(BuildContext context,  String username, String password, Function successCall) async {
    _setLoading(true);
    loadingWidget(context);
    var url = Uri.parse(ApiRoutes.LOGIN);

    var credentials = {
      'username': username,
      'password': password,
    };
    print("Credentials = ${credentials}");
    try {
      final response = await http.post(url, body: credentials);
      Navigator.pop(context); // Loading widget close

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = jsonDecode(response.body);

        print("Status Code: ${response.statusCode}");
        print("Body: ${response.body}");
        if (responseBody.containsKey("token")) {
          _loginModal = LoginModel.fromJson(responseBody);
          CommonUtils.savePref(PrefKeys.token, responseBody["token"] ?? " ");
          print("token= ${responseBody["token"]}");
          // CommonUtils.savePref(PrefKeys.id, responseBody["id"] ?? " ");
          // print("id= ${responseBody["id"]}");
           print(" Login Response Body = ${responseBody}");
          successCall();
          CommonUtils.savePref(PrefKeys.isLogin, true);
          Fluttertoast.showToast(msg: "Login Successful", backgroundColor: Colors.green);
        } else {
          _showToast("Login Failed");
        }
      } else {
        _showToast("Login Failed");
      }
    } catch (e) {
       print("An error occurred: $e");
      _showToast("An error occurred. Please try again.");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
    );
  }
}
