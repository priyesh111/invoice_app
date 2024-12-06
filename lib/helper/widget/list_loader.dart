import 'package:flutter/material.dart';
import 'package:invoice_app/helper/widget/loader.dart';
import 'package:invoice_app/helper/widget/widget_utils.dart';

Widget ListLoader(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 15),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Loaders(
          items: 10,
          direction: LoaderDirection.ltr,
          builder: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 4),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            6)),
                    title: Container(
                        width: 20,
                        height: 5,
                        color: Colors.grey),
                    subtitle: Container(
                        width: 20,
                        height: 5,
                        color: Colors.grey),
                    tileColor:
                    Colors.grey.shade100,
                    leading: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget NoDataWidget(){
  return ListView(
    children: [
      Padding(
        padding: EdgeInsets.only(
            top: 250),
        child:
        // Center(child: Text("No Data Found")),
        Center(child: getCustomFont("No Data Found", 16, Colors.black, 1)),
      )
    ],
  );
}