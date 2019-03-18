import 'package:flutter/material.dart';
import 'package:flutter_app/old/znzw/index2.dart';
import 'package:flutter_app/old/znzw/main3.dart';
import 'package:flutter_app/old/znzw/second.dart';

class Layout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return LayoutState();
  }




}

class LayoutState extends State<Layout>{

  FloatingActionButton _floatButton = null;

   Select select = selects[0];

  _select(Select select){
    setState(() {
      this.select = select;
    });

  }


  @override
  Widget build(BuildContext context) {
    print("menuItems:"+menuItems.length.toString());
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(select.title),
        leading: select.icon,
          actions:<Widget>[


            PopupMenuButton<MenuItem>(
        icon: Icon(Icons.menu)
        ,
                itemBuilder: (BuildContext context){
                  print(menuItems.length);
              return menuItems.map<PopupMenuItem<MenuItem>>((MenuItem m){
                return PopupMenuItem<MenuItem>(
                  value: m,
                  child: Text(m.title),

                );
              }).toList();
            },
            onSelected: (c){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>c.route));
            },
            )
          ]
      ),
      body: select.inside,
      bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
        currentIndex: selects.indexOf(select),
        items: selects.map((s){
        return BottomNavigationBarItem(
          icon: s.icon,
          title: Text(s.title),


        );
      }).toList(),
        onTap: (index){
        _select(selects[index]);
        },
      ),
      floatingActionButton: select.floatButton,
    );
  }
}

class Select {
  final Widget inside;
  final String title;
  final Icon icon;
  FloatingActionButton floatButton;
  Select({this.inside, this.title,this.icon,floatButton = null});

}

 List<Select> selects = <Select>[
   new Select(inside: Index(),title: "首页",icon: Icon(Icons.home)),
  // new Select(inside: Index(),title: "新增",icon: Icon(Icons.add_box)),

   new Select(inside: Car(),title: "历史",icon: Icon(Icons.history)),
//   new Select(inside: Index(),title: "公交车",icon: Icon(Icons.directions_bus)),
//
//   new Select(inside: Index(),title: "火车",icon: Icon(Icons.directions_railway)),
//   new Select(inside: Index(),title: "飞机",icon: Icon(Icons.local_airport)),
//
//   new Select(inside: Index(),title: "自行车",icon: Icon(Icons.directions_bike)),


 ];



class MenuItem {
  final Widget route;
  final String title;
  final Icon icon;
  MenuItem({this.route, this.title,this.icon});

}

List<MenuItem> menuItems = <MenuItem>[
  new MenuItem(route: MyHomePage(title:"我的信息"),title: "我的信息",icon: Icon(Icons.person)),
  new MenuItem(route: MyHomePage(title:"修改密码"),title: "修改密码",icon: Icon(Icons.track_changes)),



];