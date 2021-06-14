import 'package:flutter/material.dart';
import 'package:uasmobile/login_page.dart';
import 'package:uasmobile/screens/kategoris.dart';
import 'package:uasmobile/screens/profil.dart';
import 'package:uasmobile/screens/stoks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String _title = 'Drawer Example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agustin Hijab'),
        backgroundColor: Colors.red.shade900,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container (
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))
                ),
                
              ),
              
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile())),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Stok'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Stoks())),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Kategori'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Kategoris())),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Logout'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage())),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logo.png'),),
        ),
        child: Center(
          child: Text(
            'Hijab Agustin menyediakan Berbagai macam Hijab seperti Jilbab Segi Empat, Jilbab Pashmina, Jilbab Bergo, Jilbab Rajut dan lain lain .Kualitas Terbaik. Pusat Hijab Terbaik di Sulfat. Bahan Nyaman dan Lembut. Mudah Dibentuk :)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.red[900]
            ) ,
          ),
        ),
      )
    );
  }
}
