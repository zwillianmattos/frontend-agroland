import 'dart:convert';

import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Inside',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Inside Bible'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

  
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   loadData() async {
//     String data =
//         await DefaultAssetBundle.of(context).loadString("nvi.json");
        
//     final List<dynamic> jsonResult = json.decode(data);

//     List<LivroModel> livros = [];

//     jsonResult.forEach((element) {
//       livros.add(new LivroModel.fromJson(element));
//     });

//     return livros;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: FutureBuilder(
//         future: loadData(),
//         builder: (ctx, res) {
//           if (res.hasData) {
//             List<LivroModel> list = res.data;

//             return ListView.builder(
//                 itemCount: list.length,
//                 itemBuilder: (ctx, i) {
//                   return ListTile(
//                     title: Text(list[i].name),
//                     subtitle: Text(list[i].abbrev),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SecondRoute(
//                                   livro: list[i],
//                                 )),
//                       );
//                     },
//                   );
//                 });
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   LivroModel livro;

//   SecondRoute({this.livro});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${livro.name}"),
//       ),
//       body: ListView.builder(
//           itemCount: livro.chapters.length,
//           itemBuilder: (ctx, i) {
//             return ListTile(
//               title: Text((i + 1).toString()),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ThirdRoute(
//                             livro: livro.name,
//                             capitulo: (i + 1).toString(),
//                             versiculos: livro.chapters[i],
//                           )),
//                 );
//               },
//             );
//           }),
//     );
//   }
// }

// class ThirdRoute extends StatelessWidget {
//   String livro;
//   String capitulo;
//   List versiculos;

//   ThirdRoute({this.livro, this.capitulo, this.versiculos});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$livro - $capitulo"),
//       ),
//       body: ListView.builder(
//           itemCount: versiculos.length,
//           itemBuilder: (ctx, i) {
//             return ListTile(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${(i + 1).toString()} - ",
//                     style: TextStyle(
//                       fontSize: 10,
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text("${versiculos[i]}", textAlign: TextAlign.justify,),
//                     ),
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             );
//           }),
//     );
//   }
// }
