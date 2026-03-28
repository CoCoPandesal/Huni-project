import 'package:flutter/material.dart';
import 'login_page.dart';
import 'bottom_curve_clipper.dart';
import 'services/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1595422656857-ced3a4a0ce25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Register",
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
                          hintText: "Create Username",
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
                      const SizedBox(height: 15),
                      TextField(
                        controller: confirmPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Re-password",
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
                          if (password.text != confirmPassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Passwords do not match"),
                              ),
                            );
                            return;
                          }

                          try {
                            var result = await ApiService.register(
                              username.text,
                              password.text,
                            );

                            if (result["success"] == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Registration successful! Please log in.",
                                  ),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: ${result["error"]}"),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Network error: $e")),
                            );
                          }
                        },
                        child: const Text("Register"),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Have an account? ",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Login",
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
          ),
        ],
      ),
    );
  }
}
