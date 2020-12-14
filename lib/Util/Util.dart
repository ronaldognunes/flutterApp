import 'package:intl/intl.dart';

class Util{
  static int convertInt(String value){
    final result = value.replaceAll(',', '').replaceAll('.', '');
    return int.parse(result);
  }  

  static String convertString(int value){
   final f = NumberFormat("###,##","pt_BR");
   return f.format(value);
  }
}