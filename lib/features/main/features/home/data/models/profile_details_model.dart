// To parse this JSON data, do
//
//     final profileDetailsModel = profileDetailsModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) => ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) => json.encode(data.toJson());

class ProfileDetailsModel {
    String? balance;
    Credit? credit;
    List<Service>? services;
    String? name;
    int? nPrice;
    dynamic traffik;
    List<String>? address;
    String? ls;
    dynamic ipAddress;
    String? vcRem;
    String? nSum;

    ProfileDetailsModel({
        this.balance,
        this.credit,
        this.services,
        this.name,
        this.nPrice,
        this.traffik,
        this.address,
        this.ls,
        this.ipAddress,
        this.vcRem,
        this.nSum,
    });

    factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) => ProfileDetailsModel(
        balance: json["balance"],
        credit: json["credit"] == null ? null : Credit.fromJson(json["credit"]),
        services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
        name: json["name"],
        nPrice: json["n_price"],
        traffik: json["traffik"],
        address: json["address"] == null ? [] : List<String>.from(json["address"]!.map((x) => x)),
        ls: json["ls"],
        ipAddress: json["ip_address"],
        vcRem: json["vc_rem"],
        nSum: json["n_sum"],
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
        "credit": credit?.toJson(),
        "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
        "name": name,
        "n_price": nPrice,
        "traffik": traffik,
        "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x)),
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
        this.nSum,
        this.dEnd,
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

class Service {
    String? name;
    String? state;
    int? price;
    dynamic quantity;

    Service({
        this.name,
        this.state,
        this.price,
        this.quantity,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        state: json["state"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "state": state,
        "price": price,
        "quantity": quantity,
    };
}
