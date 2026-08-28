import 'package:flutter/material.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315C45),
        ),
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
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6B5A47),
                  ),
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
                    onPressed: () {
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
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B5A47),
                      ),
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
}class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

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
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B5A47),
              ),
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
                onPressed: () {},
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
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
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
                Icon(
                  Icons.shield_rounded,
                  size: 18,
                  color: Color(0xFF315C45),
                ),
                SizedBox(width: 7),
                Text(
                  'Viajes seguros para nuestra comunidad',
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
    );
  }
}
class PassengerAccessScreen extends StatelessWidget {
  const PassengerAccessScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 35),

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

            const SizedBox(height: 40),

            TextField(
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

            const SizedBox(height: 18),

            TextField(
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
                onPressed: () {},
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
      builder: (context) => const CreateAccountScreen(),
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

            const Spacer(),

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
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF315C45),
          ),
          onPressed: () {
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
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF6B5A47),
              ),
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
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B5A47),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 55,
              child: ElevatedButton(
onPressed: () {
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

  if (passwordController.text != confirmPasswordController.text) {
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
        content: Text('Debes aceptar los términos y condiciones.'),
      ),
    );
    return;
  }
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const PassengerHomeScreen(),
  ),
);
},                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315C45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
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
                  'Tus datos están protegidos',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B5A47),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class PassengerHomeScreen extends StatelessWidget {
  const PassengerHomeScreen({super.key});

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
      body: Padding(
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
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                labelText: 'Punto de partida',
                prefixIcon: const Icon(Icons.my_location),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(              decoration: InputDecoration(
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
            const SizedBox(height: 25),
            SizedBox(
              height: 55,
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SearchingDriverScreen(),
  ),
);
},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF315C45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
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
class SearchingDriverScreen extends StatelessWidget {
  const SearchingDriverScreen({super.key});

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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              const CircularProgressIndicator(
                color: Color(0xFF315C45),
              ),
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
  }
}
class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 25),

            const Icon(
              Icons.directions_car,
              size: 80,
              color: Color(0xFF315C45),
            ),

            const SizedBox(height: 20),

            const Text(
              'Modo conductor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Estás listo para recibir solicitudes de viaje.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Conductor conectado',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Solicitudes de viaje',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF315C45),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'No hay viajes disponibles por ahora.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}