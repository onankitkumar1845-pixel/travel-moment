import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const TravelMomentApp());

class TravelMomentApp extends StatelessWidget {
  const TravelMomentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Moment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class Place {
  final String id, category, image, hindiName, englishName;
  final String hindiIntro, englishIntro, hindiHistory, englishHistory, hindiTips, englishTips;
  final double? lat, lng;

  const Place({
    required this.id, required this.category, required this.image,
    required this.hindiName, required this.englishName,
    required this.hindiIntro, required this.englishIntro,
    required this.hindiHistory, required this.englishHistory,
    required this.hindiTips, required this.englishTips,
    this.lat, this.lng,
  });
}

const places = <Place>[
  Place(
    id: 'trimbakeshwar', category: 'Temples', image: '🛕',
    hindiName: 'त्र्यंबकेश्वर ज्योतिर्लिंग', englishName: 'Trimbakeshwar Jyotirlinga',
    hindiIntro: 'महाराष्ट्र के नासिक जिले में स्थित भगवान शिव के बारह ज्योतिर्लिंगों में से एक पवित्र तीर्थस्थल।',
    englishIntro: 'A sacred shrine in Nashik district, Maharashtra, and one of the twelve Jyotirlingas of Lord Shiva.',
    hindiHistory: 'परंपरा के अनुसार यह स्थान गोदावरी नदी के उद्गम क्षेत्र ब्रह्मगिरि पर्वत के निकट है। मंदिर की स्थापत्य शैली और धार्मिक परंपराएँ इसे विशेष बनाती हैं।',
    englishHistory: 'Tradition connects this shrine with the Brahmagiri hills, near the source region of the Godavari River. Its architecture and living traditions make it an important pilgrimage destination.',
    hindiTips: 'दर्शन से पहले मंदिर के वर्तमान समय और नियमों की पुष्टि करें। भीड़ वाले दिनों में अतिरिक्त समय रखें। आसपास कुशावर्त कुंड और ब्रह्मगिरि क्षेत्र भी प्रसिद्ध हैं।',
    englishTips: 'Check current temple timings and entry rules before visiting. Allow extra time on busy days. Kushavarta Kund and the Brahmagiri area are nearby attractions.',
    lat: 19.9428, lng: 73.5305,
  ),
  Place(
    id: 'bhimashankar', category: 'Temples', image: '🙏',
    hindiName: 'भीमाशंकर ज्योतिर्लिंग', englishName: 'Bhimashankar Jyotirlinga',
    hindiIntro: 'महाराष्ट्र के सह्याद्रि पर्वत क्षेत्र में स्थित प्रसिद्ध शिव तीर्थ और प्राकृतिक सुंदरता से घिरा स्थान।',
    englishIntro: 'A renowned Shiva pilgrimage site in the Sahyadri hills of Maharashtra, surrounded by natural beauty.',
    hindiHistory: 'भीमाशंकर बारह ज्योतिर्लिंगों में गिना जाता है। यह क्षेत्र घने जंगलों, पहाड़ी रास्तों और जैव विविधता के लिए भी जाना जाता है।',
    englishHistory: 'Bhimashankar is counted among the twelve Jyotirlingas. The surrounding region is also known for forests, hill routes and biodiversity.',
    hindiTips: 'मानसून में रास्तों की स्थिति जाँचें। आरामदायक जूते और पानी साथ रखें।',
    englishTips: 'Check road and trail conditions during monsoon. Wear comfortable shoes and carry water.',
    lat: 19.0728, lng: 73.5354,
  ),
  Place(
    id: 'dwarka', category: 'Heritage', image: '🏰',
    hindiName: 'द्वारका', englishName: 'Dwarka',
    hindiIntro: 'गुजरात के समुद्र तट पर बसा प्रसिद्ध धार्मिक और ऐतिहासिक नगर, जो भगवान कृष्ण से जुड़ा है।',
    englishIntro: 'A celebrated coastal pilgrimage and heritage town in Gujarat associated with Lord Krishna.',
    hindiHistory: 'द्वारका हिंदू परंपरा के चार धामों में से एक है। द्वारकाधीश मंदिर इस नगर का प्रमुख आकर्षण है।',
    englishHistory: 'Dwarka is one of the Char Dham pilgrimage destinations in Hindu tradition. The Dwarkadhish Temple is its best-known landmark.',
    hindiTips: 'मंदिर के दर्शन समय पहले जाँचें। समुद्र तट पर स्थानीय सुरक्षा निर्देशों का पालन करें।',
    englishTips: 'Check temple darshan hours in advance and follow local safety guidance near the coast.',
    lat: 22.2442, lng: 68.9685,
  ),
  Place(
    id: 'harishchandragad', category: 'Nature', image: '⛰️',
    hindiName: 'हरिश्चंद्रगढ़', englishName: 'Harishchandragad',
    hindiIntro: 'महाराष्ट्र का प्रसिद्ध पहाड़ी किला और ट्रेकिंग स्थल, जो अपने कोकणकड़ा दृश्य के लिए जाना जाता है।',
    englishIntro: 'A famous hill fort and trekking destination in Maharashtra, known for the dramatic Konkan Kada cliff.',
    hindiHistory: 'हरिश्चंद्रगढ़ का ऐतिहासिक महत्व है और इसके परिसर में प्राचीन गुफाएँ तथा मंदिर मौजूद हैं।',
    englishHistory: 'Harishchandragad has historical significance, with ancient caves and temples across the fort complex.',
    hindiTips: 'यह कठिन ट्रेक हो सकता है। मौसम, मार्ग, गाइड और वापसी की योजना पहले तय करें।',
    englishTips: 'This can be a challenging trek. Plan the route, weather, guide and return journey in advance.',
    lat: 19.3889, lng: 73.7780,
  ),
  Place(
    id: 'pavagadh', category: 'Nature', image: '🌄',
    hindiName: 'पावागढ़', englishName: 'Pavagadh',
    hindiIntro: 'गुजरात की चंपानेर-पावागढ़ पहाड़ी पर स्थित प्रसिद्ध तीर्थ और विरासत स्थल।',
    englishIntro: 'A well-known pilgrimage and heritage destination in Gujarat, set on the Champaner-Pavagadh hill.',
    hindiHistory: 'यह क्षेत्र चंपानेर-पावागढ़ पुरातात्विक उद्यान का हिस्सा है, जिसे यूनेस्को विश्व धरोहर का दर्जा प्राप्त है।',
    englishHistory: 'The area forms part of the Champaner-Pavagadh Archaeological Park, a UNESCO World Heritage Site.',
    hindiTips: 'रोपवे और मंदिर की चालू स्थिति यात्रा से पहले जाँचें। गर्मी में पानी साथ रखें।',
    englishTips: 'Check ropeway and temple operations before travelling. Carry water in hot weather.',
    lat: 22.4850, lng: 73.5330,
  ),
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1300), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF6750A4), Color(0xFF168AAD), Color(0xFFFF9F1C)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: const SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.travel_explore_rounded, size: 94, color: Colors.white),
          SizedBox(height: 18),
          Text('TRAVEL MOMENT', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 1.4)),
          SizedBox(height: 8),
          Text('Know Before You Explore', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 34),
          SizedBox(width: 26, height: 26, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5)),
        ],
      )),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final search = TextEditingController();
  bool hindi = true;
  String locationMessage = '';
  final Set<String> saved = {};

  String t(String hi, String en) => hindi ? hi : en;
  List<Place> get filtered => places.where((p) {
    final q = search.text.toLowerCase().trim();
    if (q.isEmpty) return true;
    return p.hindiName.toLowerCase().contains(q) || p.englishName.toLowerCase().contains(q) ||
      p.hindiIntro.toLowerCase().contains(q) || p.englishIntro.toLowerCase().contains(q);
  }).toList();

  Future<void> findNearby() async {
    setState(() => locationMessage = t('लोकेशन जाँची जा रही है…', 'Checking location…'));
    try {
      bool enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) throw Exception(t('फोन की Location चालू करें।', 'Please turn on phone location.'));
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        throw Exception(t('Location permission नहीं मिली।', 'Location permission was not granted.'));
      }
      final pos = await Geolocator.getCurrentPosition();
      setState(() => locationMessage = '${t('आपकी लोकेशन', 'Your location')}: ${pos.latitude.toStringAsFixed(4)}, ${pos.longitude.toStringAsFixed(4)}\n${t('अभी आसपास की जगहों का पूरा डेटा सीमित है।', 'Nearby place matching will improve as the place database grows.')}');
    } catch (e) {
      setState(() => locationMessage = e.toString().replaceFirst('Exception: ', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Icon(Icons.travel_explore_rounded, color: Color(0xFF6750A4)),
          SizedBox(width: 8),
          Text('Travel Moment', style: TextStyle(fontWeight: FontWeight.w900)),
        ]),
        actions: [
          TextButton(onPressed: () => setState(() => hindi = !hindi), child: Text(hindi ? 'हिंदी | EN' : 'EN | हिंदी')),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(colors: [Color(0xFF6750A4), Color(0xFF168AAD), Color(0xFFFF9F1C)]),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t('अपनी अगली यादगार यात्रा खोजें', 'Discover your next memorable trip'), style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(t('जगहें जानें, कहानियाँ सुनें और घूमने निकलें।', 'Explore places, discover stories and go explore.'), style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 18),
              TextField(
                controller: search,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: t('किसी जगह को खोजें…', 'Search any place…'),
                  prefixIcon: const Icon(Icons.search),
                  filled: true, fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: findNearby,
            icon: const Icon(Icons.my_location),
            label: Text(t('मेरे आसपास की जगहें खोजें', 'Explore nearby places')),
            style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          ),
          if (locationMessage.isNotEmpty) Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)), child: Text(locationMessage)),
          ),
          const SizedBox(height: 22),
          Text(t('श्रेणियाँ', 'Categories'), style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(spacing: 9, runSpacing: 9, children: [
            _category(t('धार्मिक स्थल', 'Temples'), '🛕', const Color(0xFFFFE5C2)),
            _category(t('पहाड़ और ट्रेकिंग', 'Mountains & Trekking'), '⛰️', const Color(0xFFDDF3E4)),
            _category(t('ऐतिहासिक स्थल', 'Historical places'), '🏰', const Color(0xFFE8E1FF)),
            _category(t('प्रकृति', 'Nature'), '🌿', const Color(0xFFDDF2FA)),
          ]),
          const SizedBox(height: 22),
          Text(t('लोकप्रिय जगहें', 'Popular places'), style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...filtered.map((p) => _placeCard(p)),
          if (filtered.isEmpty) Padding(
            padding: const EdgeInsets.all(24),
            child: Text(t('कोई जगह नहीं मिली। दूसरा नाम खोजें।', 'No place found. Try another name.')),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), label: t('होम', 'Home')),
          NavigationDestination(icon: const Icon(Icons.search), label: t('खोजें', 'Search')),
          NavigationDestination(icon: const Icon(Icons.map_outlined), label: t('मैप', 'Map')),
          NavigationDestination(icon: const Icon(Icons.bookmark_border), label: t('सेव', 'Saved')),
        ],
      ),
    );
  }

  Widget _category(String label, String emoji, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
    child: Text('$emoji  $label', style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  Widget _placeCard(Place p) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      leading: CircleAvatar(radius: 25, backgroundColor: const Color(0xFFF0ECFA), child: Text(p.image, style: const TextStyle(fontSize: 23))),
      title: Text(hindi ? p.hindiName : p.englishName, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(hindi ? p.hindiIntro : p.englishIntro, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Icon(saved.contains(p.id) ? Icons.bookmark : Icons.chevron_right, color: const Color(0xFF6750A4)),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: p, hindi: hindi, onSave: () {
        setState(() => saved.add(p.id));
      }, isSaved: saved.contains(p.id))),
    ),
  );
}

class PlaceDetailScreen extends StatelessWidget {
  final Place place;
  final bool hindi, isSaved;
  final VoidCallback onSave;
  const PlaceDetailScreen({super.key, required this.place, required this.hindi, required this.onSave, required this.isSaved});

  @override
  Widget build(BuildContext context) {
    final title = hindi ? place.hindiName : place.englishName;
    final intro = hindi ? place.hindiIntro : place.englishIntro;
    final history = hindi ? place.hindiHistory : place.englishHistory;
    final tips = hindi ? place.hindiTips : place.englishTips;
    return Scaffold(
      appBar: AppBar(title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis)),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Container(height: 150, decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(colors: [Color(0xFF6750A4), Color(0xFF168AAD), Color(0xFFFF9F1C)]),
        ), child: Center(child: Text(place.image, style: const TextStyle(fontSize: 72)))),
        const SizedBox(height: 18),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(intro, style: const TextStyle(fontSize: 16, height: 1.5)),
        const SizedBox(height: 20),
        _section(hindi ? 'इतिहास और कहानी' : 'History & Story', history, Icons.auto_stories),
        _section(hindi ? 'यात्रा से पहले जानें' : 'Before You Visit', tips, Icons.lightbulb_outline),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: isSaved ? null : onSave,
          icon: const Icon(Icons.bookmark_add_outlined),
          label: Text(hindi ? (isSaved ? 'सेव किया गया' : 'पसंदीदा में सेव करें') : (isSaved ? 'Saved' : 'Save to favourites')),
        ),
        if (place.lat != null && place.lng != null) OutlinedButton.icon(
          onPressed: () async {
            final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=${place.lat},${place.lng}');
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          },
          icon: const Icon(Icons.directions),
          label: Text(hindi ? 'मैप में देखें' : 'View on map'),
        ),
        const SizedBox(height: 12),
        Text(hindi
          ? 'नोट: यात्रा से पहले समय, प्रवेश नियम और स्थानीय जानकारी आधिकारिक स्रोत से जाँचें।'
          : 'Note: Verify timings, entry rules and local details with official sources before travelling.',
          style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ]),
    );
  }

  Widget _section(String title, String body, IconData icon) => Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Icon(icon, color: const Color(0xFF6750A4)), const SizedBox(width: 8), Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),
      const SizedBox(height: 9),
      Text(body, style: const TextStyle(fontSize: 15, height: 1.5)),
    ]),
  );
}
