import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/screen/admin/list_user.dart';
import 'package:project_kelas/screen/admin/list_panitia.dart';
import 'package:project_kelas/screen/admin/list_peserta.dart';
import 'package:project_kelas/screen/login.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 16.0),
          Text(
            'Welcome to Pentas Islami Teknokrat',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'Today\'s Date: ${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    SlideItem(
                        'https://cdn-2.tstatic.net/lampung/foto/bank/images/pentas-islami-ke-16-dengan-tema-semarakkan-semangat.jpg'),
                    SlideItem(
                        'https://kupastuntas.co/uploads/posts/universitas-teknokrat-gelar-pentas-islami-xvi-ting_20230610154241.jpg'),
                    SlideItem(
                        'https://ululalbab.sch.id/wp-content/uploads/2019/04/pENTAS-ISLAMI-XII-TEKNOKRAT-ULUL-ALBAB-5.jpg'),
                    SlideItem(
                        'https://ululalbab.sch.id/wp-content/uploads/2019/04/pENTAS-ISLAMI-XII-TEKNOKRAT-ULUL-ALBAB-8.jpg'),
                  ],
                  options: CarouselOptions(
                    height: 160.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 118, 198),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton('User', Icons.person, 0),
                    IconButton('Peserta', Icons.people, 1),
                    IconButton('Panitia', Icons.people_alt_outlined, 2),
                    IconButton('lomba', Icons.event_note, 0),
                    IconButton('logout', Icons.logout_outlined, 99),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Acara Even Pentas Islami"),
                TextButton(
                  onPressed: () {},
                  child: Text("Lihat Semua"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 216,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan
                      ),
                    ],
                  ),
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias, // Atur properti clipBehavior
                  child: Image.network(
                    'https://iticm.ac.id/wp-content/uploads/2023/01/WhatsApp-Image-2023-01-12-at-16.57.31.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan
                      ),
                    ],
                  ),
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias, // Atur properti clipBehavior
                  child: Image.network(
                    'https://teknofest.teknokrat.ac.id/wp-content/uploads/2023/02/STD_7615-min-scaled.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Mengatur posisi bayangan
                      ),
                    ],
                  ),
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias, // Atur properti clipBehavior
                  child: Image.network(
                    'https://teknofest.teknokrat.ac.id/wp-content/uploads/2023/02/STD_7581-min-scaled.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final String img;

  SlideItem(this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Image(
          image: NetworkImage(
            img,
          ),
          fit: BoxFit.cover),
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Daftar User', 'view': ListUser()},
    {'title': 'Daftar Peserta', 'view': ListPeserta()},
    {'title': 'Daftar Panitia', 'view': ListPanitia()},
    // {'title': 'Daftar Panitia', 'view': ListPanitia()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  if (index == 99) {
                    EventPref.clear();
                    Get.off(Login());
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _fragment[index]['view']),
                    );
                  }
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
