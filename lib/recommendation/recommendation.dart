import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  var client = new http.Client();
  List<dynamic> recItems = [];

  List<dynamic> location = [
    "Sathdobato",
    "Kathmandu",
    "Bhanimandal",
    "Hattiban",
    "Chabel",
    "Khichpokhari",
    "Maitighar",
    "Maitidevi",
    "Sinamangal",
    "Kumaripati",
    "Lagankhel",
    "Chakrapth",
    "Dumbarai",
    "Gokarna"
  ];

  List<dynamic> categories = [
    "Flat",
    "Single Room",
    "Four rooms",
    "2 Rooms",
    "Full furnished",
    "All facilities",
    "Large Rooms",
    "Small Rooms",
    "Mid Sized",
    "3 Rooms",
    "Hostel",
    "Master room",
    "House"
  ];
  List<dynamic> images = [
    "https://pix10.agoda.net/hotelImages/209/2092140/2092140_17031512040051555216.jpg",
    "https://pix10.agoda.net/hotelImages/4656079/-1/f7771c6afc7cc32401286116a7eed6f0.jpg",
    "https://cf.bstatic.com/images/hotel/max1024x768/238/238751575.jpg",
    "https://cf.bstatic.com/images/hotel/max1024x768/213/213503501.jpg",
    "https://images.oyoroomscdn.com/uploads/hotel_image/81612/f0af88ee7aca453a.jpg",
    "https://alphabet.ge/126/budget-double-or-twin-room.jpg",
    "https://galaincha.com.np/files/room-view/img/Lines%202%20in%20Room%202.jpg",
    "https://www.balthalihomestay.com/uploads/room/double-bed-room.jpeg",
    "https://cdn.styleblueprint.com/wp-content/uploads/2015/12/SB-ATL-ZookHome-9-e1538165814448.jpg",
    "https://cf.bstatic.com/images/hotel/max1024x768/224/224590211.jpg",
  ];

  List<dynamic> imageTwo = [
    "https://cf.bstatic.com/images/hotel/max1024x768/224/224590211.jpg",
    "https://pix10.agoda.net/hotelImages/209/2092140/2092140_17031512040051555216.jpg",
    "https://pix10.agoda.net/hotelImages/4656079/-1/f7771c6afc7cc32401286116a7eed6f0.jpg",
    "https://cf.bstatic.com/images/hotel/max1024x768/238/238751575.jpg",
    "https://cf.bstatic.com/images/hotel/max1024x768/213/213503501.jpg",
    "https://images.oyoroomscdn.com/uploads/hotel_image/81612/f0af88ee7aca453a.jpg",
    "https://palmbeach.gr/wp-content/uploads/27f3765c3871cd5fe52f88f31dfe2c89.jpg",
    "https://media.architecturaldigest.com/photos/560c37dd7da26e3235ad995e/16:9/w_1280,c_limit/gray-living-room-01.jpg",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/decorating-with-antiques-peter-dunham-living-room-1582736365.png",
    "https://alphabet.ge/126/budget-double-or-twin-room.jpg",
    "https://galaincha.com.np/files/room-view/img/Lines%202%20in%20Room%202.jpg",
    "https://www.balthalihomestay.com/uploads/room/double-bed-room.jpeg",
    "https://cdn.styleblueprint.com/wp-content/uploads/2015/12/SB-ATL-ZookHome-9-e1538165814448.jpg",
  ];

  // use this to post attendee while scanning batch if there is no questions in the event
  postAttendeeEmail() async {
    try {
      final response = await client.post(
          "http://f3920ad96659.ngrok.io/estaiho/default/call/json/get_recommendations",
          body: jsonEncode({
            "watched_movies": {
              "1307": {
                "movieId": 1307,
                "title": "Oblivion (2013)",
                "genres": "Comedy|Romance",
                "poster": "True",
                "rating": 5
              }
            }
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      final body = jsonDecode(response.body);
      print("post Check in answer response $body");
      if (response.statusCode == 200) {
        //  return body;
        return recItems = body;
      }
      // Fluttertoast.showToast(msg: body.toString());
      print(recItems);
      return null;
    } catch (e) {
      print("Exception while posting checkin answer $e");
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    postAttendeeEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Okay"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (x, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 2),
                          child: SizedBox(
                            width: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                recItems[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 2),
                          child: Container(
                            width: 200,
                            child: Text("Categories: ${categories[index]}"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 2),
                          child: Container(
                            width: 200,
                            child: Text("Location: ${location[index]}"),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: imageTwo.length,
                itemBuilder: (x, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          child: Image.network(
                            imageTwo[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 2),
                          child: SizedBox(
                            width: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                recItems[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 2),
                          child: Container(
                            width: 200,
                            child: Text("Categories: ${categories[index]}"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 2),
                          child: Container(
                            width: 200,
                            child: Text("Location: ${location[index]}"),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
