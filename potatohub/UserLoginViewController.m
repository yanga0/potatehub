//
//  UserLoginViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/13/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "UserLoginViewController.h"
#import "AboutMeViewController.h"
#import <AVUser.h>
#import "AppDelegate.h"

@interface UserLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation UserLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    [(AboutMeViewController *)[segue destinationViewController] syncUserData];
//}

- (IBAction)userClickLogRegButton:(id)sender {
    if ([((UIButton *)sender).titleLabel.text  isEqual: @"注册"]) {
        [self performSegueWithIdentifier:@"userRegisterSegue" sender:sender];
    } else {
        NSString *username = self.userName.text;
        NSString *password = self.password.text;
        [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
            if (user != nil) {
                AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
                delegate.currentUser = user;
                [(AboutMeViewController *)[((UINavigationController *)self.navigationController).viewControllers objectAtIndex:0] syncUserData];
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                
            }
        }];
    }
}

@end
