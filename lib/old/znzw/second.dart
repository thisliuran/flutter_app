import 'package:flutter/material.dart';

class Car extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarState();
  }

}
class CarState extends State<Car>{
  List<String> l;


  @override
  Widget build(BuildContext context) {

    l = List.generate(10, (i)=>"h$i");


    // TODO: implement build
    return ListView.builder(
        itemCount: l.length,
        itemBuilder: (context,i){
          return Card(
            child:Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.directions_car),
                  onPressed: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context)=>new Scaffold(
                        appBar: AppBar(
                          title: Text("Car"),
                        ),
                        body: Center(
                          child: Text(l[i]),
                        ),
                      ))
                    );
                  },
                    ),
                Text("自行车"),

              ],
            ),
          );
        });;

  }



}

