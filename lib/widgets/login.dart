import 'dart:ui';

import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void showToast() {
    if (_formKey.currentState!.validate()) {
      final user = username.text;
      final psw = password.text;
      if (user != 'admin' && psw != '123456') {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                  child: const Center(child: Text('用户名或密码不正确')),
                ),
              );
            });
        return;
      }
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Center(child: Text('登录成功')),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                  labelText: '请输入用户名',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入用户名';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // 密码
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                  labelText: '请输入密码',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  suffixIcon: Icon(Icons.remove_red_eye)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入密码';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: showToast,
                child: const Text('登录'))
          ],
        ),
      ),
    );
  }
}
