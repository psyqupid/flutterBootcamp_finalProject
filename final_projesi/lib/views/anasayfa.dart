
import 'package:final_projesi/views/restoranlar.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 175,
                  width: 175,
                  child: Card(
                    color: Colors.amber,
                    elevation: 50,
                    child: InkWell(
                      splashColor: Colors.red.withAlpha(50),
                      onTap: (){},
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage('images/shopping.png'), width: 100,height: 100,),
                          Text("Marketten Gelsin\n   (Çok yakında!)", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 175,
                    width: 175,
                  child: Card(
                    elevation: 50,
                    color: Colors.amber,
                    child: InkWell(
                      splashColor: Colors.red.withAlpha(50),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Restoranlar()),
                        );
                      },
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage('images/food.png'), width: 100, height: 100,),
                          Text("Restorandan Gelsin", style: TextStyle(fontFamily: 'Reem Kufi Fun', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Anasayfa"),
            BottomNavigationBarItem(icon: Icon(Icons.fastfood_outlined), label:"Restoranlar"),
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
