import 'package:flutter/material.dart';
import 'package:netflix/widget/coming_soon_movie_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text('New & hot', style: TextStyle(color: Colors.white)),
            actions: [
              Icon(Icons.cast, color: Colors.white),
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(color: Colors.blue, height: 27, width: 27),
              ),
              SizedBox(width: 20),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),

              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: "  🍿 Comming soon  "),
                Tab(text: " 🔥 Everyone's watching  "),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovieWidget(
                      imageurl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbx22PMd5qDgXkjUgxNlAC4HTdO66jZdgufg&s',
                      overview:
                          "Stranger Things Season 5 concludes the epic saga with the kids finally defeating Vecna and the Mind Flayer, closing the gates to the Upside Down, and ushering in a bittersweet new era for Hawkins as the original group moves on, passing the torch to the next generation (Holly, etc.), featuring pivotal moments like Will's psychic connection to Vecna, Eleven's full-power return, and a hopeful, happily ever after ending for most main characters, despite some fan criticisms about underdeveloped side plots.",
                      logourl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv8P0F1TrfsH-pWDRhFLj9MA00FEJTro8Kpw&s',
                      month: 'Jan',
                      day: '10',
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageurl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZHLVEsN6rly6Lj2J4uI9tDbk1tfmP5sw8Og&s',
                      overview: "Toxic (2026) is an upcoming Indian gangster action film starring Yash, set in 1980s/90s Goa, about a powerful drug cartel, blending crime with a fairy tale for grown-ups theme, featuring themes of loyalty, betrayal, and gritty action with an international crew. There are other films named Toxic, including a 2024 Lithuanian drama about teen models and a 2022 Korean film about humidifier disinfectant dangers, but the major upcoming release is the Yash film. ",
                      logourl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqcuru-La4crEDSgymLlf1HoBYqSQBAlF1B_H0p1pdUUEG5mXq8KxU8l8pnjQNFeh5v6U&usqp=CAU',
                      month: 'Mar',
                      day: '19',
                    ),
                  ],
                ),
              ),
              ComingSoonMovieWidget(
                imageurl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHzjCdXrmjWroTM3b_geMN8el_BFEqXGPBTg&s',
                overview:
                    "Lost (2004–2010) is a seminal television drama following the survivors of Oceanic Flight 815 after they crash on a mysterious South Pacific island filled with scientific and supernatural phenomena. The series focuses on a large ensemble cast, utilizing flashbacks, flashforwards, and flash-sideways to explore their backstories while they battle for survival against an unknown entity known as The Others and the Island's secrets. Over six seasons, the show blends character-driven drama with science fiction, exploring themes of redemption, fate, and faith. ",
                logourl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNjq56jEFne9mSF_kGkr_e5ukCtQZF5cRQtg&s',
                month: 'Mar',
                day: '03',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
