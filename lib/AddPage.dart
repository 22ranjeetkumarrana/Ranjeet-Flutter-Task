
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget
{
  @override
  _AddPageState createState() => _AddPageState();
}

enum SingingCharacter { _online, _cash,_GPay }
enum ABC{_p,_s}

class _AddPageState extends State<AddPage>
{
  SingingCharacter _character = SingingCharacter._online;
  ABC _abc = ABC._p;

  File _image;

  Future getImagefromGallery() async {
    ImagePicker picker = ImagePicker();
    PickedFile image = await picker.getImage(source: ImageSource.gallery);
    setState(()
    {
      _image =File(image.path);
    });
  }

  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context)
  {
    var screenSize = MediaQuery.of(context).size;
    var _date;
    TextEditingController phone = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Add',
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(screenSize.width*0.03),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: screenSize.width*0.35,
                            height: screenSize.width* 0.45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black87,
                                    width: 3.0
                                )
                            ),
                            child: Center(
                              child: _image != null ? Container(
                                width: screenSize.width,
                                child: Image.file(_image,
                                fit: BoxFit.cover,),
                              )
                                  :Text(
                                'Import Image',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15.0
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.all(screenSize.height*0.02),
                          child: GestureDetector(
                            onTap: (){
                              getImagefromGallery();
                            },
                            child: Container(
                              width: screenSize.width*0.3,
                              height: screenSize.height*0.06,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  'Click Here to import image',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Name: ',
                        labelStyle: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.0
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff333333)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xff333333),
                                width: 1.5
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color(0xff333333)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      autocorrect: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number: ',
                        labelStyle: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff333333)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xff333333),
                                width: 1.5
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color(0xff333333)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Type',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black
                            ),
                          ),
                          RadioListTile<ABC>(
                            title: const Text('Product'),
                            value:ABC._p,
                            groupValue: _abc,
                            onChanged: (ABC value) { setState(() { _abc = value; }); },
                          ),
                          RadioListTile<ABC>(
                            title: const Text('Service'),
                            value: ABC._s,
                            groupValue: _abc,
                            onChanged: (ABC value) { setState(() { _abc = value; }); },
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Amount: ',
                        labelStyle: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16.0
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff333333)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xff333333),
                                width: 1.5
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color(0xff333333)
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount Type',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black
                            ),
                          ),
                          RadioListTile<SingingCharacter>(
                            title: const Text('Cash'),
                            value: SingingCharacter._online,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
                          ),
                          RadioListTile<SingingCharacter>(
                            title: const Text('Online'),
                            value: SingingCharacter._cash,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
                          ),
                          RadioListTile<SingingCharacter>(
                            title: const Text('GPay'),
                            value: SingingCharacter._GPay,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          FlatButton(
                              onPressed: (){
                                _selectDate(context);
                              },
                              child: Text(
                                'Select Date',
                                style: TextStyle(color: Colors.blue,fontSize: 16.0),
                              )
                          ),
                          Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),
                              )
                        ],
                      ),
                ),
                    GestureDetector(
                      child: Container(
                        height: screenSize.height * 0.1,
                        width: screenSize.width,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                            ),
                          ),
                        ),
                      ),
                    )
                ]
              )
          ),
        )
      ),)
    );
  }
}
