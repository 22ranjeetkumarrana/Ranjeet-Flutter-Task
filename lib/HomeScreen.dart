
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:help_now_flutter_project/AddPage.dart';
import 'package:help_now_flutter_project/ImportExportPage.dart';
import 'package:help_now_flutter_project/model/DummyDataModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
          itemBuilder: (context,index){
          //if(dummyData!=null) print(dummyData[index].phone);
          return dummyData!=null ? GestureDetector(
              onTap: ()
              {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
              },
              child: Card(
                child: Container(
                    height: screenSize.height * 0.15,
                    width: screenSize.width,
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(screenSize.height * 0.05),
                              child:  Container(
                                width: screenSize.width*0.17,
                                height: screenSize.width* 0.17,
                                child: Image.network(
                                  //'https://hdqwalls.com/wallpapers/best-nature-image.jpg',
                                  dummyData[index].avatarUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              width: screenSize.width * 0.77,
                              padding: EdgeInsets.only(left: screenSize.width * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        //width: screenSize.width * 0.35,
                                        child: Text(
                                          '${dummyData[index].name}',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          //overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      Container(
                                        //width: screenSize.width * 0.37,
                                        child: Text(
                                          ' - ${dummyData[index].phone}',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      dummyData[index].date,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.all(screenSize.height*0.02),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Amount: ${dummyData[index].ammount}',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              )
          ):Center(
            child: Text(
              "Loading....",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          );
          }),
      floatingActionButton: buildSpeedDial(),
    );
  }

  SpeedDial buildSpeedDial(){
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(
          size: 24.0,
        color: Colors.white
      ),
      backgroundColor: Colors.green,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white,size: 22.0,),
          backgroundColor: Colors.green,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
          },
          label: 'Add',
          labelStyle:
          TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.green,
        ),

        SpeedDialChild(
          child: Icon(Icons.import_export, color: Colors.white,size: 22.0,),
          backgroundColor: Colors.green,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImportExportPage()));
          },
          label: 'Export',
          labelStyle:
          TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.green,
        ),
      ],
    );
  }
}
