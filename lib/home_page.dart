import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 모바일 버전에서는 사이즈가 너무작으니깐 새로운 레이아웃을 고려해야 한다.
    // padding 값도 미리 정해주면 좋을 것 같다.
    // 사이즈 값도 미리 정해주면 좋을 것 같고..
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        // 여기서 Stack 이 들어가고
        fit: StackFit.expand, // TODO
        children: [
          BackgroundWidget(width: width), // 전체 백그라운드 화면, Stack 이므로 Row 전체가 화면에 꽉차게 그려진다.
          ShoeWidget(width: width, height: height), // Position 을 이용한 큰 신발
          NikeGreyLogWidget(width: width, height: height), // Position 을 이용한 나이키 회색 로고 (top, width 같이 맞췄다.)
          InfoCardWidget(width: width, height: height), // 도표부분
          Positioned(height: kToolbarHeight, width: width, child: AppBarWidget(width: width),), // 상단 AppBar 메뉴
          //DividerWidget(width: width), // 상단메뉴 밑에 흰줄, 지금은 필요없음. 위의 AppBar 에서 구현했슴.
          NikeTextWidget(height: height, width: width), // 왼쪽 중앙 나이키 문자
          DescriptionWidget(height: height, width: width) // 2019 AirMax 270 문자
        ],
      ),
    );
  }
}

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned( //도표부분
      right: width * 0.15,
      bottom: height * .145,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder( // 둥근 도표.. 너무 맘에 든다.
              borderRadius: BorderRadius.circular(10)
            ),
            clipBehavior: Clip.antiAlias, // for circle or arc
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, // 정렬하기 위해서 중요한 부분
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Air Max",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "270",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                        Text(
                          "\$199",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                  const SizedBox(width: 20), // 공간을 띄우기 위해서 space 를 위해서
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.indigo,
                      ),
                      const SizedBox(height: 7), // 공간을 띄우기 위해서 space 를 위해서
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 7), // 공간을 띄우기 위해서 space 를 위해서
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(height: 7), // 공간을 띄우기 위해서 space 를 위해서
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 7), // 공간을 띄우기 위해서 space 를 위해서
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  primary: Theme.of(context).primaryColorDark, //background color
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColorLight, //text color
                  )
              ),
              onPressed: () {  },
              child: const Text('Order', textScaleFactor: 1.5,),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.6,
      right: width * 0.30,
      child: Container( color: Colors.transparent,
        width: width * 0.12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("2019",
            style: TextStyle(
              color: Colors.white54,
              fontFamily: "",
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),),
            Align(
              alignment: Alignment.center,
              child: Text("Air Max",
                style: TextStyle(
                  color: Colors.white54,
                  fontFamily: "",
                  fontSize: width * 0.032,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text("270",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white54,
                  fontFamily: "",
                  fontSize: width * 0.025,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}

class NikeTextWidget extends StatelessWidget {
  const NikeTextWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.25,
      left: width * 0.1,
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children:  [
            Text("NIKE",
            style: TextStyle(
              color: Colors.white54,
              fontSize: width * 0.1,
              letterSpacing: 10,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),),
            Text("JUST DO IT",
              style: TextStyle(
                color: Colors.white54,
                fontSize: width * 0.05,
                letterSpacing: 10,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      width: width,
      child: const Divider(
        color: Colors.white,
        thickness: 0.5,
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.white, width: 1)),
      elevation: 0.0, // 뒷배경에 그림자 느낌.
      backgroundColor: Colors.transparent, // Colors 에 이런 것도 있었어? 투명?
      //shadowColor: Colors.red, // 이거 완전 대박이다. 마치 투명 시트지 붙인 느낌
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 300), // 최소한의 공간을 확보하기 위함.
            // https://www.fluttercampus.com/guide/60/how-to-set-minimum-and-maximum-height-or-width-of-widget-flutter/
            //color: Colors.green,
            width: width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // 이걸 한이유는 끝에들에도 공간을 주기 위해서
              children: [
                Image.asset(
                  "assets/images/nike_logo.png",
                  width: 80,
                  color: Colors.white,
                ),
                const Text("New Arrivals"),
                const Text("Men"),
                const Text("Women"),
                const Text("Boys"),
                const Text("Girls"),
                GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, "myRoute");
                    showAlertDialog1(context, content: "This site is for the test purpose. \nPlease visit again for more in future", title: "Thank you for visiting");
                  },
                  child: const Text("About SunglimLee", style: TextStyle(color: Colors.black),),
                )
              ],
            ),
          ),
          Container(
            width: width * 0.1,
            constraints: const BoxConstraints(minWidth: 100), // 최소한의 공간을 확보하기 위함.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                // 햄버거 메뉴, Hamburger menu,  3단 메뉴, 삼단 메뉴 menu
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NikeGreyLogWidget extends StatelessWidget {
  const NikeGreyLogWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: width * 0.03,
      top: height * 0.12,
      width: width * 0.15,
      child: Image.asset(
        "assets/images/nike_logo_grey.png",
        fit: BoxFit.cover,
        //width: width * 0.15,
      ),
    );
  }
}

class ShoeWidget extends StatelessWidget {
  const ShoeWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // stack 에선 전부 Position 으로 자리를 잡아서 그림을 그려준다.
      right: width * 0.19,
      top: height * 0.05,
      // stack 에선 전부 Position 으로 자리를 잡아서 그림을 그려준다.
      child: Image.asset(
        "assets/images/shoe.png",
        fit: BoxFit.cover,
        alignment: Alignment.centerLeft,
        width: width * 0.42,
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // 최대치를 가질 수 있다.
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // You need this in Row so that children can take up vertical space.
      mainAxisAlignment: MainAxisAlignment.start,
      // 왼쪽부터 정렬해 나가자ㅣ.
      children: [
        Expanded(
          // 이걸 빼보니깐 그림자체가 안그려지고 에러가 발생하네.
          child: Stack(
            // 또 Stack 이 들어가네..
            fit: StackFit.expand,
            // 자식들이 Stack 에서 전부 확장이 되도록 한다. 여기가 없으면 가로 사이즈만 최대로 먹는다.
            children: [
              Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.cover,
                // 아직도 모르겠다. 이걸 빼면 그냥 이자식이 가질 수 있는 최대 가로값을 채움으로 그림이 들어간다. 확대가 아니지.
                alignment: Alignment.centerLeft,
              ),
              Container(
                width: width * 0.7,
                color: const Color.fromRGBO(0, 105, 233, 0.8),
              ),
            ],
          ),
        ),
        Container(
          width: width * 0.3,
          color: Colors.white,
        )
      ],
    );
  }
}

//AlertDialog 보여주는 함수
showAlertDialog1(BuildContext context,
    {content = "default Content", title = "default title"}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
