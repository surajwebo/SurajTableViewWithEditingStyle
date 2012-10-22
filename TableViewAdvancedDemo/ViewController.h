//
//  ViewController.h
//  TableViewAdvancedDemo
//
//  Created by Suraj Mirajkar on 22/10/12.
//  Copyright (c) 2012 suraj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}
@property (retain, nonatomic) IBOutlet UITableView *tableViewForScreen;
@property (retain, nonatomic) NSMutableArray *arrayForTableContent;

@end
