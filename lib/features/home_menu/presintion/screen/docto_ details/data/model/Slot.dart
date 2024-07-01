class Slot{
 final String start;
final  String end;

  Slot({required this.start,required this.end});
  factory Slot.fromJson(json){
    return Slot(start: json['start'], end: json['end']);
  }

}