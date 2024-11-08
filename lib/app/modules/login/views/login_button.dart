import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onTap;
  final bool isLoading;

  const LoginButton({super.key, required this.onTap, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLoading == false) {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : Container(),
              SizedBox(
                width: 10,
              ),
              Text(
                isLoading ? 'Loading...' : 'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
