import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/core/router/route_config.dart';
import 'package:het/src/core/services/services.dart';
import 'package:het/src/core/util/app_constants.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
    String lang = await Prefs.getString(AppConstants.kLanguage) ?? "uz";
    if (token.isNotEmpty) {
      options.headers["Authorization"] = 'Bearer $token';
      options.headers["Accept-Language"] = lang;
    }
    LogService.request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  Future<bool> _refreshToken() async {
    String token = await Prefs.getString(AppConstants.kRefreshToken) ?? "";
    try {
      final response = await Dio().post("${AppConstants.baseUrlLocal}api/accounts/refresh/", data: {
        'refresh_token': token,
      });
      if (response.statusCode == 200) {
        Prefs.setString(AppConstants.kAccessToken, response.data['access_tokenn']);
        debugPrint('Refresh token: ${response.data}');
        return true;
      }else{
        debugPrint('Refresh token failed: ${response.data}');
        rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
      }
    } catch (e) {
      // Handle refresh token failure (e.g., log out the user)
      debugPrint('Refresh token failed: $e');
      //rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
    }
    return false;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      //rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
      final isRefreshed= await _refreshToken();
      String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
      if (isRefreshed) {
        // Retry the original request with the new token
        final retryRequest = err.requestOptions;
        retryRequest.headers['Authorization'] = 'Bearer $token';

        // Retry the request using Dio's handler
        try {
          final response = await Dio().fetch(retryRequest);
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(err);
        }
      } else {
        // Handle logout scenario if token refresh failed
        rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
      }
    }
    LogService.errorResponse(err);
    super.onError(err, handler);
  }
}
