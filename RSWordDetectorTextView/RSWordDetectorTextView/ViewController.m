//
//  ViewController.m
//  RSWordDetectorTextView
//
//  Created by Rushi Sangani on 12/06/16.
//  Copyright © 2016 Rushi Sangani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <RSWordDetectorDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.wordDetectorDelegate = self;
}

#pragma mark- RSWordDetectorDelegate method

-(void)textView:(UITextView *)textView didTappedWord:(NSString *)word {
    NSLog(@"Tapped word: %@", word);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
