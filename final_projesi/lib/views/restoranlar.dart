import 'package:final_projesi/views/yemek_sayfas%C4%B1.dart';
import 'package:flutter/material.dart';

class Restoranlar extends StatefulWidget {
  const Restoranlar({Key? key}) : super(key: key);

  @override
  State<Restoranlar> createState() => _RestoranlarState();
}

class _RestoranlarState extends State<Restoranlar> {
  int _selectedIndex = 0;
  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void _onItemTapped(int index ) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: implement setState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.line_weight))
        ],
        title: Text("NomNom", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Bangers', fontSize: 30, color: Colors.red),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/original.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.deepOrangeAccent.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                child: Card(
                  color: Colors.amber.withOpacity(0.8),
                  elevation: 50,
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(50),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const YemekSayfasi()));

                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("NomNom Restoran", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                child: Card(
                  color: Colors.amber.withOpacity(0.8),
                  elevation: 50,
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(50),
                    onTap: (){
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("X Restoran", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                child: Card(
                  color: Colors.amber.withOpacity(0.8),
                  elevation: 50,
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(50),
                    onTap: (){
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Y Restoran", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                child: Card(
                  color: Colors.amber.withOpacity(0.8),
                  elevation: 50,
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(50),
                    onTap: (){
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Z Restoran", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label:"Profilim"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Sepetim"),
        ],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

