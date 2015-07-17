//
//  AboutMeViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/9/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AFNetworking/UIImageView+AFNetworking.h"
#import "AppDelegate.h"

@interface AboutMeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIButton *clickLogin;

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.avatar setImageWithURL:[NSURL URLWithString:@"http://www.iconpng.com/png/ios7_icons/user_male.png"]];
    [self syncUserData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)userClickLogin:(id)sender {
    if (sender) {
        [self performSegueWithIdentifier:@"userLoginSegue" sender:sender];
    }
}

- (void) syncUserData {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if (delegate.currentUser) {
        AVUser *user = delegate.currentUser;
        [self.avatar setImageWithURL:[NSURL URLWithString: (NSString *)[user objectForKey:@"avatar"]]];
        self.clickLogin.titleLabel.text = user.username;
    }
}


@end
