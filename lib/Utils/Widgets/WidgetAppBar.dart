import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';

final TextEditingController searchController = TextEditingController();

PreferredSize appBar = customAppBar(
  title: '',
  //icon1: Icons.search,
  // icon2: Icons.icon2,
  // avatar: Avatar(),
  searchController: searchController,
  onSearch: (String value) {
    // Lógica de pesquisa aqui
    /// searchEvents(value);
  },
);

PreferredSize customAppBar({
  String? title,
  IconData? icon1,
  IconData? icon2,
  Widget? avatar,
  TextEditingController? searchController,
  Function(String)? onSearch,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: preto_forte,
      elevation: 0,
      flexibleSpace: avatar,
      title: Text(
        title!,
        style: TextStyle(
          color: branco,
          fontWeight: FontWeight.bold,
          fontFamily: "HelveticaNeue",
          fontSize: 15,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            icon1,
            color: branco,
            size: 18,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            icon2,
            color: branco,
            size: 18,
          ),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(
              color: branco,
              fontWeight: FontWeight.bold,
            ),
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Pesquisar eventos',
              hintStyle: TextStyle(
                color: Colors.white70,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white24,
            ),
            onSubmitted: onSearch,
          ),
        ),
      ),
    ),
  );
}
