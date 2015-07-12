//
//  UserRegisterViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/13/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "UserRegisterViewController.h"
#import "AVUser.h"

@interface UserRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passConfirm;
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UISwitch *rulesAccepted;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation UserRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)clickRegister:(id)sender {
    if ([((UIButton *)sender).titleLabel.text isEqualToString:@"立即注册"]) {
        NSString *username = self.userName.text;
        NSString *password = self.password.text;
        NSString *passwordConfirm = self.passConfirm.text;
        NSString *email = self.mail.text;
        BOOL rulesChecked = self.rulesAccepted.on;
        AVUser *newUser = [AVUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        [newUser setObject:[NSNumber numberWithBool:rulesChecked] forKey:@"userConditions"];
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                //TODO: login with registered account
            } else {
                //TODO: handle errors
            }
        }];
    }
}

@end
