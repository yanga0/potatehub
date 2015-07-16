//
//  AboutMeViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/9/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AFNetworking/UIImageView+AFNetworking.h"

@interface AboutMeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIButton *clickLogin;

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the vie0w.
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
//    self.tableView.tableHeaderView = headerView;
    [self.avatar setImageWithURL:[NSURL URLWithString:@"http://www.iconpng.com/png/ios7_icons/user_male.png"]];
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


@end
