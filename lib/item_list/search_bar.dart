import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_viewer/api_service.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value){
GetIt.instance.get<ApiService>().setSearchTerm(value);
      },
    );
  }
}
