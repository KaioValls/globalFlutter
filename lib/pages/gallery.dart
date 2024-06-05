import 'dart:ui';

import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  final List<String> images;
  const Gallery({super.key, required this.images});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // Lista de imagens
  late final List<String> list;
  // Página atual do PageView (começa em 0)
  int currentPage = 0;

  @override
  void initState() {
    list = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: PageView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Image.asset('images/${list[index]}');
                },
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
            ),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              widget.images.map((image) {
               int index = widget.images.indexOf(image);
               return _buildIndicator(index == currentPage);
            }).toList()
          
          )
        ],
      ),
    );  
  }

// Método para construir o indicador
  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: getColor(isActive),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  getColor(bool isActive){
    return isActive? Colors.white : Colors.white24;
  }
}

