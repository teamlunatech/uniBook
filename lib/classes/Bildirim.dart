class Bildirim {
  Bildirim(this.price, this.BookName, this.uniName, this.userName, this.userUid,
      this.imageUrl);

  final String BookName;
  final String price;
  final String uniName;
  final String userName;
  final String userUid;
  final String imageUrl;
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

  String getUserUid() {
    return userUid;
  }

  String getImageUrl() {
    return imageUrl;
  }
}
