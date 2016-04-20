//
//  ChallengeViewController.h
//  MyFacGameSample
//
//  Created by Vinicius Heineck on 21/03/16.
//  Copyright © 2016 Vinicius Heineck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ChallengeViewController : UIViewController

@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *imgMyProfile;
@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *imgFriendProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblMyProfileName;
@property (strong, nonatomic) IBOutlet UILabel *lblFriendProfileName;

@property (nonatomic, strong) NSString *myProfileId;
@property (nonatomic, strong) NSString *friendProfileId;

@property (nonatomic, strong) NSString *myProfileName;
@property (nonatomic, strong) NSString *friendProfileName;


@end
