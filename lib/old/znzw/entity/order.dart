class Order{
  String order_id;
  num creater_id;
  String describe;

  Order(this.order_id, this.creater_id, this.describe);

  Order.fromJosn(json){
    this.order_id = json["order_id"];
    this.creater_id = json["creater_id"];
    this.describe = json["describe"];
  }


}