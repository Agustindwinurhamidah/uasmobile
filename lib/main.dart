
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:uasmobile/login_page.dart';
import 'package:uasmobile/providers/kategori_provider.dart';
import 'package:uasmobile/providers/stok_provider.dart';
import 'services/firestore_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StokProvider()),
        StreamProvider(
          create: (context) => firestoreService.getStoks(),
          // initialData: initialData,
        ),
        ChangeNotifierProvider(create: (context) => KategoriProvider()),
        StreamProvider(
          create: (context) => firestoreService.getKategoris(),
          //  initialData: initialData,
        ),
        // ChangeNotifierProvider(create: (context) => ProductProvider()),
        // StreamProvider(
        //   create: (context) => firestoreService.getProducts(),
        //   //  initialData: initialData,
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Page',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LoginPage(),
      ),
    );
  }
}