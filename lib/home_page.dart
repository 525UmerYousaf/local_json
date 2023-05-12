// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import './model.dart';
import 'amazon_api_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print("The initState method for Home-Page gets called.");
    ConfigLoader().logConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AmazonTest>(
        future: ConfigLoader().logConfig(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Unfortunately cannot load data from server..",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data?.totalProducts != '') {
              return ListView.builder(
                itemCount: snapshot.data!.result!.length,
                itemBuilder: (context, index) {
                  // print(snapshot.data!.result!.length);
                  return Column(
                    children: [
                      const Center(
                          child: Text("Below is image i fetch from API")),
                      Image.network(
                        snapshot.data!.result![index].thumbnail.toString(),

                        // loadingBuilder: (context, child, loadingProgress) {
                        //   var percentage = 0.0;
                        //   final total = loadingProgress.expectedTotalBytes;
                        //   if (total != null) {
                        //     final current =
                        //         loadingProgress.cumulativeBytesLoaded;
                        //     percentage = current / total;
                        //   }
                        //   return Center(
                        //     child: CircularProgressIndicator(value: percentage),
                        //   );
                        // },
                        //  ***************************
                        //     loadingBuilder: (context,
                        //         Widget? child,
                        //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        //             snapshot) {
                        //   if (snapshot.connectionState ==
                        //       ConnectionState.waiting) {
                        //     return CircularProgressIndicator();
                        //   } else if (snapshot.hasError) {
                        //     return Text('Error: ${snapshot.error}');
                        //   } else if (!snapshot.hasData ||
                        //       snapshot.data!.docs.isEmpty) {
                        //     return Text('No data available');
                        //   } else {
                        //     final loadingProgress = snapshot.data!.docs;
                        //     var percentage = 0.0;
                        //     final total = loadingProgress.expectedTotalBytes;
                        //     final current = loadingProgress.cumulativeBytesLoaded;

                        //     if (total != null && current != null) {
                        //       percentage = current / total;
                        //     }

                        //     return Center(
                        //       child: CircularProgressIndicator(value: percentage),
                        //     );
                        //   }
                        // }
                        //  Chat GPT-3 response is till above line of code

                        // if (loadingProgress == null) return child;
                        // return const Center(
                        //   child: CircularProgressIndicator(),
                        // );
                        // frameBuilder: (context, child, _, loaded) {
                        //   if (loaded) return child;
                        //   return const Text("Loading ...");
                        // },
                      ),
                      // Image(
                      //   image: NetworkImage(
                      //     snapshot.data!.result![index].thumbnail.toString(),
                      //   ),
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress == null) return child;
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   },
                      // ),
                      const Center(child: Text("The title of product is:")),
                      Text(snapshot.data!.result![index].title.toString()),
                      const Center(child: Text("The price of product is:")),
                      Text(snapshot.data!.result![index].price.toString()),
                      const Center(
                          child: Text("The amazon choice of product is:")),
                      Text(snapshot.data!.result![index].amazonChoice
                          .toString()),
                      const Center(
                          child: Text("The amazon prime of product is:")),
                      Text(
                          snapshot.data!.result![index].amazonPrime.toString()),
                      const Center(child: Text("The ASIN of product is:")),
                      Text(snapshot.data!.result![index].asin.toString()),
                      const Center(
                          child: Text("The bestSeller of product is:")),
                      Text(snapshot.data!.result![index].bestSeller.toString()),
                      const Center(child: Text("The review of product is:")),
                      Text(snapshot.data!.result![index].reviews.toString()),
                      const Center(child: Text("The score of product is:")),
                      Text(snapshot.data!.result![index].score.toString()),
                      const Center(
                          child: Text("The snponsored of product is:")),
                      Text(snapshot.data!.result![index].sponsored.toString()),
                      const Center(child: Text("The url of product is:")),
                      Text(snapshot.data!.result![index].url.toString()),
                      const Center(
                          child: Text("The thumb-nail of product is:")),
                      Image.network(
                        snapshot.data!.result![index].thumbnail.toString(),
                      ),
                      // Text(snapshot.data!.result![index].thumbnail.toString()),
                    ],
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
