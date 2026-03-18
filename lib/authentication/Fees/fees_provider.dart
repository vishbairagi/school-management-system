/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/authentication/api_routes/api_routes.dart';
import 'package:school_management/authentication/models/Fees/fees_history_model.dart' hide FeeHistoryResponse, HistoryData;
import 'package:school_management/authentication/models/Fees/fees_unpaid_model.dart' hide FeesUnpaidModel, UnpaidData;
import 'package:school_management/authentication/pref_keys/pref_keys.dart';
import 'package:school_management/authentication/shared_prefernces/common_utils.dart';

import '../models/fees/fees_history_model.dart';
import '../models/fees/fees_unpaid_model.dart';
class FeesProvider with ChangeNotifier {
  bool _isLoading = false;

  FeeHistoryResponse _historyModel = FeeHistoryResponse();
  FeesUnpaidModel _unpaidModel = FeesUnpaidModel();

  bool get isLoading => _isLoading;

  // Updated getters for screen
  HistoryData? get historyData => _historyModel.data;
  UnpaidData? get unpaidData => _unpaidModel.data;

  // Set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Fetch fee payment history
  Future<void> fetchHistory() async {
    _setLoading(true);
    String? token = await CommonUtils.getPref(PrefKeys.token);

    if (token == null) {
      Fluttertoast.showToast(
        msg: "No token available, please log in again.",
        backgroundColor: Colors.red,
      );
      _setLoading(false);
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(ApiRoutes.paymenthistory),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        _historyModel = FeeHistoryResponse.fromJson(jsonBody);
        _setLoading(false);
      } else {
        throw Exception('Failed to fetch fee history');
      }
    } catch (e) {
      _setLoading(false);
      Fluttertoast.showToast(
        msg: "Error fetching fee history: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  // Fetch unpaid invoices
  Future<void> fetchUnpaid() async {
    _setLoading(true);
    String? token = await CommonUtils.getPref(PrefKeys.token);

    if (token == null) {
      Fluttertoast.showToast(
        msg: "No token available, please log in again.",
        backgroundColor: Colors.red,
      );
      _setLoading(false);
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(ApiRoutes.uppaidfees),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        _unpaidModel = FeesUnpaidModel.fromJson(jsonBody);
        _setLoading(false);
      } else {
        throw Exception('Failed to fetch unpaid invoices');
      }
    } catch (e) {
      _setLoading(false);
      Fluttertoast.showToast(
        msg: "Error fetching unpaid invoices: $e",
        backgroundColor: Colors.red,
      );
    }
  }
}*/



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/authentication/api_routes/api_routes.dart';
import 'package:school_management/authentication/pref_keys/pref_keys.dart';
import 'package:school_management/authentication/shared_prefernces/common_utils.dart';

// ✅ ONLY USE ONE MODEL PATH (IMPORTANT)
import '../models/fees/fees_history_model.dart';
import '../models/fees/fees_unpaid_model.dart';

class FeesProvider with ChangeNotifier {
  bool _isLoading = false;

  FeeHistoryResponse _historyModel = FeeHistoryResponse();
  FeesUnpaidModel _unpaidModel = FeesUnpaidModel();

  bool get isLoading => _isLoading;

  HistoryData? get historyData => _historyModel.data;
  UnpaidData? get unpaidData => _unpaidModel.data;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// ================= FETCH HISTORY =================
  Future<void> fetchHistory() async {
    _setLoading(true);

    try {
      String? token = await CommonUtils.getPref(PrefKeys.token);

      final response = await http.get(
        Uri.parse(ApiRoutes.paymenthistory),
        headers: {'Authorization': 'Bearer $token'},
      );

      final jsonBody = json.decode(response.body);

      if (response.statusCode == 200 && jsonBody["success"] == true) {
        _historyModel = FeeHistoryResponse.fromJson(jsonBody);
      } else {
        Fluttertoast.showToast(msg: jsonBody["message"] ?? "History failed ❌");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "History Error: $e");
    }

    _setLoading(false);
  }

  /// ================= FETCH UNPAID =================
  Future<void> fetchUnpaid() async {
    _setLoading(true);

    try {
      String? token = await CommonUtils.getPref(PrefKeys.token);

      final response = await http.get(
        Uri.parse(ApiRoutes.uppaidfees),
        headers: {'Authorization': 'Bearer $token'},
      );

      final jsonBody = json.decode(response.body);

      if (response.statusCode == 200 && jsonBody["success"] == true) {
        _unpaidModel = FeesUnpaidModel.fromJson(jsonBody);
      } else {
        Fluttertoast.showToast(msg: jsonBody["message"] ?? "Unpaid failed ❌");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Unpaid Error: $e");
    }

    _setLoading(false);
  }

  /// ================= SUBMIT PAYMENT =================
  Future<bool> submitPayment({
    required String invoiceId,
    required String amount,
    required String method,
  }) async {
    try {
      String? token = await CommonUtils.getPref(PrefKeys.token);

      final response = await http.post(
        Uri.parse(ApiRoutes.paymenthistory), // ✅ ADD THIS IN API ROUTES
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "invoice_id": invoiceId,
          "amount": amount,
          "payment_method": method,
        },
      );

      final jsonBody = json.decode(response.body);

      print("SUBMIT RESPONSE: $jsonBody"); // 🔥 DEBUG

      if (response.statusCode == 200 && jsonBody["success"] == true) {
        return true;
      } else {
        Fluttertoast.showToast(
            msg: jsonBody["message"] ?? "Payment failed ❌");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Submit Error: $e");
      return false;
    }
  }
}