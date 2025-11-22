import 'package:flutter/widgets.dart';
import 'package:per7/models/produk.dart';

class keranjang extends ChangeNotifier{
  final List<produk> _Produk = [];

  List<produk> get Produk => _Produk;
  int get hitungProduk => _Produk.length;

  void add(produk p){
    _Produk.add(p);
    notifyListeners();
  } 
  void hapusProduk(int index) {
  Produk.removeAt(index);
  notifyListeners();
}


}