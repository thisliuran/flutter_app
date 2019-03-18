import 'package:flutter/material.dart';
import 'package:flutter_app/com/zzdx/znzw/view/home.dart';


class Layout extends StatefulWidget {
   String route;

   Layout({Key key, this.route}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    if(route == null) route="index";
    // TODO: implement createState

    return LayoutState(route);
  }




}

class LayoutState extends State<Layout>{




  String route;
    LayoutState(this.route);


  FloatingActionButton _floatButton = null;

   Select select = selects[0];



  _select(Select select){
    setState(() {
      this.select = select;
    });

  }
       @override
       void initState() {
         setState(() {
           this.select = selectPage.map[route];
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

class Select extends Object {
  final Widget inside;
  final String title;
  final Icon icon;
  FloatingActionButton floatButton;
  Select({this.inside, this.title,this.icon,floatButton = null});

}

 List<Select> selects = <Select>[
   new Select(inside: HomePage(),title: "首页",icon: Icon(Icons.home)),
   new Select(inside: HomePage(),title: "新增",icon: Icon(Icons.add_box)),
   new Select(inside: HomePage(),title: "历史",icon: Icon(Icons.history)),



 ];



class MenuItem {
  final Widget route;
  final String title;
  final Icon icon;
  MenuItem({this.route, this.title,this.icon});

}

List<MenuItem> menuItems = <MenuItem>[
  new MenuItem(route: HomePage(),title: "我的信息",icon: Icon(Icons.person)),
  new MenuItem(route: HomePage(),title: "修改密码",icon: Icon(Icons.track_changes)),



];
class SelectPage{
  Map<String,Select> map = {};

  SelectPage(){
    this.map["index"] =  new Select(inside: HomePage(),title: "首页",icon: Icon(Icons.home));
    this.map["add"] =  new Select(inside: HomePage(),title: "新增",icon: Icon(Icons.add_box));
    this.map["history"] = new Select(inside: HomePage(),title: "历史",icon: Icon(Icons.history));
  }


}

SelectPage selectPage = new SelectPage();