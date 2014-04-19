//
//  ViewController.m
//  Skocko
//
//  Created by Marko Digital on 2/15/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import "ViewController.h"
#import "ChoicesCollectionViewDelegate.h"
#import "ResultsCollectionViewDelegate.h"
#import "HiddenCollectionViewDelegate.h"
#import "GameEngine.h"

@interface ViewController () {
    ChoicesCollectionViewDelegate *choicesCollectionViewDelegate;
    ResultsCollectionViewDelegate *resultsCollectionViewDelegate;
    HiddenCollectionViewDelegate *hiddenCollectionViewDelegate;
    GameEngine *gameEngine;
}
@end

@implementation ViewController

@synthesize collectionViewChoices;
@synthesize collectionViewResults;
@synthesize collectionViewHidden;
@synthesize buttonChoice1;
@synthesize buttonChoice2;
@synthesize buttonChoice3;
@synthesize buttonChoice4;
@synthesize buttonChoice5;
@synthesize buttonChoice6;
@synthesize buttonReset;

- (void)viewDidLoad
{
    [super viewDidLoad];
    gameEngine = [[GameEngine alloc] init];
    [self initCollectionViewChoices];
    [self initCollectionViewResults];
    [self initCollectionViewHidden];
    [self initButtons];
    [self initObservers];
    [buttonReset setHidden:YES];
}

- (void)initCollectionViewChoices
{
    [collectionViewChoices setBackgroundColor:[UIColor clearColor]];
    choicesCollectionViewDelegate = [[ChoicesCollectionViewDelegate alloc] init];
	[collectionViewChoices setDataSource:choicesCollectionViewDelegate];
    [collectionViewChoices setDelegate:choicesCollectionViewDelegate];
}
- (void)initCollectionViewResults
{
    [collectionViewResults setBackgroundColor:[UIColor clearColor]];
    resultsCollectionViewDelegate = [[ResultsCollectionViewDelegate alloc] init];
	[collectionViewResults setDataSource:resultsCollectionViewDelegate];
    [collectionViewResults setDelegate:resultsCollectionViewDelegate];
}
- (void)initCollectionViewHidden
{
    [collectionViewHidden setBackgroundColor:[UIColor clearColor]];
    hiddenCollectionViewDelegate = [[HiddenCollectionViewDelegate alloc] init];
	[collectionViewHidden setDataSource:hiddenCollectionViewDelegate];
    [collectionViewHidden setDelegate:hiddenCollectionViewDelegate];
}
- (void)initButtons
{
    [buttonChoice1 setTag:1];
    [buttonChoice2 setTag:2];
    [buttonChoice3 setTag:3];
    [buttonChoice4 setTag:4];
    [buttonChoice5 setTag:5];
    [buttonChoice6 setTag:6];
    [buttonChoice1 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonChoice2 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonChoice3 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonChoice4 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonChoice5 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonChoice6 addTarget:self action:@selector(buttonChoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonReset addTarget:self action:@selector(buttonResetClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initObservers
{
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(endRow:)
     name:@"endRow"
     object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(endGame:)
     name:@"endGame"
     object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(win:)
     name:@"win"
     object:nil];
}

- (void)endRow:(NSNotification*)notification
{
    NSDictionary* userInfo = notification.userInfo;
    NSMutableArray* results = [userInfo objectForKey:@"results"];
    
    resultsCollectionViewDelegate.results = results;
    [collectionViewResults reloadData];
}

- (void)endGame:(NSNotification*)notification
{
    [self uncoverHiddenFiles];
    [buttonReset setHidden:NO];
}

- (void)win:(NSNotification*)notification
{
    [self uncoverHiddenFiles];
    [buttonReset setHidden:NO];
}

-(IBAction)buttonChoiceClick:(id)sender
{
    choicesCollectionViewDelegate.choices = [gameEngine play:[NSNumber numberWithInt:[sender tag]]];
    [collectionViewChoices reloadData];
}

-(IBAction)buttonResetClick:(id)sender
{
    [self resetGame];
}

-(void)uncoverHiddenFiles
{
    hiddenCollectionViewDelegate.hidden = [gameEngine getHiddenCombination];
    [collectionViewHidden reloadData];
}

-(void)resetGame
{
    gameEngine = [[GameEngine alloc] init];
    [collectionViewChoices reloadData];
    [collectionViewResults reloadData];
    [collectionViewHidden reloadData];
    [buttonReset setHidden:YES];
}
@end
