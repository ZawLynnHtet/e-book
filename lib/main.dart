import 'package:e_book/compoments/books_list.dart';
import 'package:e_book/data/book_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data/book_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> bookStore = [];
  final TextEditingController bookName = TextEditingController();

  getBooks(String? book) async {
    bookStore = await bookApiCall(book!);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks(bookName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 10,
        title: TextFormField(
          controller: bookName,
          decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              suffixIcon: IconButton(onPressed: (){
                bookName.clear();
                setState(() {
                  
                });
              }, icon: const Icon(FontAwesomeIcons.xmark)),
              prefixIcon: IconButton(
                  onPressed: () async{
                    var books = await getBooks(bookName.text);
                    print(books);
                    setState(() {
                      
                    });
                  },
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
              hintText: "Search books here...",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
      body: bookName.text.isEmpty
          ? const Center(
              child: Text("Search books"),
            )
          : BooksList(bookList: bookStore),
    );
  }
}
