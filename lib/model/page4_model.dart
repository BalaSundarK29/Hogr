import 'dart:convert';

Page4Model page4ModelFromJson(String str) => Page4Model.fromJson(json.decode(str));

String page4ModelToJson(Page4Model data) => json.encode(data.toJson());

class Page4Model {
    List<String> page4;

    Page4Model({
        required this.page4,
    });

    factory Page4Model.fromJson(Map<String, dynamic> json) => Page4Model(
        page4: List<String>.from(json["page4"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page4": List<dynamic>.from(page4.map((x) => x)),
    };
}
