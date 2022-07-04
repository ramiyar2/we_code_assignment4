import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 159,
                  height: 159,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('http://placeimg.com/159/159/any'),
                    ),
                    borderRadius: BorderRadius.circular(79),
                    border: Border.all(
                        color: const Color.fromRGBO(189, 255, 215, 0.49),
                        width: 8),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(data[0]['firstName'].toString()),
              const SizedBox(
                height: 10,
              ),
              Text(
                data[0]['para'].toString(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(index);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 10,
                        ),
                    itemCount: links.length),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomRowItem(color[0], icons[0]),
                  BottomRowItem(color[1], icons[1]),
                  BottomRowItem(color[2], icons[2]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container BottomRowItem(Color color, IconData icons) {
    return Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 21,
                spreadRadius: -17,
                offset: Offset(0, 20)),
          ],
          color: color,
        ),
        child: IconButton(onPressed: () {}, icon: FaIcon(icons)));
  }

  Container ListItem(int index) {
    return Container(
      width: 299,
      height: 54,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 21,
              spreadRadius: -17,
              offset: Offset(0, 20)),
        ],
        borderRadius: BorderRadius.circular(6),
        color: links[index]['color'],
      ),
      child: ListTile(
        leading: links[index]['icon'],
        title: Text(
          links[index]['name'],
        ),
        onTap: () {
          launchUrlString(links[index]['link']);
        },
      ),
    );
  }
}
