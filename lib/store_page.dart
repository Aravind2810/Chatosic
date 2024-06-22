import 'package:flutter/material.dart';

class Storepage extends StatelessWidget {
  const Storepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.work_history_outlined,color: Colors.orange,),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address : ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("No.12 post office Street \nMalumichampatti city \npin : 600031", style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),)
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.home_repair_service,color: Colors.orange,),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Branch : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("neelangarai, \nezhampakkam, madukarai", style: TextStyle(fontSize: 15,color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.person,color: Colors.orange,),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("No Members : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("50",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),)
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.workspace_premium,color: Colors.orange,),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Premium Member : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("10",style: TextStyle(fontSize: 15,color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            // colorText("are you want to change a password  ?", Colors.orange.shade100),
            TextButton(
                onPressed: (){},
                child: const Text("Click here")
            )
          ],
        ),
      ),
    );
  }
}

