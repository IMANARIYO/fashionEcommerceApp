import 'dart:convert';

import 'package:ecom_t/common/services/storage.dart';

import 'package:ecom_t/common/utils/environment.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/common/widgets/error_modal.dart';

import 'package:ecom_t/src/auth/models/auth_token_model.dart';
import 'package:ecom_t/src/auth/models/profile_model.dart';
import 'package:ecom_t/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Authnotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void loginFunc(String data, BuildContext ctx) async {
    setLoading(); // Toggle loading before the API call
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/login');
      debugPrint("Sending POST request to URL: $url");
      var response = await http.post(url,
          headers: {'content-Type': 'application/json'}, body: data);

      debugPrint("Response received: ${response.statusCode}");
      if (response.statusCode == 200) {
        String accessToken = acessTokenModelFromJson(response.body).authToken;
        Map<String, dynamic> userInfo = jsonDecode(response.body)['user'];

        Storage().setString('accessToken', accessToken);
        Storage().setString('userInfo', jsonEncode(userInfo));
        // TODO: Get user info
        // TODO: Get user extras
        // setLoading();
        ctx.read<TabIndexNotifier>().setIndex(0);
        ctx.go('/home');
        // ctx.go('/home');
      } else {
        showErrorPopup(ctx, AppText.kErrorLogin, null, null);
      }
    } catch (e) {
      debugPrint("Login failed: $e");

      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    } finally {
      // Stop loading when the operation is complete
      setLoading();
    }
  }

  void getuser(String accessToken) async {
    debugPrint("Get user called with Access Token: $accessToken");
    // TODO: Implement user retrieval logic
  }

  void registrationFunc(String data, BuildContext ctx) async {
    debugPrint("Registration function called with data: $data");
    setLoading(); // Toggle loading before the API call
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/signup');
      debugPrint("Sending POST request to URL: $url");
      var response = await http.post(url,
          headers: {'content-Type': 'application/json'}, body: data);

      debugPrint("Response received: ${response.statusCode}");
      if (response.statusCode == 201) {
        setLoading();
        ctx.pop();
        debugPrint("Registration successful!");
      } else if (response.statusCode == 400) {
        // setLoading();
        var data = jsonDecode(response.body);
        debugPrint("Validation error: ${data['password'][0]}");
        showErrorPopup(ctx, data['password'][0], null, null);
      } else {
        debugPrint("Unexpected response code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Registration failed: $e");
      // setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  ProfileModel? getUserData() {
    String? accessToken = Storage().getString('accessToken');
    if (accessToken != null) {
      return ProfileModel.fromJson(jsonDecode(accessToken));
    } else {
      return null;
    }
  }
}
