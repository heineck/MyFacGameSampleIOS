//
//  ViewController.h
//  MyFacGameSample
//
//  Created by Vinicius Heineck on 18/03/16.
//  Copyright © 2016 Vinicius Heineck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *btnFbLogin;

@end

