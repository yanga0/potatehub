//
//  UserRegisterViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/13/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "UserRegisterViewController.h"
#import "AboutMeViewController.h"
#import <AVOSCloud/AVUser.h>
#import "AppDelegate.h"
#import <Toast/UIView+Toast.h>

@interface UserRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passConfirm;
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UISwitch *rulesAccepted;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UITextView *rulesLink;

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
    NSString *default_avatar = @"http://some_img_url";
    if ([((UIButton *)sender).titleLabel.text isEqualToString:@"立即注册"]) {
        NSString *username = self.userName.text;
        NSString *password = self.password.text;
        NSString *passwordConfirm = self.passConfirm.text;
        NSString *email = self.mail.text;
        BOOL rulesChecked = self.rulesAccepted.on;
        if ([username isEqualToString:@""]) {
            [self.view makeToast:@"用户名输入为空！" duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
            return;
        }
        if ([password isEqualToString:@""] || [passwordConfirm isEqualToString:@""]) {
            [self.view makeToast:@"密码或密码确认输入为空！" duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
            return;
        }
        if ([email isEqualToString:@""]) {
            [self.view makeToast:@"邮箱输入为空！" duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
            return;
        }
        if (rulesChecked && [password isEqual:passwordConfirm]) {
            AVUser *newUser = [AVUser user];
            newUser.username = username;
            newUser.password = password;
            newUser.email = email;
            [newUser setObject:[NSNumber numberWithBool:rulesChecked] forKey:@"userConditions"];
            [newUser setObject:default_avatar forKey:@"avatar"];
            [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
                    delegate.currentUser = newUser;
                    [(AboutMeViewController *)[((UINavigationController *)self.navigationController).viewControllers objectAtIndex:0] syncUserData];
                    [self.view makeToast:@"注册成功，正在登录.." duration: 1.0 position:[NSValue valueWithCGPoint:self.password.center]];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                } else {
                    [self.view makeToast:error.localizedDescription duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
                    return;
                }
            }];
        } else {
            if (![password isEqual:passwordConfirm]) {
                [self.view makeToast:@"两次输入密码不一致！" duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
                return;
            }
            if (!rulesChecked) {
                [self.view makeToast:@"请同意用户使用须知！" duration: 2.0 position:[NSValue valueWithCGPoint:self.password.center]];
            }
            [self.passConfirm becomeFirstResponder];
        }
    }
}

@end
