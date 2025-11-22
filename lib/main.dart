import 'package:flutter/material.dart';
import 'package:per7/models/keranjang.dart';
import 'package:per7/models/produk.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => keranjang(),
      child: MaterialApp(
        title: 'Provider',
        debugShowCheckedModeBanner: false,
        home: ProdukScreen(),
      ),
    ),
  );
}

class ProdukScreen extends StatelessWidget {
  const ProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<produk> apples = [
      produk('LCD'),
      produk('Konektor'),
      produk('Glass Hp'),
      produk('Flexibel On Off'),
      produk('Battre'),
      produk('Papan Cas'),
      produk('Tombol Luar'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Sparepart Hp iPhone'),
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Consumer<keranjang>(
              builder: (context, value, child) => Badge(
                label: Text('${value.hitungProduk}'),
                isLabelVisible: value.hitungProduk > 0,
                child: IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KeranjangScreen()),
                  ),
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: apples.length,
        itemBuilder: (context, index) {
          final apple = apples[index];
          return ListTile(
            title: Text(apple.namaProduk),
            trailing: IconButton(
              onPressed: () =>
                  Provider.of<keranjang>(context, listen: false).add(apple),
              icon: Icon(Icons.add_circle_outline_rounded),
            ),
          );
        },
      ),
    );
  }
}

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<keranjang>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.Produk.length,
          itemBuilder: (context, index) => ListTile(
  title: Text(value.Produk[index].namaProduk),
  trailing: IconButton(
    icon: Icon(Icons.delete, color: Colors.red),
    onPressed: () {
      value.hapusProduk(index);   // <-- fungsi hapus di provider
    },
  ),
),

        ),
      ),
    );
  }
}
