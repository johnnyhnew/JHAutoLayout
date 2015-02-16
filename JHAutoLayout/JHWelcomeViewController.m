//
//  JHWelcomeViewController.m
//  JHAutoLayout
//
//  Created by Johnny Heusser  on 2/16/15.
//  Copyright (c) 2015 ThinkInSound. All rights reserved.
//

#import "JHWelcomeViewController.h"

@interface JHWelcomeViewController ()  

@property (strong, nonatomic) UILabel *welcomeLabel;
@property (strong, nonatomic) UITextView *welcomeTextView;
@property (strong, nonatomic) UIImageView *logoImageView;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIButton *signUpButton;
@property (strong, nonatomic) UIButton *logInButton;

@end

@implementation JHWelcomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpBackgroundView];
    [self setUpViews];
    [self setUpButtons];
}

- (void)setUpBackgroundView {
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.backgroundImageView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_backgroundImageView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundImageView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundImageView]|" options:0 metrics:nil views:views]];
}

- (void)setUpViews {
    
    self.welcomeLabel = [[UILabel alloc] init];
    self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.welcomeLabel.text = @"Welcome To";
    self.welcomeLabel.textColor = [UIColor whiteColor];
    self.welcomeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0f];
    [self.view addSubview:self.welcomeLabel];
    
    self.logoImageView = [[UIImageView alloc] init];
    self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.logoImageView.image = [UIImage imageNamed:@"nike.png"];
    [self.view addSubview:self.logoImageView];
    
    self.welcomeTextView = [[UITextView alloc] init];
    self.welcomeTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.welcomeTextView.text = @"Experience shoes that makes shoes look like shoes.";
    self.welcomeTextView.textColor = [UIColor blackColor];
    self.welcomeTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f];
    self.welcomeTextView.scrollEnabled = NO;
    self.welcomeTextView.editable = NO;
    self.welcomeTextView.userInteractionEnabled = NO;
    self.welcomeTextView.backgroundColor = [UIColor clearColor];
    self.welcomeTextView.textContainerInset = UIEdgeInsetsZero;
    self.welcomeTextView.textContainer.lineFragmentPadding = 0;
    self.welcomeTextView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.welcomeTextView];
    
    [self viewContraints];
}

- (void)viewContraints {
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_welcomeLabel, _logoImageView, _welcomeTextView);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[_welcomeLabel]" options:0 metrics:nil views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_welcomeLabel]-40-[_logoImageView]" options:0 metrics:nil views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.logoImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_logoImageView(204)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_logoImageView(104)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.welcomeTextView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.welcomeTextView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.welcomeTextView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:CGRectGetWidth([UIScreen mainScreen].bounds) * .70]];
}

- (void)setUpButtons {
    
    self.signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.signUpButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    self.signUpButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self.signUpButton layer] setBorderColor:[UIColor whiteColor].CGColor];
    [[self.signUpButton layer] setBorderWidth:1.0f];
    [self.view addSubview:self.signUpButton];
    
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logInButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.logInButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    self.logInButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    [self.logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.logInButton];
    
    [self buttonConstraints];
}

- (void)buttonConstraints {
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_signUpButton, _logInButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_signUpButton]-90-|" options:0 metrics:nil views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.signUpButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_signUpButton(204)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_signUpButton(50)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_signUpButton]-20-[_logInButton]-20-|" options:0 metrics:nil views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.logInButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

@end
