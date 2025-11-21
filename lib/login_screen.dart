import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakshbandhi/providers/auth_provider.dart';

import 'constants/country.dart';
import 'main.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isPhoneLogin = true;
  String phoneNumber = '';
  String email = '';
  String password = '';
  Map<String, dynamic>? selectedCountry;


  @override
  void initState() {
    super.initState();
    // Set default country
    selectedCountry = countryInfo.firstWhere((e)=>e['id']==47);
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    ref.listen(loginProvider, (prev, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome ${user.name}!")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainNavigationWrapper(),
              ),
            );
          }
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login failed: $err")),
          );
        },
      );
    });

    //07466805673
    //kamran.rimon.bd@gmail.com
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/bg.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Center(
                  child: Text(
                    'NAQSHBANDI SUFI®',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Login Account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text('Hello! Welcome back to your account.',
                    style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9))),
                const SizedBox(height: 46),
        
                // Phone/Email field
                isPhoneLogin
                    ? Row(
                  children: [
                    // Country selector dropdown
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: PopupMenuButton<Map<String, dynamic>>(
                        onSelected: (country) {
                          setState(() {
                            selectedCountry = country;
                          });
                          debugPrint('selectedCountry ${selectedCountry}');
                        },
                        itemBuilder: (context) => countryInfo
                            .map((country) => PopupMenuItem<Map<String, dynamic>>(
                          value: country,
                          child: Text(
                              '${country['unicode_flag']} ${country['name']} (${country['dial_code']})'),
                        ))
                            .toList(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedCountry?['unicode_flag'] ?? '🇧🇩',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                selectedCountry?['dial_code'] ?? '880',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Phone number field
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (val) => phoneNumber = val,
                      ),
                    ),
                  ],
                )
                    : TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (val) => email = val,
                ),
                const SizedBox(height: 16),
        
                // Password field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (val) => password = val,
                ),
                const SizedBox(height: 32),
        
                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginState.isLoading
                        ? null
                        : () {
                      if (isPhoneLogin) {
                        ref.read(loginProvider.notifier).loginPhone(
                          phone: phoneNumber,
                          country: selectedCountry?['id'].toString()??'47',
                          password: password,
                        );
                      } else {
                        ref.read(loginProvider.notifier).loginEmail(
                          email: email,
                          password: password,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: loginState.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Continue', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
        
                // Toggle phone/email
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Phone', style: TextStyle(color: isPhoneLogin ? Colors.white : Colors.white54)),
                    Switch(
                      value: isPhoneLogin,
                      onChanged: (val) => setState(() => isPhoneLogin = val),
                      activeColor: Colors.green,
                    ),
                    Text('Email', style: TextStyle(color: !isPhoneLogin ? Colors.white : Colors.white54)),
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