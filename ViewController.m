//
//  ViewController.m
//  TestLocalServer
//
//  Created by USI on 10/07/2013.
//  Copyright (c) 2013 USI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webData = [NSMutableData data];
    
    self.fname = [[NSString alloc] init];
    self.lname = [[NSString alloc] init];
    
    self.Done.text = @"Not Done";
    
    self.lastField.delegate = self;
    self.firstField.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if(self.theConnection)
    {
        [self.webData setLength:0];
    }
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.webData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //[self.webData setLength:0];
    NSLog(@"Failed");
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.addReturn = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:self.webData options:0 error:nil]];
    
    self.Done.text = @"Done"; 
}


- (IBAction)addPerson:(id)sender {
    
    if([self.lastField.text isEqualToString:@""] || [self.firstField.text isEqualToString:@""])
    {
        self.Done.text = @"No Names";
        return;
    }
    
    NSString * string = [NSString stringWithFormat:@"http://localhost:8888/test.php?req=add&fname=%@&lname=%@", self.fname, self.lname]; 
    self.theUrl = [NSURL URLWithString:string];
    
    self.myRequest = [NSURLRequest requestWithURL:self.theUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    self.theConnection = [NSURLConnection connectionWithRequest:self.myRequest delegate:self];
    
    
    
    [self.theConnection start];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if(![textField.text isEqualToString:@""])
    {
        if([textField.text isEqualToString:self.firstField.text])
        {
            self.fname = self.firstField.text;
        }
        else
        {
            self.lname = self.lastField.text;
        }
    }
    
    return [textField resignFirstResponder];
}
@end
