// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:atividade/coffee.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //===================== ANIMATION ==============================
  late AnimationController _animationController;
  late Animation<Alignment> _animationAlign;
  late Animation<Size> _sizeAnimation;
  final Duration _duration = const Duration(seconds: 2, milliseconds: 500);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _sizeAnimation = Tween(
      begin: const Size(0, 0),
      end: const Size(300, 300),
    ).animate(_animationController);

    //cafés
    listCoffee.add(cafeItem1);
    listCoffee.add(cafeItem2);
    //capuccinos
    listCapuccinos.add(capuccinoItem1);
    listCapuccinos.add(capuccinoItem2);

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });

    super.initState();
  }

  //===================== NOVOS CAFÉS ==============================
  Coffee cafe = Coffee(preco: 7.00, descricao: "Café simples");
  //===================================================================
  Coffee cafeItem1 = Coffee(
    preco: 7.00,
    descricao: "Café simples",
    imgUrl:
        "https://images.pexels.com/photos/6207309/pexels-photo-6207309.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  );
  //===================================================================
  Coffee cafeItem2 = Coffee(
      preco: 7.00,
      descricao: "Café simples",
      imgUrl:
          "https://images.pexels.com/photos/6207304/pexels-photo-6207304.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  //===================================================================
  Coffee capuccino = Coffee(preco: 14.00, descricao: "Capuccino simples");
  //===================================================================
  Coffee capuccinoItem1 = Coffee(
    preco: 14.00,
    descricao: "Capuccino simples",
    imgUrl:
        "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  );
  Coffee capuccinoItem2 = Coffee(
    preco: 14.00,
    descricao: "Capuccino simples",
    imgUrl:
        "https://images.pexels.com/photos/10320330/pexels-photo-10320330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  );

  //===================== LISTA DE CAFÉS ==============================
  List<Coffee> listCoffee = [];
  List<Coffee> listCapuccinos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===================== APP BAR ==============================
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        title: Center(
            child: Column(
          children: const [
            Text(
              "Coffee Center",
              style: TextStyle(
                  fontFamily: "Boldoni",
                  fontSize: 30,
                  color: Color.fromARGB(255, 141, 101, 63)),
            ),
            Text(
              "Since 1985",
              style: TextStyle(
                  fontFamily: "Boldoni",
                  fontSize: 20,
                  color: Color.fromARGB(255, 141, 101, 63)),
            ),
          ],
        )),
      ),
      //===================== BODY ==============================
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //LINHA MARROM
                Container(
                  color: const Color.fromARGB(255, 155, 132, 130),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                ),
                //IMAGEM DE UM CAFÉ
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/129207/pexels-photo-129207.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  color: const Color.fromARGB(255, 155, 132, 130),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: const Text(
                    " Bem-vindo(a) à nossa cafeteria! Oferecemos uma variedade de deliciosos cafés, chás e outras bebidas quentes. Faça seu pedido e desfrute dos sabores incríveis em casa ou no trabalho. Obrigado por escolher a nossa cafeteria!",
                    style: TextStyle(
                        fontFamily: "Fragment",
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                ),
                //=========================== CATEGORIA: CAFE ===========================
                const CategoriaWidget(
                  nomeCategoria: "Cafés",
                ),

                //=========================== DESCRIÇAO: CAFÉ SIMPLES ===========================
                Descricao(
                  descricao: cafe.descricao,
                  preco: cafe.preco,
                ),

                //=========================== LISTVIEW =======================
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.4,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ListView.builder(
                    itemCount: listCoffee.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _animationController.forward();
                        },
                        child: Item(
                          imageItem: listCoffee[index].imgUrl,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                //=========================== CATEGORIA: CAPUCCINO ===========================
                const CategoriaWidget(
                  nomeCategoria: "Capuccinos",
                ),

                //=========================== DESCRIÇAO: CAPUCCINO ===========================
                Descricao(
                  descricao: capuccino.descricao,
                  preco: capuccino.preco,
                ),
                //=========================== LISTVIEW =======================
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.4,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ListView.builder(
                    itemCount: listCapuccinos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _animationController.forward();
                        },
                        child: Item(
                          imageItem: listCapuccinos[index].imgUrl,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: _sizeAnimation.value.width,
                  height: _sizeAnimation.value.height,
                  child: Lottie.network(
                      "https://assets6.lottiefiles.com/temp/lf20_q6KowU.json"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final imageItem;
  const Item({
    super.key,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.6,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage("$imageItem"), fit: BoxFit.cover)),
        ),
        const SizedBox(width: 15)
      ],
    );
  }
}

class Descricao extends StatelessWidget {
  final String descricao;
  final double preco;
  const Descricao({
    Key? key,
    required this.descricao,
    required this.preco,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 27,
      child: Text(
        "$descricao, á partir de: R\$: $preco",
        style: const TextStyle(
          fontFamily: "Fragment",
          fontSize: 13,
          color: Color.fromARGB(255, 155, 132, 130),
        ),
      ),
    );
  }
}

class CategoriaWidget extends StatelessWidget {
  final String nomeCategoria;
  const CategoriaWidget({
    Key? key,
    required this.nomeCategoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 10,
      child: Text(
        "$nomeCategoria:",
        style: const TextStyle(
          fontFamily: "ptSans",
          fontSize: 50,
          color: Color.fromARGB(255, 155, 132, 130),
        ),
      ),
    );
  }
}
