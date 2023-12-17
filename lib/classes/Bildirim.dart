class Bildirim {
  Bildirim(this.price, this.BookName, this.uniName,this.userName);

  final String BookName;
  final String price;
  final String uniName;
  final String userName;
  String getprice() {
    return price;
  }

  String getBookName() {
    return BookName;
  }
  String getUniName() {
    return uniName;
  }
  String getUserName() {
    return userName;
  }
}