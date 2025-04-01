// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_tasks_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _MasterTasksApiService implements MasterTasksApiService {
  _MasterTasksApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<List<MasterFitterModel>>> fitters() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<List<MasterFitterModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/accounts/fitters',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MasterFitterModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              MasterFitterModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MasterResultModel>>> resultObxodList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<List<MasterResultModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/hetobject/result-obxod-list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MasterResultModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              MasterResultModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MasterResultModel>>> resultRemontList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<List<MasterResultModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/hetobject/result-remont-list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MasterResultModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              MasterResultModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<MasterCauseDamageModel>>> causeDamageList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<List<MasterCauseDamageModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/task/cause-damage-list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MasterCauseDamageModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              MasterCauseDamageModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> acceptObxod(
    MasterAcceptBody body,
    int id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/task/add-fitters-for-obxod/${id}/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> acceptRemont(
    MasterAcceptBody body,
    int id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/task/add-fitters-for-remont/${id}/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> closeObxod(
    int id,
    int? result_obxod,
    String? master_comment,
    File document_master,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (result_obxod != null) {
      _data.fields.add(MapEntry(
        'result_obxod',
        result_obxod.toString(),
      ));
    }
    if (master_comment != null) {
      _data.fields.add(MapEntry(
        'master_comment',
        master_comment,
      ));
    }
    _data.files.add(MapEntry(
      'document_master',
      MultipartFile.fromFileSync(
        document_master.path,
        filename: document_master.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options = _setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/task/obxod-close-for-master/${id}/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> closeRemont(
    int id,
    int? result_remont,
    int? cause_of_damage,
    String? master_comment,
    String? prophylactic_data,
    File document_master,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (result_remont != null) {
      _data.fields.add(MapEntry(
        'result_remont',
        result_remont.toString(),
      ));
    }
    if (cause_of_damage != null) {
      _data.fields.add(MapEntry(
        'cause_of_damage',
        cause_of_damage.toString(),
      ));
    }
    if (master_comment != null) {
      _data.fields.add(MapEntry(
        'master_comment',
        master_comment,
      ));
    }
    if (prophylactic_data != null) {
      _data.fields.add(MapEntry(
        'prophylactic_data',
        prophylactic_data,
      ));
    }
    _data.files.add(MapEntry(
      'document_master',
      MultipartFile.fromFileSync(
        document_master.path,
        filename: document_master.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options = _setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/task/remont-close-for-master/${id}/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> closeEmergencyRemont(
    int id,
    int? result_remont,
    int? cause_of_damage,
    int? het_object_property,
    String? master_comment,
    String? prophylactic_data,
    File document_master,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (result_remont != null) {
      _data.fields.add(MapEntry(
        'result_remont',
        result_remont.toString(),
      ));
    }
    if (cause_of_damage != null) {
      _data.fields.add(MapEntry(
        'cause_of_damage',
        cause_of_damage.toString(),
      ));
    }
    if (het_object_property != null) {
      _data.fields.add(MapEntry(
        'het_object_property',
        het_object_property.toString(),
      ));
    }
    if (master_comment != null) {
      _data.fields.add(MapEntry(
        'master_comment',
        master_comment,
      ));
    }
    if (prophylactic_data != null) {
      _data.fields.add(MapEntry(
        'prophylactic_data',
        prophylactic_data,
      ));
    }
    _data.files.add(MapEntry(
      'document_master',
      MultipartFile.fromFileSync(
        document_master.path,
        filename: document_master.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options = _setStreamType<HttpResponse<dynamic>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/task/res/master/emergency-remont/${id}/close/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
