import 'package:flutter/material.dart';

class AdminSetupScreen extends StatefulWidget {
  const AdminSetupScreen({super.key});

  @override
  State<AdminSetupScreen> createState() => _AdminSetupScreenState();
}

class _AdminSetupScreenState extends State<AdminSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Personal Info Controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  
  // Bank Info Controllers
  final _bankNameController = TextEditingController();
  final _accountHolderController = TextEditingController();
  final _ibanController = TextEditingController();
  final _swiftController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bankNameController.dispose();
    _accountHolderController.dispose();
    _ibanController.dispose();
    _swiftController.dispose();
    super.dispose();
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      // Here we would normally save to Supabase
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ البيانات بنجاح! جاري الانتقال للمتجر...'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
      
      // Navigate to main store page
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إعداد حساب المسؤول'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF4747), // AliExpress Red
        foregroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مرحباً بك في متجرك الجديد',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'يرجى إدخال بياناتك الشخصية والبنكية لاستقبال المدفوعات.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                
                _buildSectionTitle('البيانات الشخصية'),
                _buildTextField(
                  controller: _fullNameController,
                  label: 'الاسم الكامل',
                  icon: Icons.person,
                  validator: (value) => value!.isEmpty ? 'يرجى إدخال الاسم' : null,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: 'البريد الإلكتروني',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty ? 'يرجى إدخال البريد الإلكتروني' : null,
                ),
                _buildTextField(
                  controller: _phoneController,
                  label: 'رقم الهاتف',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty ? 'يرجى إدخال رقم الهاتف' : null,
                ),

                const SizedBox(height: 24),
                _buildSectionTitle('بيانات الحساب البنكي'),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _bankNameController,
                        label: 'اسم البنك',
                        icon: Icons.account_balance,
                        validator: (value) => value!.isEmpty ? 'يرجى إدخال اسم البنك' : null,
                      ),
                      _buildTextField(
                        controller: _accountHolderController,
                        label: 'اسم صاحب الحساب',
                        icon: Icons.person_outline,
                        validator: (value) => value!.isEmpty ? 'يرجى إدخال اسم صاحب الحساب' : null,
                      ),
                      _buildTextField(
                        controller: _ibanController,
                        label: 'رقم الآيبان (IBAN)',
                        icon: Icons.numbers,
                        validator: (value) => value!.isEmpty ? 'يرجى إدخال رقم الآيبان' : null,
                      ),
                      _buildTextField(
                        controller: _swiftController,
                        label: 'رمز السويفت (SWIFT/BIC)',
                        icon: Icons.code,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _saveData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4747),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'حفظ البيانات وبدء المتجر',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
