import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {
  final tabsRouter;
  const HomeBottom({super.key, this.tabsRouter});

  static const list_menu = <Map>[
    {
      "icon": Icons.home_outlined,
      "text": "Home"
    },
    {
      "icon": Icons.search,
      "text": "Explore"
    },
    {
      "icon": Icons.shopping_cart_outlined,
      "text": "Cart"
    },
    {
      "icon": Icons.local_offer_outlined,
      "text": "Offer"
    },
    {
      "icon": Icons.person_outline,
      "text": "Account"
    }
  ];

  @override
  Widget build(BuildContext context) {

    void changePage (int i)  {
      if (i == 2) {
        print(2);
        _dialogBuilder(context);
        return;
      }
      tabsRouter.setActiveIndex(i); 
    }

    var currentIndex = tabsRouter.activeIndex;

    return Container(
      // height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 221, 221, 221)),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(var i = 0; i < list_menu.length; i++)...[
            Expanded(
              child: InkWell(
                onTap: () => changePage(i),
                child: Column(
                  children: [
                    Icon(
                      list_menu[i]['icon'],
                      size: 24,
                      color: currentIndex == i ? Colors.blue : null,
                    ),
                    Text(
                      list_menu[i]['text'],
                      style: TextStyle(
                        color: currentIndex == i ? Colors.blue : null,
                        fontSize: 12
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]
        ],
      ),
      // child: BottomNavigationBar(
      //   currentIndex: tabsRouter.activeIndex, 
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.blue,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',  
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_outlined),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_offer_outlined),
      //       label: 'Offer',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: 'Account',
      //     ),
      //   ],
      //   onTap: (int index) {
      //     tabsRouter.setActiveIndex(index);          
      //   },
      // ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}