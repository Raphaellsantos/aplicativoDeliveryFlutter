import 'package:flutter/material.dart';
import 'package:flutter_delivery1/home.dart';
import 'package:flutter_delivery1/login.dart';
import 'package:flutter_delivery1/pedidos_carrinho.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {

  //===============   VARIAVEIS   ==================

  //filtro para pesquisa
  String filtroSelecionado = "TODOS";
  Widget _filtro(String texto) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(texto),
        selected: filtroSelecionado == texto,
        onSelected: (valor) {
          setState(() {
            filtroSelecionado = texto;
          });
        },
      ),
    );
  }

  //====  card produtos
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
          // imagem propaganda
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

          //==== Coluna com os textos e o botão
          
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

                //============= Preço de um lado, botão do outro

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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Explorar", style: TextStyle(fontSize: 15)),

                  SizedBox(height: 10),

                  Text(
                    "Buscar",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Produto, categoria ou restaurante",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Filtros",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),

                  //filtros
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _filtro("TODOS"),
                        _filtro("PROXIMOS"),
                        _filtro("ENTREGA RÁPIDA"),
                        _filtro("MELHOR AVALIAÇÃO"),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RESULTADOS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text("3 itens", style: TextStyle(fontSize: 15)),
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
                    "Açai do bem",
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

      // ======================================= BARRA DE NAVEGAÇÃO

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (indice) {
          if (indice == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
              }
          if (indice == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Pedidos()),
            );
              }
              if (indice == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
              }
            },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long),label: "Pedidos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
