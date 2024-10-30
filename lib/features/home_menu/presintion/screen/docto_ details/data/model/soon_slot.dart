class SoonSlot{
  final String start;
  final  String end;
 final String day;
  SoonSlot({required this.start,required this.end,required this.day});
  factory SoonSlot.fromJson(json){
    return SoonSlot(start: json['nextAvailableSlot']['start'], end: json['nextAvailableSlot']['end'],day: json['nextAvailableDate']);
  }

}