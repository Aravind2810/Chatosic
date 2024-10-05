import 'package:chatosic/welcome2page/searchpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import 'callscreen.dart';
import 'musicpage.dart';

class Callpage extends StatefulWidget {
  Callpage({super.key});

  @override
  State<Callpage> createState() => _CallpageState();
}

class _CallpageState extends State<Callpage> {
  final textController = TextEditingController();

  List<dynamic>musics=[];

  final List<Widget> _navigationItem = [
    const FaIcon(
      FontAwesomeIcons.noteSticky,
      color: Colors.black,
    ),
    const Icon(
      Icons.music_note,
      color: Colors.black,
    ),
    const Icon(
      Icons.phone,
      color: Colors.black,
    ),
  ];


  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);



  // create a new one

  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            //create button
            MaterialButton(
                onPressed: () {
                  //pop dialog box
                  Navigator.pop(context);
                },
                child: const Text(
                  "Create"
                ),
            ),
          ],
        ),
    );
  }

  // Choose Sim

  void chooseSim() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text(
                "Sim 1"
            ),
          ),
          MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);
              },
            child: const Text(
                "Sim 2",
            ),
          )
        ],
      ),
    );
  }

  // New Operation

  final _firestore = FirebaseFirestore.instance;
  final _uuid = Uuid();

  RTCPeerConnection? _peerConnection;
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  Future<void> createOffer(String callerId, String receiverId) async {
    var callId = _uuid.v4();

    // Set up peer connection.
    _peerConnection = await createPeerConnection({  });
    _peerConnection?.onIceCandidate = (candidate) {
      // Send ICE candidates to Firestore.
      _firestore.collection('calls').doc(callId).set({
        'callerId': callerId,
        'receiverId': receiverId,
        'offer': {'type': 'offer', 'sdp': candidate.toString()}
      });
    };

    // Create offer SDP
    RTCSessionDescription offer = await _peerConnection!.createOffer();
    await _peerConnection!.setLocalDescription(offer);

    // Save offer SDP in Firestore

    await _firestore.collection('calls').doc(callId).set({
      'offer': {'type': 'offer', 'sdp': offer.sdp},
      'callerId': callerId,
      'receiverId': receiverId,
    });
  }

  Future<void> createAnswer(String callId) async {
    var callData = await _firestore.collection('calls').doc(callId).get();

    // Set up peer connection.
    _peerConnection = await createPeerConnection({});
    _peerConnection?.onIceCandidate = (candidate) {
      // Send ICE candidates to Firestore.
      _firestore.collection('calls').doc(callId).update({
        'answer': {'type': 'answer', 'sdp': candidate.toString()}
      });
    };

    // Set remote description.
    await _peerConnection?.setRemoteDescription(
      RTCSessionDescription(callData['offer']['sdp'], 'offer'),
    );

    // Create answer SDP.
    RTCSessionDescription answer = await _peerConnection!.createAnswer();
    await _peerConnection!.setLocalDescription(answer);

    // Save answer SDP in Firestore.
    await _firestore.collection('calls').doc(callId).update({
      'answer': {'type': 'answer', 'sdp': answer.sdp},
    });
  }

  // End call and dispose of resources.
  void endCall() {
    _peerConnection?.close();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  @override
  void initState() {
    super.initState();
    _localRenderer.initialize();
    _remoteRenderer.initialize();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }


  void makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }


  final TextEditingController _controller = TextEditingController();

  // Method to launch the phone dialer with the entered number

  _makePhoneCall(String phoneNumber) async {

    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunch(callUri.toString())) {
      await launch(callUri.toString());
    }
    else {
      throw 'Could not launch $phoneNumber';
    }

  }

  // Access Contact Command Code

  List<Contact> _contacts = [];


  Future<void> _getContacts() async {
    // Request contact permission
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // Fetch contacts
      List<Contact> contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        _contacts = contacts;
      });
    } else {
      // Show permission denied message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contacts permission denied')),
      );
    }
  }

  // Request contact permission
  Future<PermissionStatus> _getContactPermission() async {
    final status = await Permission.contacts.status;
    if (status != PermissionStatus.granted) {
      final result = await Permission.contacts.request();
      return result;
    }
    return status;
  }

  // End Access Contact Code



  @override
  Widget build(BuildContext context) {
    return

    ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (
            (_, mode, __){

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: mode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),

                  home: Scaffold(

                    // App Bar

                    appBar: AppBar(

                      // Title Card

                      title: const Text(
                        "Call Log",
                        style: TextStyle(
                          fontFamily: "KaushanScript",
                        ),
                      ),

                      // Leading Icon

                      leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Musicpage(),
                              ),
                            );
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft
                          ),
                      ),

                      backgroundColor: Colors.transparent,

                    ),

                    extendBodyBehindAppBar: true,

                    // Main Page

                    body: Stack(
                      children: [

                        Container(

                          decoration: BoxDecoration(

                            gradient: LinearGradient(
                              colors: [
                                Color(0xff990011).withOpacity(0.5),
                                Colors.white24,
                                Color(0xffFCF6F5),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),

                          ),

                        ),

                        // Positioned(
                        //   bottom: -150,
                        //   right: 160,
                        //   child: CircleDesign(
                        //     diameter: 350,
                        //     colors: [
                        //       Color(0xffFCF6F5).withOpacity(0.2),
                        //       Color(0xff990011).withOpacity(0.2)
                        //     ],
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),

                          child: Column(
                            mainAxisAlignment : MainAxisAlignment.start,
                            children: [

                              SizedBox(
                                height: 100,
                              ),

                              Text(
                                'Enter the Phone Number',
                                style: TextStyle(
                                  fontFamily: "Lora",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),

                              SizedBox(
                                  height: 20
                              ),

                              // Enter text field

                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),

                                  child: TextField(
                                    controller: _controller,
                                    keyboardType: TextInputType.phone,

                                    style: TextStyle(
                                      color: Colors.black,
                                    ),

                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',

                                      labelStyle: TextStyle(
                                          fontFamily: "Lora",
                                          fontWeight: FontWeight.bold
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blueGrey,
                                              width: 2.0
                                          ),
                                          borderRadius: BorderRadius.circular(20)
                                      ),

                                    ),

                                  ),

                                ),
                              ),

                              // Add some creative elements, e.g., a floating phone icon or background design

                              // OR line

                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10),

                                  child: Text(
                                    "---------- OR ----------",
                                    style: TextStyle(
                                        fontFamily: "Lora"
                                    ),
                                  ),

                                ),
                              ),

                              Container(

                                child: Column(
                                  children: [

                                    // Floating Button

                                    Container(

                                      width: 150,
                                      height: 50,

                                      child: FloatingActionButton(
                                        onPressed: _getContacts,

                                        child: Text(
                                          "Access Contacts",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                      ),

                                    ),

                                    // Contact Container

                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),

                                        child: Card(

                                          color: Colors.transparent,

                                          child: Container(

                                            padding: EdgeInsets.only(top: 10),

                                            width: MediaQuery.of(context).size.width,
                                            height: 245,

                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(20),
                                            ),


                                            child: SingleChildScrollView(

                                              child: _contacts.isEmpty
                                                  ? Center(
                                                child: Text(
                                                  'No contacts found',
                                                  style: TextStyle(
                                                    fontFamily: "Lora",
                                                  ),
                                                ),
                                              )

                                                  : ListView.builder(

                                                itemCount: _contacts.length,
                                                itemBuilder: (context, index) {
                                                  Contact contact = _contacts[index];

                                                  return ListTile(

                                                    title: Text(
                                                      contact.displayName ?? 'No Name',
                                                      style: TextStyle(
                                                        fontFamily: "Lora",
                                                      ),
                                                    ),

                                                    subtitle: Text(
                                                      contact.phones!.isNotEmpty
                                                          ? contact.phones!.first.value ?? 'No Phone'
                                                          : 'No Phone',
                                                      style: TextStyle(
                                                        fontFamily: "Lora",
                                                      ),
                                                    ),

                                                    leading: (
                                                        contact.avatar != null && contact.avatar!.isNotEmpty
                                                    )
                                                        ? CircleAvatar(
                                                      backgroundImage: MemoryImage(contact.avatar!),
                                                    )

                                                        : CircleAvatar(child: Icon(Icons.person)),
                                                  );

                                                },

                                              ),

                                            ),

                                          ),

                                        ),

                                      ),
                                    ),

                                  ],
                                ),

                              ),

                            ],
                          ),

                        ),

                      ],
                    ),

                  // Floating Action Button

                    floatingActionButton: FloatingActionButton(

                      backgroundColor: Colors.white,

                      child: Icon(
                        Icons.add_ic_call_rounded,
                      ),

                      onPressed: () {
                        String phoneNumber = _controller.text.trim();
                        if (phoneNumber.isNotEmpty) {
                          _makePhoneCall(phoneNumber);
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Please enter a valid number!'
                              ),
                            ),
                          );
                        }
                      },

                    ),

                    // Bottom Navigation Bar

                    extendBody: true,

                    // bottomNavigationBar: Container(
                    //
                    //   decoration: BoxDecoration(
                    //
                    //     border: Border(
                    //       top: BorderSide(
                    //         color: Colors.black
                    //       )
                    //     ),
                    //
                    //     color: Colors.transparent
                    //
                    //     // gradient: LinearGradient(
                    //     //   colors: [
                    //     //     Color(0xff990011).withOpacity(0.5),
                    //     //     Colors.white24,
                    //     //     Color(0xff990011),
                    //     //   ],
                    //     //   begin: Alignment.topRight,
                    //     //   end: Alignment.bottomLeft,
                    //     // ),
                    //
                    //   ),
                    //
                    //   child: CurvedNavigationBar(
                    //     items: _navigationItem,
                    //     index: 2,
                    //     height: 50,
                    //     color: Colors.transparent,
                    //     backgroundColor: Colors.transparent,
                    //     animationCurve: Curves.fastOutSlowIn,
                    //     animationDuration: Duration(
                    //       milliseconds: 600,
                    //     ),
                    //
                    //     onTap: (index) {
                    //       if(index == 0){
                    //
                    //         Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //               builder: (context) => const Searchpage(),
                    //             )
                    //         );
                    //       }else if(index == 1){
                    //         Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //               builder: (context) => const Musicpage(),
                    //             )
                    //         );
                    //       }else if(index == 2){
                    //         Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //               builder: (context) => Callpage(),
                    //             )
                    //         );
                    //       }
                    //       setState(() {
                    //
                    //       });
                    //     },
                    //
                    //   ),
                    //
                    // ),

                  ),

              );

            }

        ),

    );

  }

}

class CircleDesign extends StatelessWidget {
  final double diameter;
  final List<Color> colors;

  CircleDesign({required this.diameter, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: colors,
        ),
      ),
    );
  }
}