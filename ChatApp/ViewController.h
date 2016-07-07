
//
//  ViewController.h
//  ChatApp
//
//  Created by - on 29/06/16.
//  Copyright © 2016 -. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate,MessageModelDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomContraint;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

