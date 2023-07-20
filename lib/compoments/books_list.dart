import 'package:e_book/compoments/details.dart';
import 'package:flutter/material.dart';
import '../data/book_class.dart';
// import '../data/details_class.dart';

// ignore: must_be_immutable
class BooksList extends StatefulWidget {
  BooksList({super.key, required this.bookList});
  List<Datum> bookList = [];

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: widget.bookList.isEmpty
            ? const CircularProgressIndicator(
                color: Colors.blue,
              )
            : SizedBox(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.bookList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bookList[index].title,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.bookList[index].author,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${widget.bookList[index].totalPage} pages",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "${widget.bookList[index].language}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.bookList[index].format.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Download Size : ${widget.bookList[index].downloadSize}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      minimumSize: const Size(80, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () async {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailsPage(
                                          md5: widget.bookList[index].md5);
                                    }));
                                  },
                                  child: const Text("Read"))
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }
}
