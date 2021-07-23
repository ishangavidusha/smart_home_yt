import 'dart:convert';

class IotDevice {
  String name;
  String iconePath;
  bool status;
  int notify;
  IotDevice({
    required this.name,
    required this.iconePath,
    required this.status,
    required this.notify,
  });

  IotDevice copyWith({
    String? name,
    String? iconePath,
    bool? status,
    int? notify,
  }) {
    return IotDevice(
      name: name ?? this.name,
      iconePath: iconePath ?? this.iconePath,
      status: status ?? this.status,
      notify: notify ?? this.notify,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconePath': iconePath,
      'status': status,
      'notify': notify,
    };
  }

  factory IotDevice.fromMap(Map<String, dynamic> map) {
    return IotDevice(
      name: map['name'],
      iconePath: map['iconePath'],
      status: map['status'],
      notify: map['notify'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IotDevice.fromJson(String source) => IotDevice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IotDevice(name: $name, iconePath: $iconePath, status: $status, notify: $notify)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is IotDevice &&
      other.name == name &&
      other.iconePath == iconePath &&
      other.status == status &&
      other.notify == notify;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      iconePath.hashCode ^
      status.hashCode ^
      notify.hashCode;
  }
}



List<IotDevice> livingRoomData = [
  IotDevice(
    name: "Air Conditioner",
    iconePath: "assets/images/air-conditioner.svg",
    status: true,
    notify: 0
  ),
  IotDevice(
    name: "Lamp",
    iconePath: "assets/images/lamp.svg",
    status: false,
    notify: 0
  ),
  IotDevice(
    name: "Smart TV",
    iconePath: "assets/images/smart-tv.svg",
    status: false,
    notify: 0
  ),
  IotDevice(
    name: "Router",
    iconePath: "assets/images/router.svg",
    status: false,
    notify: 2
  ),
];

List<IotDevice> bedRoomData = [
  IotDevice(
    name: "Air Conditioner",
    iconePath: "assets/images/air-conditioner.svg",
    status: true,
    notify: 0
  ),
  IotDevice(
    name: "Main Lamp",
    iconePath: "assets/images/lamp.svg",
    status: false,
    notify: 0
  ),
  IotDevice(
    name: "Table Lamp",
    iconePath: "assets/images/lamp.svg",
    status: true,
    notify: 0
  ),
  IotDevice(
    name: "Smart TV",
    iconePath: "assets/images/smart-tv.svg",
    status: false,
    notify: 1
  ),
];

List<IotDevice> bathRoomData = [
  IotDevice(
    name: "Main Lamp",
    iconePath: "assets/images/lamp.svg",
    status: false,
    notify: 0
  ),
];

List<IotDevice> kitchenData = [
  IotDevice(
    name: "Air Conditioner",
    iconePath: "assets/images/air-conditioner.svg",
    status: true,
    notify: 1
  ),
  IotDevice(
    name: "Main Lamp",
    iconePath: "assets/images/lamp.svg",
    status: true,
    notify: 0
  ),
];