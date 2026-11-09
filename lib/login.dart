import 'package:flutter/material.dart';
import 'package:flutter_delivery1/home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              padding: EdgeInsets.symmetric(vertical: 50),

              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    
                  ClipRRect(
                   borderRadius: BorderRadius.circular(12),

                   child: Image.asset(
                    "imagens/login_app.png",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      ),
                      ),

                      SizedBox(height: 20),

                    Text(
                      "Bem vindo",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Acesse sua conta para continuar",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    SizedBox(height: 50),

                    SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Login",
                          prefixIcon: Icon(Icons.person), //=== ícone à esquerda
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    SizedBox(
                      width: 400,
                      child: TextField(
                        obscureText: true, //====== sigilo na digitação
                        decoration: InputDecoration(
                          labelText: "Senha",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Esqueci minha senha"),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: Text("Entrar", 
                        style: TextStyle(fontSize: 18)
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider()
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(" ou "),
                          ),

                          Expanded(
                            child: Divider()
                            ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 200,
                      height: 30,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.g_mobiledata, size: 20
                          ),
                        label: Text(
                          "Continuar com o Google",
                          style: TextStyle(fontSize: 10),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: 230,
                      child: Row(
                        children: [
                          Text("Não tem uma conta?"),
                          TextButton(
                            onPressed: () {},
                            child: Text("Criar agora"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
