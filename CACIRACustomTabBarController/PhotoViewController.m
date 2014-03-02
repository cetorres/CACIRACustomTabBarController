//
//  PhotoViewController.m
//  CACIRACustomTabBarController
//
//  Created by Carlos Torres on 02/03/14.
//  Copyright (c) 2014 CACIRA. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Send Photo";
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(closePhotoView)];
    self.navigationItem.rightBarButtonItem = closeButton;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}


-(void)closePhotoView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
