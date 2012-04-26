//
//  ViewController.h
//  Rogator
//
//  Created by Alexander v. Below on 26.04.12.
//  Copyright (c) 2012 Alexander v. Below. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *frageLabel;
@property (weak, nonatomic) IBOutlet UIButton *antwortButton1;
@property (weak, nonatomic) IBOutlet UIButton *antwortButton2;
@property (weak, nonatomic) IBOutlet UIButton *antwortButton3;
@property (weak, nonatomic) IBOutlet UIButton *antwortButton4;

@property (readwrite, retain) NSDictionary *aktuelleFrage;
@property (readwrite, retain) NSArray *fragenKatalog;

- (IBAction) antwortAction:(UIButton *)sender;

- (void) setupQuestion;
- (void) zufallsfrage;
@end
