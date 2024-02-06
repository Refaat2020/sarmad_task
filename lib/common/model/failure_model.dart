class FailureModel {
  FailureModel({
    required this.state,
    required this.message,
    required this.data,
  });
    int ?state;
    String? message;
 String? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureModel &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => state.hashCode ^ message.hashCode ^ data.hashCode;

  FailureModel.fromJson(Map<String, dynamic> json){
    state = json['state'];
    message = json['message'];
    data = json['data'];
  }

}