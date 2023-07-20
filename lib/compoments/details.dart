// import 'package:e_book/data/book_class.dart';
import 'package:e_book/data/book_api.dart';
import 'package:flutter/material.dart';

import '../data/details_class.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.md5});

  String md5;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late final Data details;
  bool loading = true;

  detailsResult()async{
    details = await detailsApiCall(widget.md5);
    loading = false;
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading? const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Image.network(details.thumbnail,
              width: 200,),
              const SizedBox(
                height: 20,
              ),
              Text(details.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(
                height: 20,
              ),
              Text(details.downloadLink,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),),
              const SizedBox(
                height: 20,
              ),
              Text(details.desc,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ),
      ),
    );
  }
}