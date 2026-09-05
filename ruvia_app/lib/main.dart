import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'route_calculator.dart';
import 'address_formatter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const RuviaApp());
}

class RuviaApp extends StatelessWidget {
  const RuviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RUVIA',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF315C45)),
      ),
      home: const RuviaWelcome(),
    );
  }
}

class RuviaWelcome extends StatelessWidget {
  const RuviaWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'RUVIA',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    color: Color(0xFF315C45),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Viaja seguro, llega tranquilo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Color(0xFF6B5A47)),
                ),

                const SizedBox(height: 50),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.directions_car_rounded,
                        size: 70,
                        color: Color(0xFFC56A3D),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Muévete con confianza',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF315C45),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Conecta con conductores de tu comunidad.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B5A47),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserTypeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF315C45),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'COMENZAR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shield_rounded,
                      size: 20,
                      color: Color(0xFF315C45),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Tu seguridad es nuestra prioridad',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B5A47)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF315C45)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RUVIA',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 35),

            const Text(
              '¿Qué quieres hacer?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Elige una opción para continuar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF6B5A47)),
            ),

            const SizedBox(height: 50),

            // OPCIÓN PASAJERO
            SizedBox(
              height: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassengerAccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF315C45),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.person_pin_circle_rounded,
                      size: 55,
                      color: Color(0xFFC56A3D),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quiero viajar',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Solicitar un viaje',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B5A47),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            // OPCIÓN CONDUCTOR
            SizedBox(
              height: 120,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverAccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315C45),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.drive_eta_rounded,
                      size: 55,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Soy conductor',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ofrecer viajes',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield_rounded, size: 18, color: Color(0xFF315C45)),
                SizedBox(width: 7),
                Text(
                  'Viajes seguros para nuestra comunidad',
                  style: TextStyle(fontSize: 13, color: Color(0xFF6B5A47)),
                ),
              ],
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}


class DriverAccessScreen extends StatefulWidget {
  const DriverAccessScreen({super.key});

  @override
  State<DriverAccessScreen> createState() => _DriverAccessScreenState();
}

class _DriverAccessScreenState extends State<DriverAccessScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa tu correo y contraseña.'),
        ),
      );
      return;
    }

    try {
      final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final user = credential.user;

      if (user == null) {
        throw Exception('No se pudo obtener el usuario.');
      }

      final driverDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final data = driverDoc.data();

      if (!driverDoc.exists || data?['role'] != 'driver') {
        await FirebaseAuth.instance.signOut();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Esta cuenta no está registrada como conductor.',
            ),
          ),
        );
        return;
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DriverHomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'No se pudo iniciar sesión.';

      if (e.code == 'user-not-found') {
        message = 'No existe una cuenta con ese correo.';
      } else if (e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        message = 'Correo o contraseña incorrectos.';
      } else if (e.code == 'invalid-email') {
        message = 'El correo electrónico no es válido.';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ocurrió un error. Intenta nuevamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF315C45),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RUVIA',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),

              const Icon(
                Icons.drive_eta_rounded,
                size: 80,
                color: Color(0xFF315C45),
              ),

              const SizedBox(height: 20),

              const Text(
                'Acceso de conductor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF315C45),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Inicia sesión para ofrecer viajes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B5A47),
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315C45),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'CONTINUAR',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverRegisterScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Crear cuenta de conductor',
                  style: TextStyle(
                    color: Color(0xFFC56A3D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_rounded,
                    size: 18,
                    color: Color(0xFF315C45),
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Tu información está protegida',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B5A47),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}


class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool acceptedTerms = false;
  bool loading = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerDriver() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Completa todos los campos.'),
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La contraseña debe tener al menos 6 caracteres.'),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden.'),
        ),
      );
      return;
    }

    if (!acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes aceptar los términos y condiciones.'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        throw Exception('No se pudo crear el usuario.');
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'name': name,
        'phone': phone,
        'email': email,
        'role': 'driver',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DriverHomeScreen(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message = 'No se pudo crear la cuenta.';

      if (e.code == 'email-already-in-use') {
        message = 'Ya existe una cuenta con ese correo.';
      } else if (e.code == 'invalid-email') {
        message = 'El correo electrónico no es válido.';
      } else if (e.code == 'weak-password') {
        message = 'La contraseña es demasiado débil.';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ocurrió un error. Intenta nuevamente.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF315C45),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RUVIA',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),

              const Icon(
                Icons.person_add_alt_1_rounded,
                size: 70,
                color: Color(0xFF315C45),
              ),

              const SizedBox(height: 15),

              const Text(
                'Crear cuenta de conductor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF315C45),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Regístrate para comenzar a ofrecer viajes con RUVIA.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B5A47),
                ),
              ),

              const SizedBox(height: 28),

              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              CheckboxListTile(
                value: acceptedTerms,
                onChanged: loading
                    ? null
                    : (value) {
                        setState(() {
                          acceptedTerms = value ?? false;
                        });
                      },
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Acepto los términos y condiciones de RUVIA.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B5A47),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: loading ? null : _registerDriver,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315C45),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFF9AA99F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'CREAR CUENTA',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 25),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_rounded,
                    size: 18,
                    color: Color(0xFF315C45),
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Tu información está protegida',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B5A47),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerAccessScreen extends StatefulWidget {
  const PassengerAccessScreen({super.key});

  @override
  State<PassengerAccessScreen> createState() => _PassengerAccessScreenState();
}

class _PassengerAccessScreenState extends State<PassengerAccessScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa tu correo y contraseña.')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PassengerHomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'No se pudo iniciar sesión.';

      if (e.code == 'user-not-found') {
        message = 'No existe una cuenta con ese correo.';
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        message = 'Correo o contraseña incorrectos.';
      } else if (e.code == 'invalid-email') {
        message = 'El correo electrónico no es válido.';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF315C45)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RUVIA',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),

              const Icon(
                Icons.person_pin_circle_rounded,
                size: 80,
                color: Color(0xFFC56A3D),
              ),

              const SizedBox(height: 20),

              const Text(
                'Bienvenido a RUVIA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF315C45),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Inicia sesión para solicitar tu viaje.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B5A47),
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315C45),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'CONTINUAR',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreateAccountScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Crear una cuenta nueva',
                  style: TextStyle(
                    color: Color(0xFFC56A3D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_rounded,
                    size: 18,
                    color: Color(0xFF315C45),
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Tu información está protegida',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B5A47),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF315C45)),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Crear cuenta',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Crea tu cuenta RUVIA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Completa tus datos para comenzar a viajar.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Color(0xFF6B5A47)),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: const Icon(Icons.person_outline),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Número de teléfono',
                prefixIcon: const Icon(Icons.phone),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar contraseña',
                prefixIcon: const Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            CheckboxListTile(
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Acepto los términos y condiciones',
                style: TextStyle(fontSize: 14, color: Color(0xFF6B5A47)),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameController.text.trim().isEmpty ||
                      phoneController.text.trim().isEmpty ||
                      emailController.text.trim().isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor completa todos los campos.'),
                      ),
                    );
                    return;
                  }

                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Las contraseñas no coinciden.'),
                      ),
                    );
                    return;
                  }

                  if (!acceptTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Debes aceptar los términos y condiciones.',
                        ),
                      ),
                    );
                    return;
                  }
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        );

                    final user = credential.user;

                    if (user != null) {
                      await user.updateDisplayName(nameController.text.trim());

                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .set({
                            'uid': user.uid,
                            'name': nameController.text.trim(),
                            'phone': phoneController.text.trim(),
                            'email': emailController.text.trim(),
                            'role': 'passenger',
                            'createdAt': FieldValue.serverTimestamp(),
                          });
                    }

                    if (!context.mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PassengerHomeScreen(),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    String message = 'No se pudo crear la cuenta.';

                    if (e.code == 'email-already-in-use') {
                      message = 'Este correo ya está registrado.';
                    } else if (e.code == 'weak-password') {
                      message = 'La contraseña es demasiado débil.';
                    } else if (e.code == 'invalid-email') {
                      message = 'El correo electrónico no es válido.';
                    }

                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  } catch (e) {
                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ocurrió un error. Intenta nuevamente.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315C45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'CREAR CUENTA',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield_rounded, size: 18, color: Color(0xFF315C45)),
                SizedBox(width: 7),
                Text(
                  'Tus datos están protegidos',
                  style: TextStyle(fontSize: 13, color: Color(0xFF6B5A47)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  State<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) return;

      currentPosition = position;

      pickupController.text =
          '${position.latitude}, ${position.longitude}';

      mapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );

      setState(() {});
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo obtener tu ubicación: $e'),
        ),
      );
    }
  }

  final pickupController = TextEditingController();
  final destinationController = TextEditingController();

  bool isRequesting = false;
  GoogleMapController? mapController;
  Position? currentPosition;
  bool isCalculatingFare = false;
  double? estimatedDistanceKm;
  int? estimatedFare;

  String? _estimatedPickup;
  String? _estimatedDestination;

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  Future<void> _calculateEstimatedFare() async {
    final pickup = pickupController.text.trim();
    final destination = destinationController.text.trim();

    if (pickup.isEmpty || destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe el punto de partida y el destino.'),
        ),
      );
      return;
    }

    try {
      final coordinates = pickup.split(',');

      if (coordinates.length != 2) {
        throw Exception('El punto de partida no tiene coordenadas válidas.');
      }

      final originLat = double.tryParse(coordinates[0].trim());
      final originLng = double.tryParse(coordinates[1].trim());

      if (originLat == null || originLng == null) {
        throw Exception('No se pudieron leer las coordenadas.');
      }

      setState(() {
        isCalculatingFare = true;
      });

      // RUVIA - modo de prueba temporal.
      // No usamos Google Routes mientras la cuota diaria está agotada.
      // Después volveremos a activar el cálculo real.
      const double distanceKm = 5.0;

      final calculatedFare =
          (25 + (distanceKm * 12)).ceil().clamp(40, 100000);

      if (!mounted) return;

      setState(() {
        estimatedDistanceKm = distanceKm;
        estimatedFare = calculatedFare;
        _estimatedPickup = pickup;
        _estimatedDestination = destination;
        isCalculatingFare = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isCalculatingFare = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo calcular la tarifa: $e'),
        ),
      );
    }
  }

  Future<void> _requestRide() async {
    final pickup = pickupController.text.trim();
    final destination = destinationController.text.trim();

    if (pickup.isEmpty || destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe el punto de partida y el destino.'),
        ),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tu sesión no está activa. Inicia sesión nuevamente.'),
        ),
      );
      return;
    }

    setState(() {
      isRequesting = true;
    });

    try {
      final coordinates = pickup.split(',');

      if (coordinates.length != 2) {
        throw Exception('El punto de partida no tiene coordenadas válidas.');
      }

      final originLat = double.tryParse(coordinates[0].trim());
      final originLng = double.tryParse(coordinates[1].trim());

      if (originLat == null || originLng == null) {
        throw Exception('No se pudieron leer las coordenadas.');
      }

      double? distanceKm = estimatedDistanceKm;
      int? calculatedFare = estimatedFare;

      final hasValidEstimate =
          distanceKm != null &&
          calculatedFare != null &&
          _estimatedPickup == pickup &&
          _estimatedDestination == destination;

      if (!hasValidEstimate) {
        distanceKm = await calculateRouteDistanceKm(
          originLat: originLat,
          originLng: originLng,
          destination: destination,
        );

        if (distanceKm == null) {
          throw Exception('No se pudo calcular la distancia de la ruta.');
        }

        calculatedFare =
            (25 + (distanceKm * 12)).ceil().clamp(40, 100000);
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final userData = userDoc.data();

      final rideDoc = await FirebaseFirestore.instance
          .collection('ride_requests')
          .add({
            'passengerId': user.uid,
            'passengerName': userData?['name'] ?? '',
            'passengerPhone': userData?['phone'] ?? '',
            'pickup': pickup,
            'destination': destination,
            'distanceKm': double.parse(distanceKm.toStringAsFixed(2)),
            'fare': calculatedFare,
            'status': 'searching',
            'createdAt': FieldValue.serverTimestamp(),
          });

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchingDriverScreen(rideId: rideDoc.id),
        ),
      );
    } on FirebaseException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.code == 'permission-denied'
                ? 'No tienes permiso para solicitar el viaje.'
                : 'No se pudo solicitar el viaje. Intenta nuevamente.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se pudo calcular la tarifa. Verifica el destino e intenta nuevamente.',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isRequesting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        title: const Text(
          'RUVIA',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              '¿A dónde quieres ir?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 280,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(19.9118, -100.8297),
                    zoom: 10,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (controller) {
                    mapController = controller;

                    if (currentPosition != null) {
                      controller.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(
                            currentPosition!.latitude,
                            currentPosition!.longitude,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: pickupController,
              decoration: InputDecoration(
                labelText: 'Punto de partida',
                prefixIcon: IconButton(
                  icon: const Icon(Icons.my_location),
                  onPressed: _getCurrentLocation,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                labelText: '¿A dónde quieres ir?',
                prefixIcon: const Icon(Icons.location_on_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: isCalculatingFare
                    ? null
                    : _calculateEstimatedFare,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF315C45),
                  side: const BorderSide(
                    color: Color(0xFF315C45),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: isCalculatingFare
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      )
                    : const Text(
                        'CALCULAR TARIFA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            if (estimatedFare != null) ...[
              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TARIFA ESTIMADA',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$$estimatedFare MXN',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                    ),
                    if (estimatedDistanceKm != null) ...[
                      const SizedBox(height: 5),
                      Text(
                        '${estimatedDistanceKm!.toStringAsFixed(1)} km aproximadamente',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: isRequesting || estimatedFare == null
                    ? null
                    : _requestRide,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315C45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: isRequesting
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text(
                        'SOLICITAR VIAJE',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchingDriverScreen extends StatefulWidget {
  final String rideId;

  const SearchingDriverScreen({super.key, required this.rideId});

  @override
  State<SearchingDriverScreen> createState() =>
      _SearchingDriverScreenState();
}

class _SearchingDriverScreenState extends State<SearchingDriverScreen> {
  List<LatLng> _routePoints = [];
  bool _routeLoading = false;
  String? _lastRouteDestination;
  int _selectedRating = 0;
  bool _ratingSubmitted = false;

  Future<void> _loadPassengerRoute(
    double driverLat,
    double driverLng,
    String destination,
  ) async {
    if (_routeLoading) {
      return;
    }

    // La ruta se calcula una sola vez por viaje.
    // La ubicación del conductor continúa actualizándose
    // mediante Firebase sin volver a consumir Routes API.
    if (_routePoints.isNotEmpty &&
        _lastRouteDestination == destination) {
      return;
    }

    _routeLoading = true;
    _lastRouteDestination = destination;

    try {
      final route = await calculateRuviaRoute(
        originLat: driverLat,
        originLng: driverLng,
        destination: destination,
      );

      if (!mounted) return;

      if (route != null) {
        final rawPoints = route['routePoints'];

        if (rawPoints is List) {
          final points = <LatLng>[];

          for (final point in rawPoints) {
            if (point is Map) {
              final lat = (point['lat'] as num?)?.toDouble();
              final lng = (point['lng'] as num?)?.toDouble();

              if (lat != null && lng != null) {
                points.add(LatLng(lat, lng));
              }
            }
          }

          if (points.isNotEmpty) {
            setState(() {
              _routePoints = points;
            });
          }
        }
      }
    } catch (e) {
      debugPrint('RUVIA - error cargando ruta pasajero: $e');
    } finally {
      _routeLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ride_requests')
          .doc(widget.rideId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F0E5),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No se pudo consultar el estado del viaje.',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF315C45),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFF6F0E5),
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFF315C45)),
            ),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>?;

        final status = data?['status'] ?? 'searching';

        debugPrint('RUVIA DEBUG - rideId: ${widget.rideId} - status: $status');
        debugPrint('RUVIA DEBUG - fare: ${data?['fare']} - distanceKm: ${data?['distanceKm']}');

        if (status == 'completed') {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F0E5),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF6F0E5),
              elevation: 0,
              title: const Text(
                'RUVIA',
                style: TextStyle(
                  color: Color(0xFF315C45),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 100,
                      color: Color(0xFF315C45),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      '¡Viaje finalizado!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Has llegado a tu destino.',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Conductor: ${data?['driverName'] ?? 'Conductor'}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF315C45),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          FutureBuilder<String>(
                            future: formatRuviaAddress(
                              data?['pickup']?.toString() ?? '',
                            ),
                            builder: (context, snapshot) {
                              final displayedPickup =
                                  snapshot.data ??
                                  data?['pickup']?.toString() ??
                                  'Sin origen';

                              return Text(
                                'Origen: $displayedPickup',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Destino: ${data?['destination'] ?? 'Sin destino'}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 12),
                          const SizedBox(height: 8),
                          Text(
                            'Distancia: ${data?['distanceKm'] ?? 0} km',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'TOTAL DEL VIAJE: \$${data?['fare'] ?? 0} MXN',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF315C45),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    if (!_ratingSubmitted) ...[
                      const Text(
                        '¿Cómo fue tu viaje?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF315C45),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final rating = index + 1;

                          return IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedRating = rating;
                              });
                            },
                            icon: Icon(
                              rating <= _selectedRating
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 42,
                              color: const Color(0xFFC56A3D),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _selectedRating == 0
                              ? null
                              : () async {
                                  final messenger =
                                      ScaffoldMessenger.of(context);

                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('ride_requests')
                                        .doc(widget.rideId)
                                        .update({
                                      'passengerRating': _selectedRating,
                                      'ratingSubmittedAt':
                                          FieldValue.serverTimestamp(),
                                    });

                                    if (!mounted) return;

                                    setState(() {
                                      _ratingSubmitted = true;
                                    });

                                    messenger.showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          '¡Gracias por calificar tu viaje!',
                                        ),
                                      ),
                                    );
                                  } on FirebaseException catch (e) {
                                    if (!mounted) return;

                                    messenger.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'No se pudo guardar la calificación: ${e.message ?? e.code}',
                                        ),
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF315C45),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'ENVIAR CALIFICACIÓN',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                    ] else ...[
                      const Text(
                        '¡Gracias por tu calificación!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF315C45),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 25),
                    ],

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF315C45),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'VOLVER AL INICIO',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (status == 'started') {
          final driverLat =
              (data?['driverLatitude'] as num?)?.toDouble();

          final driverLng =
              (data?['driverLongitude'] as num?)?.toDouble();

          final destination =
              data?['destination']?.toString() ?? '';

          if (driverLat != null &&
              driverLng != null &&
              destination.isNotEmpty) {
            _loadPassengerRoute(
              driverLat,
              driverLng,
              destination,
            );
          }

          return Scaffold(
            backgroundColor: const Color(0xFFF6F0E5),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF6F0E5),
              elevation: 0,
              title: const Text(
                'RUVIA',
                style: TextStyle(
                  color: Color(0xFF315C45),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '¡Viaje en curso!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF315C45),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Puedes ver la ubicación de tu conductor en tiempo real.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    height: 320,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: driverLat != null && driverLng != null
                        ? GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(driverLat, driverLng),
                              zoom: 15,
                            ),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            zoomControlsEnabled: true,
                            markers: {
                              Marker(
                                markerId:
                                    const MarkerId('driver_location'),
                                position:
                                    LatLng(driverLat, driverLng),
                                infoWindow: InfoWindow(
                                  title:
                                      data?['driverName'] ??
                                      'Conductor',
                                ),
                              ),
                            },
                            polylines: {
                              if (_routePoints.isNotEmpty)
                                Polyline(
                                  polylineId:
                                      const PolylineId('passenger_route'),
                                  points: _routePoints,
                                  width: 6,
                                  color:
                                      const Color(0xFF315C45),
                                ),
                            },
                          )
                        : const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Esperando la ubicación del conductor...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF315C45),
                                ),
                              ),
                            ),
                          ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Conductor: ${data?['driverName'] ?? 'Conductor'}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF315C45),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Teléfono: ${data?['driverPhone'] ?? 'No disponible'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Destino: ${data?['destination'] ?? 'Sin destino'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Tarifa: \$${data?['fare'] ?? 0} MXN',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF315C45),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (status == 'accepted') {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F0E5),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF6F0E5),
              elevation: 0,
              title: const Text(
                'RUVIA',
                style: TextStyle(
                  color: Color(0xFF315C45),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 90,
                      color: Color(0xFF315C45),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      '¡Conductor encontrado!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Conductor: ${data?['driverName'] ?? 'Conductor'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Teléfono: ${data?['driverPhone'] ?? 'No disponible'}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Tarifa estimada: \$${data?['fare'] ?? 50} MXN",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Tu conductor aceptó el viaje y va en camino.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DriverTrackingScreen(rideId: widget.rideId),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF315C45),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'VER VIAJE',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF6F0E5),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF6F0E5),
            elevation: 0,
            title: const Text(
              'RUVIA',
              style: TextStyle(
                color: Color(0xFF315C45),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Color(0xFF315C45),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Buscando conductor',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF315C45),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Estamos buscando un conductor cercano para tu viaje.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  const CircularProgressIndicator(color: Color(0xFF315C45)),
                  const SizedBox(height: 35),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('CANCELAR VIAJE'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class DriverTrackingScreen extends StatefulWidget {
  final String rideId;
  final Future<void> Function()? onRideFinished;

  const DriverTrackingScreen({
    super.key,
    required this.rideId,
    this.onRideFinished,
  });

  @override
  State<DriverTrackingScreen> createState() =>
      _DriverTrackingScreenState();
}

class _DriverTrackingScreenState extends State<DriverTrackingScreen> {
  List<LatLng> _routePoints = [];
  bool _routeLoading = false;
  String? _lastRouteDestination;

  Future<void> _loadDriverRoute(
    double driverLat,
    double driverLng,
    String destination,
  ) async {
    if (_routeLoading) {
      return;
    }

    // La ruta se calcula una sola vez por viaje.
    // La ubicación del conductor continúa actualizándose
    // mediante Firebase sin volver a consumir Routes API.
    if (_routePoints.isNotEmpty &&
        _lastRouteDestination == destination) {
      return;
    }

    _routeLoading = true;
    _lastRouteDestination = destination;

    try {
      final route = await calculateRuviaRoute(
        originLat: driverLat,
        originLng: driverLng,
        destination: destination,
      );

      if (!mounted) return;

      if (route != null) {
        final rawPoints = route['routePoints'];

        if (rawPoints is List && rawPoints.isNotEmpty) {
          final points = <LatLng>[];

          for (final point in rawPoints) {
            if (point is Map) {
              final lat = (point['lat'] as num?)?.toDouble();
              final lng = (point['lng'] as num?)?.toDouble();

              if (lat != null && lng != null) {
                points.add(LatLng(lat, lng));
              }
            }
          }

          if (points.isNotEmpty && mounted) {
            setState(() {
              _routePoints = points;
            });
          }
        }
      }
    } catch (_) {
      // Si falla la ruta, el seguimiento del conductor continúa.
    } finally {
      _routeLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ride_requests')
          .doc(widget.rideId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            backgroundColor: Color(0xFFF6F0E5),
            body: Center(
              child: Text(
                'No se pudo cargar la ubicación del conductor.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFF6F0E5),
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF315C45),
              ),
            ),
          );
        }

        final data =
            snapshot.data!.data() as Map<String, dynamic>?;

        final status = data?['status'] ?? 'searching';

        final driverLat =
            (data?['driverLatitude'] as num?)?.toDouble();

        final driverLng =
            (data?['driverLongitude'] as num?)?.toDouble();

        final destination =
            data?['destination']?.toString() ?? '';

        if (driverLat != null &&
            driverLng != null &&
            destination.isNotEmpty) {
          _loadDriverRoute(
            driverLat,
            driverLng,
            destination,
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF6F0E5),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF6F0E5),
            elevation: 0,
            title: const Text(
              'RUVIA',
              style: TextStyle(
                color: Color(0xFF315C45),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: driverLat != null && driverLng != null
                    ? GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(driverLat, driverLng),
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('driver'),
                            position: LatLng(driverLat, driverLng),
                            infoWindow: InfoWindow(
                              title: data?['driverName'] ??
                                  'Conductor RUVIA',
                              snippet: data?['driverPhone'] ??
                                  'Teléfono no disponible',
                            ),
                          ),
                        },
                        polylines: {
                          if (_routePoints.isNotEmpty)
                            Polyline(
                              polylineId:
                                  const PolylineId('driver_route'),
                              points: _routePoints,
                              width: 6,
                              color: const Color(0xFF315C45),
                            ),
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: true,
                      )
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Text(
                            'Esperando la ubicación del conductor...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF315C45),
                            ),
                          ),
                        ),
                      ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      status == 'completed'
                          ? 'Viaje finalizado'
                          : status == 'started'
                              ? 'Viaje en curso'
                              : 'Conductor en camino',
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Conductor: ${data?['driverName'] ?? 'Conductor'}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Teléfono: ${data?['driverPhone'] ?? 'No disponible'}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Destino: ${data?['destination'] ?? 'Sin destino'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tarifa: \$${data?['fare'] ?? 0} MXN',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF315C45),
                      ),
                    ),

                    const SizedBox(height: 18),

                    if (status == 'started')
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await FirebaseFirestore.instance
                                  .collection('ride_requests')
                                  .doc(widget.rideId)
                                  .update({
                                'status': 'completed',
                              });

                              await widget.onRideFinished?.call();

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Viaje finalizado'),
                                ),
                              );

                              Navigator.pop(context);
                            } on FirebaseException catch (e) {
                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.code == 'permission-denied'
                                        ? 'No tienes permiso para finalizar este viaje.'
                                        : 'No se pudo finalizar el viaje.',
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF315C45),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(
                              double.infinity,
                              55,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'FINALIZAR VIAJE',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  StreamSubscription<Position>? _locationSubscription;
  Future<void> _startDriverLocation(String rideId) async {
    try {
      final serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return;
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      await _locationSubscription?.cancel();

      _locationSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).listen((position) async {        await FirebaseFirestore.instance
            .collection('ride_requests')
            .doc(rideId)
            .update({
          'driverLatitude': position.latitude,
          'driverLongitude': position.longitude,
          'driverLocationUpdatedAt':
              FieldValue.serverTimestamp(),
        });
      });
    } catch (e) {
      debugPrint('RUVIA - error GPS conductor: $e');
    }
  }

  Future<void> _stopDriverLocation() async {
    await _locationSubscription?.cancel();
    _locationSubscription = null;
  }

  @override
  void dispose() {
    _stopDriverLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final driver = FirebaseAuth.instance.currentUser;

    if (driver == null) {
      return const Scaffold(
        backgroundColor: Color(0xFFF6F0E5),
        body: Center(child: Text('Sesión de conductor no activa.')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F0E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0E5),
        elevation: 0,
        title: const Text(
          'RUVIA CONDUCTOR',
          style: TextStyle(
            color: Color(0xFF315C45),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.directions_car,
              size: 70,
              color: Color(0xFF315C45),
            ),

            const SizedBox(height: 15),

            const Text(
              'Modo conductor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Estás listo para recibir solicitudes de viaje.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('ride_requests')
                    .where(
                      Filter.or(
                        Filter('status', isEqualTo: 'searching'),
                        Filter('driverId', isEqualTo: driver.uid),
                      ),
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF315C45),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'No se pudieron cargar las solicitudes.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  final allRequests = snapshot.data?.docs ?? [];

                  final requests = allRequests.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;

                    final status = data['status'];
                    final driverId = data['driverId'];

                    if (status == 'searching') {
                      return true;
                    }

                    if (status == 'accepted' || status == 'started') {
                      return driverId == driver.uid;
                    }

                    return false;
                  }).toList();

                  if (requests.isEmpty) {
                    return const Center(
                      child: Text(
                        'No hay solicitudes de viaje por ahora.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      final doc = requests[index];
                      final data = doc.data() as Map<String, dynamic>;

                      final status = data['status'] ?? 'searching';

                      final passengerName = data['passengerName'] ?? 'Pasajero';

                      final passengerPhone =
                          data['passengerPhone'] ?? 'No disponible';

                      final pickup = data['pickup'] ?? 'Sin origen';

                      final destination = data['destination'] ?? 'Sin destino';

                      final fare = data['fare'] ?? 50;

                      String title = 'Solicitud de viaje';
                      String buttonText = 'ACEPTAR VIAJE';

                      if (status == 'accepted') {
                        title = 'Viaje aceptado';
                        buttonText = 'INICIAR VIAJE';
                      } else if (status == 'started') {
                        title = 'Viaje en curso';
                        buttonText = 'FINALIZAR VIAJE';
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF315C45),
                              ),
                            ),

                            const SizedBox(height: 15),

                            Text(
                              'Pasajero: $passengerName',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Text(
                              'Teléfono: $passengerPhone',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 7),

                            FutureBuilder<String>(
                              future: formatRuviaAddress(pickup.toString()),
                              builder: (context, snapshot) {
                                final displayedPickup =
                                    snapshot.data ?? pickup.toString();

                                return Text(
                                  'Origen: $displayedPickup',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 7),

                            Text(
                              'Destino: $destination',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              'Tarifa del viaje: \$$fare MXN',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF315C45),
                              ),
                            ),

                            const SizedBox(height: 18),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    if (status == 'searching') {
                                      final driverDoc = await FirebaseFirestore
                                          .instance
                                          .collection('users')
                                          .doc(driver.uid)
                                          .get();

                                      final driverData = driverDoc.data();

                                      await FirebaseFirestore.instance
                                          .collection('ride_requests')
                                          .doc(doc.id)
                                          .update({
                                            'status': 'accepted',
                                            'driverId': driver.uid,
                                            'driverName':
                                                driverData?['name'] ??
                                                'Conductor',
                                            'driverPhone':
                                                driverData?['phone'] ?? '',
                                          });
                                    } else if (status == 'accepted') {
                                      await FirebaseFirestore.instance
                                          .collection('ride_requests')
                                          .doc(doc.id)
                                          .update({'status': 'started'});

                                      await _startDriverLocation(doc.id);

                                      if (!context.mounted) return;

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DriverTrackingScreen(
                                            rideId: doc.id,
                                            onRideFinished: _stopDriverLocation,
                                          ),
                                        ),
                                      );
                                    } else if (status == 'started') {
                                      await FirebaseFirestore.instance
                                          .collection('ride_requests')
                                          .doc(doc.id)
                                          .update({'status': 'completed'});

                                      await _stopDriverLocation();
                                    }

                                    if (!context.mounted) return;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          status == 'searching'
                                              ? 'Viaje aceptado'
                                              : status == 'accepted'
                                              ? 'Viaje iniciado'
                                              : 'Viaje finalizado',
                                        ),
                                      ),
                                    );
                                  } on FirebaseException catch (e) {
                                    if (!context.mounted) return;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.code == 'permission-denied'
                                              ? 'No tienes permiso para actualizar este viaje.'
                                              : 'No se pudo actualizar el viaje.',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF315C45),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  buttonText,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
