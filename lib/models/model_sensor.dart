class SensorKebakaran {
  Sensors? sensors;

  SensorKebakaran({this.sensors});

  SensorKebakaran.fromJson(Map<dynamic, dynamic> json) {
    sensors =
        json['Sensors'] != null ? new Sensors.fromJson(json['Sensors']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.sensors != null) {
      data['Sensors'] = this.sensors!.toJson();
    }
    return data;
  }
}

class Sensors {
  SensorApi? sensorApi;
  SensorGas? sensorGas;
  SensorSuhu? sensorSuhu;

  Sensors({this.sensorApi, this.sensorGas, this.sensorSuhu});

  Sensors.fromJson(Map<dynamic, dynamic> json) {
    sensorApi = json['Sensor Api'] != null
        ? new SensorApi.fromJson(json['Sensor Api'])
        : null;
    sensorGas = json['Sensor Gas'] != null
        ? new SensorGas.fromJson(json['Sensor Gas'])
        : null;
    sensorSuhu = json['Sensor Suhu'] != null
        ? new SensorSuhu.fromJson(json['Sensor Suhu'])
        : null;
  }

  Object? get value => null;

  Object? get kondisi => null;

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.sensorApi != null) {
      data['Sensor Api'] = this.sensorApi!.toJson();
    }
    if (this.sensorGas != null) {
      data['Sensor Gas'] = this.sensorGas!.toJson();
    }
    if (this.sensorSuhu != null) {
      data['Sensor Suhu'] = this.sensorSuhu!.toJson();
    }
    return data;
  }
}

class SensorApi {
  String? kondisi;
  bool? value;

  SensorApi({this.kondisi, this.value});

  SensorApi.fromJson(Map<dynamic, dynamic> json) {
    kondisi = json['Kondisi'];
    value = json['Value'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['Kondisi'] = this.kondisi;
    data['Value'] = this.value;
    return data;
  }
}

class SensorGas {
  String? kondisi;
  num? value;

  SensorGas({this.kondisi, this.value});

  SensorGas.fromJson(Map<dynamic, dynamic> json) {
    kondisi = json['Kondisi'];
    value = json['Value'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['Kondisi'] = this.kondisi;
    data['Value'] = this.value;
    return data;
  }
}

class SensorSuhu {
  String? kondisi;
  num? value;

  SensorSuhu({this.kondisi, this.value});

  SensorSuhu.fromJson(Map<dynamic, dynamic> json) {
    kondisi = json['Kondisi'];
    value = json['Value'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['Kondisi'] = this.kondisi;
    data['Value'] = this.value;
    return data;
  }
}
