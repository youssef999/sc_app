

class ProductModel {
  String productId, name, image, des, sized,brand,brand_email,x,link,city,map2;
  int price;
  num quant,star;

  String color;

  ProductModel(
      {this.productId,
        this.name,
        this.image,
        this.des,
        this.color,
        this.star,
        this.sized,
        this.brand,
        this.city,
        this.map2,
        this.x,
        this.link,
        this.brand_email,
        this.price,
        this.quant});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    map2=map['map'];
    image = map['image'];
    des = map['des'];
    star=map['star'];
    color = map['color'];
    city=map['city'];
    sized = map['sized'];
    link=map['link'];
    x=map["x"];




    quant = map['quant'];
    brand = map['brand'];
    price=map['price'];
    brand_email=map['brandemail'];
    productId = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'des': des,
      'map': map2,
      'color': color,
      'sized': sized,
      'star':star,
      'city':city,
      'price': price,
      'link':link,
      'productid': productId,
      'brand':brand,
      'x':x,
      'brandemail':brand_email
    };
  }
}
