import 'package:flutter/material.dart';
import 'package:gs_oceans/models/cleanup_solution_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.item,
  });

  final CleanupSolution item;

  Color getColor(item){
    if(item.status == CleanupStatus.inOperation ){
      return Colors.green;
    }else if(item.status == CleanupStatus.harvesting ){

      return Colors.blue;
    }
    return Colors.red;
  } 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.since),
      leading: Image.asset('images/${item.image}'),
      trailing: Text(
        item.statusDescription,
         style: TextStyle(
          color: getColor(item),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed('/second', arguments: item);
      },
    );
  }
}
