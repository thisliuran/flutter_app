import 'package:flutter/material.dart';
import 'package:flutter_app/bottombar/search.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IndexState();
}
class IndexState extends State<Index>{
  int _index = 0;
  List<Bottom> _blist;
  List<BottomNavigationBarItem> _items ;

  @override
  void initState() {
    super.initState();
    _blist = <Bottom>[
    (new Bottom(Icon(Icons.search),"查询",new Search())),
   (new Bottom(Icon(Icons.add),"新增",new Search())),
    (new Bottom(Icon(Icons.keyboard_return),"领用",new Search())),
    (new Bottom(Icon(Icons.file_download),"入库",new Search())),
    (new Bottom(Icon(Icons.history),"入库",new Search()))];
    _items = _blist.map((b)=>new BottomNavigationBarItem(icon: b.icon,title: new Text(b.name))).toList();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

print(_items.toString());




    return new Scaffold(
      appBar: new AppBar(title:new Text(_blist[_index].name) ,),
      body:_blist[_index].page,
      bottomNavigationBar: BottomNavigationBar(
          items:_items,
        type: BottomNavigationBarType.fixed,
        //     [new BottomNavigationBarItem(icon:Icon(Icons.map),title: Text("haha")),new BottomNavigationBarItem(icon:Icon(Icons.map),title: Text("haha"))],
      //   _bottomMap.values.map(( bottom)=>new BottomNavigationBarItem(icon: bottom.icon,title:new Text(bottom.name))),
       onTap: (int){
           setState(() {
            _index = int;
          });
      },

      )

    );
  }
}

class Bottom {

  Icon icon;
  String name;
  StatefulWidget page;

  Bottom(this.icon, this.name, this.page);


}