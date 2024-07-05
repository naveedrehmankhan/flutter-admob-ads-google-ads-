import 'package:ads/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void main(){
    runApp(MyApp());
  }

  @override
  void initState() {
    super.initState();
    initBannerAd();
  }
  @override
  void dispose() {
    // Dispose of the banner ad when no longer needed
    bannerAd.dispose();
    initBannerAd();
    super.dispose();
  }
late BannerAd bannerAd;
bool isAdLoaded = false;

var addUnit="ca-app-pub-3940256099942544/6300978111";

initBannerAd(){
bannerAd = BannerAd(
 size:AdSize.largeBanner,
 adUnitId: addUnit,
 listener: BannerAdListener(
  onAdLoaded: (ad){
    setState(() {
      isAdLoaded=true;
    });
  },
  onAdFailedToLoad: (ad, error){
    ad.dispose();
    print("error h ustad");
  }
 ),
 request: AdRequest(),
);
bannerAd.load();

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Ads ...."),),
    body: Center(
      child: Column(children: [
        isAdLoaded?SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd,),
      ): SizedBox(),

      ],),
    )
    );
  }
}

