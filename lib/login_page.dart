import 'package:flutter/material.dart';
import 'main_navigation_page.dart';
import 'bottom_curve_clipper.dart';
import 'services/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1571310100246-e0676f359b42?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0",
            fit: BoxFit.cover,
          ),
          Container(color: const Color.fromARGB(100, 0, 0, 0)),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF00E5FF),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Singing brings joy to the heart",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: username,
                      decoration: const InputDecoration(
                        hintText: "Username",
                        filled: true,
                        fillColor: Colors.white12,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white12,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00E5FF),
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      onPressed: () async {
                        var result = await ApiService.login(
                          username.text,
                          password.text,
                        );

                        if (result["success"] == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login successful!")),
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainNavigationPage(),
                            ),
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login failed: ${result["error"]}"),
                            ),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Doesn't have an account yet? ",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xFF00E5FF),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
