import 'package:flutter/material.dart';
// Ham main chay ung dung
void main() {
  runApp(const MyApp());//Chay ung dung flutter
}
//Man hinh chinh cua app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCalculator(),//goi myHomepage
    );
  }
}
//Activity (man hinh)
class MyCalculator extends StatefulWidget{
  @override
 _MyCalculatorState createState() {
    return _MyCalculatorState();
  }

}
//Lop quan ly trang thai cua man hinh chinh
class _MyCalculatorState extends State<MyCalculator>{
  TextEditingController num1Control = TextEditingController();//text1
  TextEditingController num2Control = TextEditingController();//text2
  //Bien luu ket qua tinh toan
  String kq = '';
  //Ham tinh tong va cap nhap trang thai
  void hamtinhtong(){
    //Lay 2 gia tri tu o nhap du lieu
    double num1 = double.tryParse(num1Control.text)?? 0.0;
    double num2 = double.tryParse(num2Control.text)?? 0.0;
    double tong = num1 + num2;
    //cap hap trang thai
    setState(() {
      kq = 'Tong: $tong';
    });
  }
  //giao dien cua activity
  @override
  Widget build(BuildContext context) {
   return Scaffold(//Tra ve 1 man hinh
     appBar: AppBar(
       title: Text('Ung dung tinh tong'),
     ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           //Phan chinh text 1
           TextField(
             controller: num1Control,//Gan voi o nhap 1
             keyboardType: TextInputType.number,//set cho o nhap chi nhap vao so
             decoration: InputDecoration(labelText: 'Nhap so'),
           ),
           SizedBox(height: 10.0),// khoang cach giua 2 o nhap
           //thanh phan chinh text 2
           TextField(
             controller: num2Control,//Gan voi o nhap 2
             keyboardType: TextInputType.number,//set cho o nhap chi nhap vao so
             decoration: InputDecoration(labelText: 'Nhap so'),
           ),
           SizedBox(height: 10.0),// khoang cach giua 2 o nhap
           //thanh phan chinh - Button click
           ElevatedButton(onPressed: hamtinhtong, child: Text('Tong')),
           SizedBox(height: 20.0),
           //Thanh phan chinh hien thi ket qua
           Text(
             kq,
             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
           ),
         ],
       ),
     ),
   );
  }

}

