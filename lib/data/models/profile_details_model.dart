

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) => ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) => json.encode(data.toJson());

class ProfileDetailsModel {
    String balance;
    Credit credit;
    List<dynamic> services;
    String name;
    dynamic nPrice;
    dynamic traffik;
    List<String> address;
    int ls;
    dynamic ipAddress;
    String vcRem;
    dynamic nSum;

    ProfileDetailsModel({
        required this.balance,
        required this.credit,
        required this.services,
        required this.name,
        required this.nPrice,
        required this.traffik,
        required this.address,
        required this.ls,
        required this.ipAddress,
        required this.vcRem,
        required this.nSum,
    });

    factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) => ProfileDetailsModel(
        balance: json["balance"],
        credit: Credit.fromJson(json["credit"]),
        services: List<dynamic>.from(json["services"].map((x) => x)),
        name: json["name"],
        nPrice: json["n_price"],
        traffik: json["traffik"],
        address: List<String>.from(json["address"].map((x) => x)),
        ls: json["ls"],
        ipAddress: json["ip_address"],
        vcRem: json["vc_rem"],
        nSum: json["n_sum"],
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
        "credit": credit.toJson(),
        "services": List<dynamic>.from(services.map((x) => x)),
        "name": name,
        "n_price": nPrice,
        "traffik": traffik,
        "address": List<dynamic>.from(address.map((x) => x)),
        "ls": ls,
        "ip_address": ipAddress,
        "vc_rem": vcRem,
        "n_sum": nSum,
    };
}

class Credit {
    dynamic nSum;
    dynamic dEnd;

    Credit({
        required this.nSum,
        required this.dEnd,
    });

    factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        nSum: json["n_sum"],
        dEnd: json["d_end"],
    );

    Map<String, dynamic> toJson() => {
        "n_sum": nSum,
        "d_end": dEnd,
    };
}
