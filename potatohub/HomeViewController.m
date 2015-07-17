//
//  HomeViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/7/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *slider;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view sendSubviewToBack:self.slider];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
