//
//  ViewController.m
//  ChatApp
//
//  Created by - on 29/06/16.
//  Copyright © 2016 -. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"

@interface ViewController ()

@end

@implementation ViewController

    MessageModel *model;

-(void)didRefreshMessages{
    [self.mTableView reloadData];
}
- (IBAction)sendClicked:(id)sender {
    
    if(self.textField.text.length > 0){
        [self sendMessage:self.textField.text];
        self.textField.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    model = [MessageModel new];
    model.delegate = self;
    

}

- (void)sendMessage:(NSString*)mesg;
{
    [model sendMessage:mesg success:^(NSArray *mesgs) {
        [self.mTableView reloadData];

    } failure:^(NSString *err) {
        NSLog(@"%@",err);

    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [model numberOfMessages];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    
    cell.textLabel.text = [model contentAtIndex:indexPath.row];
    return cell;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return true;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self moveTextFieldUp];
    return true;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self moveTextFieldDown];
}

-(void)moveTextFieldUp{
    self.textFieldBottomContraint.constant = 230;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

-(void)moveTextFieldDown{
    self.textFieldBottomContraint.constant = 0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
