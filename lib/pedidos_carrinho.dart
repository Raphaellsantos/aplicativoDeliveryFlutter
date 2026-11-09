import 'package:flutter/material.dart';
import 'package:flutter_delivery1/buscar.dart';
import 'package:flutter_delivery1/home.dart';
import 'package:flutter_delivery1/login.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  //=================== VARIAVEIS =============================== 

  Widget _cardPedido(
    String pedido,
    String restaurante,
    String itens,
    String status,
    String info,
    String preco,
    String botao,
    String imagem,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // ==== Linha de cima: número do pedido à esquerda, status à direita
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pedido, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6),
                ),

                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          Text(
            restaurante,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Divider(height: 24),

          //==== Imagem à esquerda, produtos à direita
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagem,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 12),

              Expanded(child: 
              Text(
                itens, 
                style: TextStyle (fontSize: 12)
                )
                ),
            ],
          ),

          Divider(height: 24),

          //==== Previsão à esquerda, preço à direita
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                info, 
                style: TextStyle(fontSize: 12, color: Colors.grey)
                ),

              Text(
                preco,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 12),

          // ==== Botão ocupando a largura toda do card
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(onPressed: () {}, child: Text(botao)),
          ),
        ],
      ),
    );
  }


  //==================== FIM VARIAVEIS ===============================

  @override
  Widget build(BuildContext context) {
    //defaultTAbController intercala as abas
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------- CABEÇALHO ----------
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACOMPANHAMENTO",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Meus pedidos",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1),

              // ---------- BOTÕES DAS ABAS ----------
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Em andamento"),
                    Tab(text: "Anteriores"),
                  ],
                ),
              ),

              // ========== CONTEÚDO DE CADA ABA =========
              Expanded(
                child: TabBarView(
                  children: [

                    // =========== ABA 1: EM ANDAMENTO =========
                    ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _cardPedido(
                          "Pedido #0001",
                          "Pizzaria Bella",
                          "1x Pizza de Frango\n1x Refrigerante",
                          "Em preparo",
                          "Previsão: 19:30",
                          "R\$ 55,90",
                          "Acompanhar pedido",
                          "imagens/propPizza.png",
                        ),
                        _cardPedido(
                          "Pedido #0002",
                          "Burger House",
                          "1x X-Burger\n1x Batata frita",
                          "Em preparo",
                          "Previsão: 19:45",
                          "R\$ 32,00",
                          "Acompanhar pedido",
                          "imagens/propBurger.png",
                        ),
                        _cardPedido(
                          "Pedido #0003",
                          "Doce Sabor",
                          "1x Caixa de Brigadeiro\n1x Café",
                          "Em preparo",
                          "Previsão: 20:00",
                          "R\$ 24,00",
                          "Acompanhar pedido",
                          "imagens/propBrigadeiro.png",
                        ),
                      ],
                    ),

                    // =============== ABA 2: ANTERIORES ==========
                    ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _cardPedido(
                          "Pedido #0004",
                          "Pizzaria Bella",
                          "1x Pizza Calabresa\n1x Refrigerante",
                          "Entregue",
                          "Entregue em 02/11",
                          "R\$ 52,00",
                          "Pedir novamente",
                          "imagens/propPizza.png",
                        ),
                        _cardPedido(
                          "Pedido #0005",
                          "Burger House",
                          "1x X-Salada\n1x Milkshake",
                          "Entregue",
                          "Entregue em 28/10",
                          "R\$ 38,50",
                          "Pedir novamente",
                          "imagens/propBurger.png",
                        ),
                        _cardPedido(
                          "Pedido #0006",
                          "Prato Feito do Zé",
                          "1x Prato feito\n1x Suco",
                          "Cancelado",
                          "Entregue em 20/10",
                          "R\$ 27,00",
                          "Pedir novamente",
                          "imagens/propMarmitex.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ========================================== BARRA DE NAVEGAÇÃO
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
            if (indice == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Buscar()),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
        ),
      ),
    );
  }
}
