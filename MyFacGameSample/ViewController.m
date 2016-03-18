//
//  ViewController.m
//  MyFacGameSample
//
//  Created by Vinicius Heineck on 18/03/16.
//  Copyright © 2016 Vinicius Heineck. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <FBSDKLoginButtonDelegate, FBSDKGameRequestDialogDelegate>

@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *imgProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblProfileName;


@property(nonatomic, strong) NSString *myProfileId;
@property(nonatomic, strong) NSString *myProfileName;

-(void)requestMe;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btnFbLogin.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.btnFbLogin.delegate = self;
    
    [self requestMe];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnChallengeClicked:(id)sender {
    
    [self gameRequest];
    
}

#pragma mark - Facebook Login delegate methods

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
   
    if (error) {
        NSLog(@"Login ERROR - %@", error.localizedDescription);
        return;
    }
    
    self.myProfileId = result.token.userID;
    self.imgProfile.profileID = self.myProfileId;
    
    [self requestMe];
    
    if ([result.grantedPermissions containsObject:@"publish_actions"]) {
        NSLog(@"Already has publish_actions");
        return;
    }
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithPublishPermissions: @[@"publish_actions"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
    
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"Logged out");
}

-(void)requestMe {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{ @"fields" : @"id, name"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 
                 self.myProfileId = result[@"id"];
                 self.myProfileName = result[@"name"];
                 
                 self.lblProfileName.text = self.myProfileName;
                 
                 NSLog(@"Me id: %@", self.myProfileId);
                 NSLog(@"Me name: %@", self.myProfileName);
                 
                 
             } else {
                 NSLog(@"Me ERROR: %@", error.localizedDescription);
             }
         }];
    }
    
}

-(void)gameRequest {
    
    FBSDKGameRequestContent *gameRequestContent = [[FBSDKGameRequestContent alloc] init];
    // Look at FBSDKGameRequestContent for futher optional properties
    gameRequestContent.message = @"Estou lhe desafiando!!!";
    gameRequestContent.title = @"Estou lhe desafiando!!!";
    
    // Assuming self implements <FBSDKGameRequestDialogDelegate>
    [FBSDKGameRequestDialog showWithContent:gameRequestContent delegate:self];
    
}

#pragma mark - Facebook Game request methods

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog didCompleteWithResults:(NSDictionary *)results {
    
    NSLog(@"Game Request completed: %@", results);
    
}

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog didFailWithError:(NSError *)error {
    NSLog(@"Game Request ERROR: %@", error.description);
}

- (void)gameRequestDialogDidCancel:(FBSDKGameRequestDialog *)gameRequestDialog {
    NSLog(@"Game Request Cancelled");
}


@end
