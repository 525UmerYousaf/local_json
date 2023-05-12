import 'package:amazon_api/model.dart';
import 'package:flutter/material.dart';

import 'amazon_one_product_review.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    print("The initState method for Home-Page gets called.");
    ConfigLoader().loadReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SingleProdctReview>(
        future: ConfigLoader().loadReview(),
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
            if (snapshot.data?.totalReviews != '') {
              return Container(
                // snapshot.data!.result![index].thumbnail.toString(),
                child: ListView.builder(
                  itemCount: snapshot.data!.result!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text("The date of product's review is:"),
                        Text(snapshot.data!.result![index].date!.date
                            .toString()),
                        Text("The ASIN code of product's review is:"),
                        Text(snapshot.data!.result![index].asin!.original
                            .toString()),
                        Text("The ReviewData of product's review is:"),
                        Text(snapshot.data!.result![index].reviewData
                            .toString()),
                        Text("The Id of product's review is:"),
                        Text(snapshot.data!.result![index].id.toString()),
                        Text("The Name of product's review is:"),
                        Text(snapshot.data!.result![index].name.toString()),
                        Text("The Rating of product's review is:"),
                        Text(snapshot.data!.result![index].rating.toString()),
                        Text("The Title of product's review is:"),
                        Text(snapshot.data!.result![index].title.toString()),
                        Text("The Description of review is:"),
                        Text(snapshot.data!.result![index].review.toString()),
                      ],
                      // Text("The date of product's review is:"),
                      // Text(snapshot.data!.result!.first.date.toString()),
                      // Text("The ASIN code of product's review is:"),
                      // Text(snapshot.data!.result!.first.asin.toString()),
                      // Text("The ReviewData of product's review is:"),
                      // Text(snapshot.data!.result!.first.reviewData.toString()),
                      // Text("The Id of product's review is:"),
                      // Text(snapshot.data!.result!.first.id.toString()),
                      // Text("The Name of product's review is:"),
                      // Text(snapshot.data!.result!.first.name.toString()),
                      // Text("The Rating of product's review is:"),
                      // Text(snapshot.data!.result!.first.rating.toString()),
                      // Text("The Title of product's review is:"),
                      // Text(snapshot.data!.result!.first.title.toString()),
                    );
                  },
                ),
              );
              // return ListView.builder(
              //   itemCount: snapshot.data!.result!.length,
              //   itemBuilder: (context, index) {
              //     return Column(
              //       children: [

              //       ],
              //     );
              //   },
              // );
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
