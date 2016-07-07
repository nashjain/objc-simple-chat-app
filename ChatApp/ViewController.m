//
//  ViewController.m
//  ChatApp
//
//  Created by - on 29/06/16.
//  Copyright © 2016 -. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

 NSMutableArray *tableData;

- (IBAction)sendClicked:(id)sender {
    
    if(self.textField.text.length > 0){
        [self sendMessage:self.textField.text onCompletion:nil];
        self.textField.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    tableData = [NSMutableArray new];
    
    [self reloadMessages];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(reloadMessages) userInfo:nil repeats:true];
    
    [self.mTableView reloadData];
}

//NW layer should be separated

- (void)sendMessage:(NSString*)mesg onCompletion:(void (^)(BOOL success, NSError *error))completion {
    [tableData addObject:mesg];

    NSString *sendUrl = [NSString stringWithFormat:@"http://localhost:4567/send?message=%@",mesg];
    
    NSURL *url = [NSURL URLWithString:sendUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             //Better to separate the parsing logic and create custom message object
             
             NSArray *mesg = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
             
         }
         
         BOOL success = (connectionError == nil);
         
         if (completion) {
             completion(success, connectionError);
         }
         //Error handling
         [self reloadMessages];
     }];
}

//NW layer should be separated

-(void)reloadMessages{
    
    NSString *sendUrl = [NSString stringWithFormat:@"http://localhost:4567/fetchAllMessages"];
    
    NSURL *url = [NSURL URLWithString:sendUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             //Better to separate the parsing logic and create custom message object

             NSArray *mesgs = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:NULL];
             [tableData addObjectsFromArray:mesgs];
             [self.mTableView reloadData];
             
         }
         //Error handling
         [self reloadMessages];
     }];

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableData ? tableData.count: 0;
}

//Every time alloc init Nooooo

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    
    cell.textLabel.text = tableData[indexPath.row];
    
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

- (NSArray *)tableData {

    return tableData;
}

@end
