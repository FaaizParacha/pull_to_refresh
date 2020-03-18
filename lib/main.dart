import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));
    class HomePage extends StatefulWidget {
      @override
      _HomePageState createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
      var list;
      var random;
      @override
  void initState() {
        random = Random();
        list = List.generate(random.nextInt(10), (i)=> "item $i" );
    super.initState();
  }
  Future<Null> refreshList() async
      {
        await Future.delayed(Duration(seconds: 1));
        setState(() {

          list = List.generate(random.nextInt(15), (i)=> "item $i" );
        });
        return null;
      }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Pull To Refresh"),
          ),
          body: RefreshIndicator(
              child: ListView.builder(
                itemCount: list?.length,
                  itemBuilder: (context,i) => ListTile(
                    title: Text(list[i]),
                  )
              ),
              onRefresh: refreshList
          ),
        );
      }
    }
