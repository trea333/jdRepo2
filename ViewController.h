//
//  ViewController.h
//  TestLocalServer
//
//  Created by USI on 10/07/2013.
//  Copyright (c) 2013 USI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableData *webData;

@property (nonatomic, strong) NSURL * theUrl;

@property (nonatomic, strong) NSURLRequest * myRequest;

@property (strong, nonatomic) NSURLConnection * theConnection;

@property (strong, nonatomic) NSString *fname;

@property (strong, nonatomic) NSString *lname;

@property (strong, nonatomic) NSDictionary * addReturn;

- (IBAction)addPerson:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *firstField;

@property (strong, nonatomic) IBOutlet UITextField *lastField;


@property (strong, nonatomic) IBOutlet UILabel * Done;


@end
