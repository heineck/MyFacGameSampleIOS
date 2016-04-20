//
//  ChallengeViewController.m
//  MyFacGameSample
//
//  Created by Vinicius Heineck on 21/03/16.
//  Copyright © 2016 Vinicius Heineck. All rights reserved.
//

#import "ChallengeViewController.h"

@interface ChallengeViewController ()

@end

@implementation ChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.imgMyProfile.profileID = self.myProfileId;
    self.lblMyProfileName.text = self.myProfileName;
    
    self.imgFriendProfile.profileID = self.friendProfileId;
    self.lblFriendProfileName.text = self.friendProfileName;
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

@end
