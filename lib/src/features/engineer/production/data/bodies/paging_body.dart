class PagingBody {
  int? page;
  int? pageSize = 10;
  String? search;
  String? status;
  bool? tempSave;
  int? id;

  PagingBody({
    this.page,
    this.pageSize,
    this.search,
    this.status,
    this.tempSave,
    this.id,
  });

  PagingBody copyWith({
    int? page,
    int? pageSize,
    String? search,
    String? status,
    bool? tempSave,
    int? id,
  }) =>
      PagingBody(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        search: search ?? this.search,
        status: status ?? this.status,
        tempSave: tempSave ?? this.tempSave,
        id: id ?? this.id,
      );
}
