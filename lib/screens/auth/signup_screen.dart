import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../home/home_shell.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _selectedType = 'Student';
  final List<String> _userTypes = ['Student', 'Freelancer', 'Client', 'Instructor', 'Media Creator'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Join LANDER', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text('Tell us who you are so we can personalize your experience.',
                  style: TextStyle(fontSize: 13.5, color: Colors.grey.shade600)),
              const SizedBox(height: 24),
              const Text('Full name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Enter your full name')),
              const SizedBox(height: 18),
              const Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'you@example.com')),
              const SizedBox(height: 18),
              const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
              const SizedBox(height: 8),
              const TextField(obscureText: true, decoration: InputDecoration(hintText: '••••••••')),
              const SizedBox(height: 22),
              const Text('I am a...', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _userTypes.map((type) {
                  final selected = type == _selectedType;
                  return ChoiceChip(
                    label: Text(type),
                    selected: selected,
                    onSelected: (_) => setState(() => _selectedType = type),
                    selectedColor: AppColors.primaryOrange,
                    labelStyle: TextStyle(
                      color: selected ? AppColors.white : AppColors.darkGray,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: AppColors.lightGray,
                  );
                }).toList(),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeShell()),
                  ),
                  child: const Text('Create Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
