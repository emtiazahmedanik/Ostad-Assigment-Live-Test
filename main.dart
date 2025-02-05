import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      home: MyHomePage(title: 'Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _namecontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> _namelist = [];
  List<String> _numberlist = [];

  FocusNode _namefocusNode = FocusNode();
  FocusNode _numberfocusNode = FocusNode();

  void _onButtonPress(){
    setState(() {

    });
  }

  void _showAlertDialog(BuildContext context,int index){
    showDialog(
        context: context,
        builder:(context){
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure for delete?'),
            actions: [
              IconButton(
                  onPressed: (){
                    _namelist.removeAt(index);
                    _numberlist.removeAt(index);
                    _onButtonPress();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete_outline,color: Colors.red,),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined,color: Colors.blue,)
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(83, 138, 241, 1.0),
        title: Text(widget.title),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            _namefocusNode.unfocus();
            _numberfocusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color:Colors.white,
                  child: Column(
                    children: [
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            children: [
                              TextFormField(
                                autofocus: false,
                                focusNode: _namefocusNode,
                                controller: _namecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue)),
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Name can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                  autofocus: false,
                                  focusNode: _numberfocusNode,
                                  controller: _numbercontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue)),
                                    hintText: 'Number',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Number can't be empty";
                                    }
                                    return null;
                                  })
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _namelist.add(_namecontroller.text);
                              _numberlist.add(_numbercontroller.text);
                              _namecontroller.clear();
                              _numbercontroller.clear();
                              _onButtonPress();
                              _namefocusNode.unfocus();
                              _numberfocusNode.unfocus();
            
                            }
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(83, 138, 241, 1.0),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              fixedSize: Size(sw, 30)),
                        ),
                      ),
                    ],
                  ),
                ),
            
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: sh*0.65,
                    child: ListView.builder(
                        itemCount: _namelist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onLongPress: (){
                              _showAlertDialog(context,index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ListTile(
                                leading: Icon(Icons.perm_identity_outlined,color: Color.fromRGBO(
                                    117, 9, 9, 1.0),),
                                trailing: Icon(Icons.call,color:Colors.blue,),
                                title: Text(_namelist[index],style: TextStyle(color: Colors.red),),
                                subtitle: Text(_numberlist[index]),
                                tileColor: Colors.black12,
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
