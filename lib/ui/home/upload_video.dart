import 'package:flutter/material.dart';

class UploadVideoScreen extends StatelessWidget {
  const UploadVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Upload Video',
            style: TextStyle(color: Colors.black),
          ),
          //backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(alignment: Alignment.centerLeft, child: Text('Titre')),
              const TextField(),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerLeft, child: Text('Description')),
              TextField(
                minLines: 3,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 150,
                  child:
                      ElevatedButton(onPressed: () {}, child: const Text('Upload')))
            ],
          ),
        ),
      ),
    );
  }
}
