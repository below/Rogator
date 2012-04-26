//
//  ViewController.m
//  Rogator
//
//  Created by Alexander v. Below on 26.04.12.
//  Copyright (c) 2012 Alexander v. Below. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize frageLabel;
@synthesize antwortButton1;
@synthesize antwortButton2;
@synthesize antwortButton3;
@synthesize antwortButton4;
@synthesize fragenKatalog, aktuelleFrage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fragenKatalog = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Wie heisst der Bürgermeister von Wesel?", @"Question",
                           [NSArray arrayWithObjects:@"Thilo", @"Ivo", @"Ivo-Thilo", @"Thilo-Ivo", nil], @"Answers",
                           [NSNumber numberWithInt:0], @"correctAnswer",
                           nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Wer wurde 1978 in San Francisco erschossen?", @"Question",
                           [NSArray arrayWithObjects:@"Harvey Bread", @"Abraham Linconln", @"George Moscone", @"John F. Kennedy", nil], @"Answers",
                           [NSNumber numberWithInt:2], @"correctAnswer",
                           nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           @"What is your favorite color?", @"Question",
                           [NSArray arrayWithObjects:@"Blue", @"Green", @"No, red", @"Aaaaarrrghh!", nil], @"Answers",
                           [NSNumber numberWithInt:3], @"correctAnswer",
                           nil],
                          nil];
    
    [self zufallsfrage];
}

- (void) zufallsfrage {
    long frageNr = rand()  % (self.fragenKatalog.count);
    if (frageNr < self.fragenKatalog.count) {
        self.aktuelleFrage = [self.fragenKatalog objectAtIndex:frageNr];
    }
    [self setupQuestion];
}

- (void) setupQuestion {
    NSString *frage = [self.aktuelleFrage objectForKey:@"Question"];
    frageLabel.text = frage;
    NSArray *antworten = [self.aktuelleFrage objectForKey:@"Answers"];
    NSArray *buttons = [NSArray arrayWithObjects:antwortButton1, antwortButton2, antwortButton3, antwortButton4, nil];
    NSInteger i;
    for (i = 0; i < buttons.count; i++) {
        UIButton *button = [buttons objectAtIndex:i];
        if (i < antworten.count) {
            NSString *einzelAntwort = [antworten objectAtIndex:i];
            [button setTitle:einzelAntwort forState:UIControlStateNormal];
            [button sizeToFit];
            button.center = CGPointMake(self.view.center.x, button.center.y);
            button.hidden = NO;
        }
        else
            button.hidden = YES;
    }
}

- (IBAction)antwortAction:(UIButton *)sender {
    int richtigeAntwort = [[self.aktuelleFrage objectForKey:@"correctAnswer"] intValue];
    NSString *text;
    if ([sender tag] == richtigeAntwort)
        text = @"Richtig";
    else
        text = @"Nicht richtig";
    [[[UIAlertView alloc] initWithTitle:@"Auswertung" message:text delegate:nil cancelButtonTitle:@"Nächste Frage" otherButtonTitles:nil] show];
    [self zufallsfrage];
}

- (void)viewDidUnload
{
    [self setFrageLabel:nil];
    [self setAntwortButton1:nil];
    [self setAntwortButton2:nil];
    [self setAntwortButton3:nil];
    [self setAntwortButton4:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
