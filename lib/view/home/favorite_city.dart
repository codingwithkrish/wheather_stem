import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/services/local/shared_prefence.dart';

class FavoriteCity extends StatefulWidget {
  const FavoriteCity({super.key});

  @override
  State<FavoriteCity> createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  TextEditingController _cityController = TextEditingController();
  List<String> list = [];
  LocalStoreage _localStoreage = Get.find<LocalStoreage>();

  @override
  void initState() {
    setState(() {
      List<String> alist = _localStoreage.getFavoriteCity();
      log(alist.toString());
      list = alist;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite City'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      setState(() {
                        list.add(_cityController.text);
                        _localStoreage.setFavoriteCity(_cityController.text);
                        _cityController.clear();
                      });
                    },
                    child: Icon(Icons.add)),
                hintText: 'Add Your Favorite City',
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('City Name:- ${list[i]}'),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _localStoreage.removeCity(list[i]);
                                list.removeAt(i);
                              });
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
              itemCount: list.length,
            ))
          ],
        ),
      ),
    );
  }
}
