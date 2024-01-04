import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/style/appstyle.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc['note_title'],),
          const SizedBox(height: 4.5,),
          Text(doc['creation_date'],),
          const SizedBox(height: 4.5,),
          Text(doc['note_content'],),
        ],
      ),
    ),
  );
}