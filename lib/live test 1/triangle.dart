import 'dart:io';

main(){
  print("Enter base:");
  double? base = double.tryParse(stdin.readLineSync()!);
  print("Enter height:");
  double? height = double.tryParse(stdin.readLineSync()!);
  triangle(height: height, base: base);
}
void triangle({required double? height,required double? base}){
  if(base==null||height==null){
    throw Exception("null value inserted");
  }else{
    double area = 0.5*base*height;
    print(area);
  }

}