// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) => TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) => json.encode(data.toJson());

class TransactionsModel {
    List<List<dynamic>> transactions;
    String lsAbonent;

    TransactionsModel({
        required this.transactions,
        required this.lsAbonent,
    });

    factory TransactionsModel.fromJson(Map<String, dynamic> json) => TransactionsModel(
        transactions: List<List<dynamic>>.from(json["transactions"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        lsAbonent: json["ls_abonent"],
    );

    Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "ls_abonent": lsAbonent,
    };
}

enum TransactionEnum {
    LOCAL_PAY_SKYNET,
    PAY24
}

final transactionEnumValues = EnumValues({
    "Платежная система LocalPaySkynet": TransactionEnum.LOCAL_PAY_SKYNET,
    "Платежная система Pay24": TransactionEnum.PAY24
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
