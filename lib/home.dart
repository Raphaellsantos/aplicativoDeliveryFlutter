import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_delivery1/buscar.dart';
import 'package:flutter_delivery1/pedidos_carrinho.dart';
import 'package:flutter_delivery1/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //============VARIAVEIS========================

  //========== CARD PARA PRODUTOS  ==============

  Widget _cardProduto(
    String restaurante,
    String produto,
    String info,
    String preco,
    String imagem,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        children: [

          //================ IMAGEM PROPAGANDA
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagem,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12),

          // ======== COLUNA COM OS TEXTOS E BOTÕES 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurante,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),

                SizedBox(height: 4),

                Text(
                  produto,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 4),

                Text(info, style: TextStyle(fontSize: 12, color: Colors.grey)),

                SizedBox(height: 12),

                // ==============  PREÇO DE UM LADO E BOTÃO DO OUTRO 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      preco,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: Text("Adicionar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// =============== ICONES EM DESTAQUES  ======================

    Widget _item (String titulo, IconData icone) {
    return Column(
    children: [
      Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black45),
        ),
        child: Center(
          child: Icon(icone, size: 32, color: Colors.greenAccent)),
      ),
      SizedBox(height: 6),
      Text(titulo),
    ],
  );
}

//==================== FIM VARIAVEIS ==========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.08,
              child: Image.asset("imagens/fundoapp.jpg", width: 800),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Entrega em", style: TextStyle(fontSize: 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Av. Leovigildo Dias Vieira, 103",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 8),
                      Text("Alterar", style: TextStyle(fontSize: 14)),

                      OutlinedButton(onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Pedidos()),
                          );
                      }, child: Text("carrinho/histórico")),
                    ],
                  ),

                  SizedBox(height: 24),
                  Text("Olá, Raphael Santos"),
                  SizedBox(height: 24),
                  Text(
                    "O que você deseja pedir hoje ?",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 24),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: Icon(Icons.search),
                      prefix: Text("Buscar | "),
                    ),
                  ),

                  SizedBox(height: 24),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.cyanAccent],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.deepOrangeAccent),
                    ),

                    child: Column(
                      children: [

                        Text(
                          "DESTAQUES DO DIA",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.4)
                        .slideX(curve: Curves.easeInBack),

                        SizedBox(height: 20),
                        
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 300),
                          child: CarouselView.weighted(
                            flexWeights: [1, 7, 1],
                            infinite: true,

                            children: [
                              Image.asset(
                                "imagens/propPizza.png",
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "imagens/propAcai.png",
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "imagens/propBrigadeiro.png",
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "imagens/propBurger.png",
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "imagens/propMarmitex.png",
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),

                  //=================== CATEGORIAS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categorias",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlinedButton(onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Buscar()),
                          );
                      }, child: Text("Ver todas")),
                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _item("Pizzas", Icons.local_pizza),
                      _item("Lanches", Icons.lunch_dining),
                      _item("doces", Icons.cake),
                      _item("Bebidas", Icons.local_drink),
                      _item("Prato feito", Icons.local_restaurant_rounded),
                    ],
                  ),

                  //======================== PRODUTOS EM DESTAQUE
                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Produtos em destaque"),
                       Text("ver todos")
                      ],
                  ),

                  SizedBox(height: 20),

                  _cardProduto(
                    "Pizzaria Bella",
                    "Pizza de Frango",
                    "4,8 • 30-40 min",
                    "R\$ 49,90",
                    "imagens/fotoPizza.png",
                  ),
                  _cardProduto(
                    "Burger House",
                    "X-Burger",
                    "4,6 • 20-30 min",
                    "R\$ 22,00",
                    "imagens/fotoBurger.png",
                  ),
                  _cardProduto(
                    "Doce Sabor",
                    "Caixa de Brigadeiro",
                    "4,9 • 15-25 min",
                    "R\$ 18,00",
                    "imagens/fotoBrigadeiro.png",
                  ),
                  _cardProduto(
                    "Açai do Rapha",
                    "Sensação do momento",
                    "4,8 • 30-45 min",
                    "R\$ 27,99",
                    "imagens/fotoAcai.png",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ============================================= BARRA DE NAVEGAÇÃO
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (indice) {

        if (indice == 1) {
          Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => const Buscar()),
          );
           }
           if (indice == 2) {
             Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Pedidos()),
          );
          if (indice == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            }
            
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Pedidos",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          
        ],
      ),



    );
  }
}





