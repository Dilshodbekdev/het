import 'dart:io';

/// fitters : [54]

class MasterCloseBody {
  MasterCloseBody({
    this.result_obxod,
    this.result_remont,
    this.cause_of_damage,
    this.het_object_property,
    this.id,
    this.type,
    this.master_comment,
    this.prophylactic_data,
    this.document_master,
  });

  int? result_obxod;
  int? result_remont;
  int? cause_of_damage;
  int? het_object_property;
  int? id;
  String? type;
  String? master_comment;
  String? prophylactic_data;
  File? document_master;
}
