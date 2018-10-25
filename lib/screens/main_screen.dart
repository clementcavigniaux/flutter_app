import 'package:flutter/material.dart';

import 'package:flutter_redux_boilerplate/presentation/platform_adaptive.dart';
import 'package:flutter_redux_boilerplate/styles/texts.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/products_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/order_list_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/categories_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_tabs/order_tab.dart';
import 'package:flutter_redux_boilerplate/screens/main_drawer.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => new MainScreenState();

}
class MainScreenState extends State<MainScreen> {
    
    PageController _tabController;
    String _title;
    int _index;

    @override
    void initState() {
        super.initState();
        _tabController = new PageController();
        _title = TabItems[0].title;
        _index = 0;
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            
            appBar: new PlatformAdaptiveAppBar(
                title: new Text(_title),
                platform: Theme.of(context).platform
            ),
            
            bottomNavigationBar: new PlatformAdaptiveBottomBar(
                currentIndex: _index,
                onTap: onTap,
                items: TabItems.map((TabItem item) {
                    return new BottomNavigationBarItem(
                        title: new Text(
                            item.title,
                            style: textStyles['bottom_label'],
                        ),
                        icon: new Icon(item.icon),
                    );
                }).toList(),
            ),

            body: new PageView(
                controller: _tabController,
                onPageChanged: onTabChanged,
                children: <Widget>[
                    new ProductsTab(),
                    new OrderListTab(),
                    new CategoriesTab(),
                    new OrderTab()
                ],
            ),

            drawer: new MainDrawer(),
        );
    }

    void onTap(int tab){
        _tabController.jumpToPage(tab);
    }

    void onTabChanged(int tab) {
        setState((){
            this._index = tab;
        });
        
        this._title = TabItems[tab].title;
    }

}

class TabItem {
    final String title;
    final IconData icon;

    const TabItem({ this.title, this.icon });
}

const List<TabItem> TabItems = const <TabItem>[
    const TabItem(title: 'Products', icon: Icons.assignment),
    const TabItem(title: 'Orders List', icon: Icons.timeline),
    const TabItem(title: 'Categories', icon: Icons.group_work),
    const TabItem(title: 'Orders', icon: Icons.timeline),
];