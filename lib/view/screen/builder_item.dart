
import 'package:flutter/material.dart';

import '../widgets/default_text.dart';

class BuilderIem extends StatelessWidget {
  Map data;
   BuilderIem({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(data['urlToImage'])
        ),
      ),
      child:Column(
        children: [
          DefaultText(text: data['title'],),
          SizedBox(height: 20,),
          DefaultText(text: data['description'],
          maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ) ,
    );
  }
}


Widget ListItem (List listData){
  return  ListView.separated(
      separatorBuilder: (context,index)=> SizedBox(height: 20,),
      itemCount: listData.length,
    itemBuilder: (context,index){
      BuilderIem(data: listData[index],);
    },

  );
}