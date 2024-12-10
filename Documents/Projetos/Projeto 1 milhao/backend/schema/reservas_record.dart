import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ReservasRecord {
  final DateTime? dataEntrada;
  final DateTime? dataSaida;
  final int? numeroHospedes;
  final String? tipoQuarto;
  final DocumentReference reference;

  ReservasRecord._(
    this.reference, {
    this.dataEntrada,
    this.dataSaida,
    this.numeroHospedes,
    this.tipoQuarto,
  });

  static ReservasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservasRecord._(
        reference,
        dataEntrada: data['dataEntrada'] as DateTime?,
        dataSaida: data['dataSaida'] as DateTime?,
        numeroHospedes: data['numeroHospedes'] as int?,
        tipoQuarto: data['tipoQuarto'] as String?,
      );

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservas');

  static Stream<List<ReservasRecord>> queryReservasRecord({
    Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false,
  }) {
    final builder = queryBuilder ?? (q) => q;
    var query = builder(collection);
    if (limit > 0 || singleRecord) {
      query = query.limit(singleRecord ? 1 : limit);
    }
    return query.snapshots().map((s) => s.docs
        .map(
          (d) => ReservasRecord.getDocumentFromData(
            d.data() as Map<String, dynamic>,
            d.reference,
          ),
        )
        .toList());
  }
}

Map<String, dynamic> createReservasRecordData({
  DateTime? dataEntrada,
  DateTime? dataSaida,
  int? numeroHospedes,
  String? tipoQuarto,
}) {
  final firestoreData = {
    'dataEntrada': dataEntrada,
    'dataSaida': dataSaida,
    'numeroHospedes': numeroHospedes,
    'tipoQuarto': tipoQuarto,
  };

  return firestoreData;
}
