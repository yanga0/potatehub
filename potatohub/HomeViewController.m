//
//  HomeViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/7/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "HomeViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <LGSublimationView/LGSublimationView.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *slider;
@property (weak, nonatomic) IBOutlet UIButton *createPostButton;
@property (weak, nonatomic) IBOutlet UITableView *itemList;
@property (weak, nonatomic) NSArray *posts;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view sendSubviewToBack:self.slider];
    AVQuery *query = [AVQuery queryWithClassName:@"Post"];
    self.posts = [query findObjects];
    
    // add hot item images
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.slider.bounds];
    
    NSMutableArray*views = [NSMutableArray new];
    for (int i  = 1; i<=4; i++) {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.slider.frame.size.width, self.slider.frame.size.height)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i]];
        view.contentMode = UIViewContentModeScaleAspectFill;
        [views addObject:view];
    }
    
    //Based on how many views are in this array, will determine how many times you can scroll the scroll view which applies the sublime effect.
    lgSublimer.viewsToSublime = views;
    
    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    lgSublimer.descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    
    //Titles are optional
    lgSublimer.titleStrings = @[@"This is title one",
                                @"This is title two",
                                @"This is title three",
                                @"This is title four"];
    
//    //Descriptions are optional
//    lgSublimer.descriptionStrings = @[@"This is a description of one",
//                                      @"This is description two and also happens to be multi line, which is sweet"
//                                      ,@"This is description three",
//                                      @"follow luke on twitter @lukejgeiger"];
    
    // An optional assign property on the LGSublimer. You can use this if your views are images. It helps make the text appear more readable if there is a slight black tint over the view.
    UIView* shadeView = [[UIView alloc]initWithFrame:lgSublimer.frame];
    shadeView.backgroundColor = [UIColor blackColor];
    shadeView.alpha = 0;
    lgSublimer.inbetweenView = shadeView;
    
    [self.slider addSubview:lgSublimer];
}

-(void)lgSublimationView:(LGSublimationView *)view didEndScrollingOnPage:(NSUInteger)page
{
    NSLog(@"Current Page %i",(int)page);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createNewPostClicked:(id)sender {
    if (sender) {
        [self performSegueWithIdentifier:@"createNewPost" sender:sender];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"postItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    AVObject *item = [self.posts objectAtIndex:(NSUInteger) indexPath.row];
    
    cell.detailTextLabel.text = (NSString *)[item objectForKey:@"postDescription"];
    
    return cell;
    
}

@end
