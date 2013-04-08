//
//  ViewController.m
//  MusicManager
//
//  Created by DucHa on 4/2/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "ViewController.h"
#import "SearchResultController.h"

@interface ViewController () {
    NSMutableArray *_mutArray;
    NSMutableArray *mArrayResult;
}

@property (weak, nonatomic) IBOutlet UITextField *txt_search;
@property (weak, nonatomic) IBOutlet UISwitch *chooser;
@property (weak, nonatomic) IBOutlet UIButton *btn_search;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mutArray = [NSMutableArray new];
    _song = [[Song alloc] init:@"My love" andSinger:@"Westlife" andYear:1999 andGenre:pop andUrl:@"My love.jpg"];
    [_mutArray addObject:_song];
    _song = [[Song alloc] init:@"Happy New Year" andSinger:@"Abba" andYear:1980 andGenre:pop andUrl:@"Abba.jpg"];
    [_mutArray addObject:_song];
    _song = [[Song alloc] init:@"Tim lai" andSinger:@"Microwave" andYear:2004 andGenre:rock andUrl:@"Timlai.jpg"];
    [_mutArray addObject:_song];
    _song = [[Song alloc] init:@"Love story" andSinger:@"Taylor Swift" andYear:2006 andGenre:country andUrl:@"TaylorSwift.jpg"];
    [_mutArray addObject:_song];
    _song = [[Song alloc] init:@"Black or white" andSinger:@"Michael Jackson" andYear:1982 andGenre:pop andUrl:@"MJ.jpg"];
    [_mutArray addObject:_song];
    //_pickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *) searchSong: (NSString *) name{
    NSMutableArray *mArray = [NSMutableArray new];
    for(Song *song in _mutArray){
        if([song.name rangeOfString:name].location !=NSNotFound ||
           [song.singer rangeOfString:name].location !=NSNotFound) {
            [mArray addObject:song];
        }
    }
    return mArray;
}
- (NSMutableArray *) searchGenre: (NSString *) genre{
    NSMutableArray *mArray = [NSMutableArray new];
    GenreEnum key;
    if([genre isEqualToString:@"pop"]){
        key = pop;
    }else if([genre isEqualToString:@"rock"]) {
        key = rock;
    }else if([genre isEqualToString:@"country"]){
        key = country;
    }else if([genre isEqualToString:@"jazz"]){
        key = jazz;
    }else {
        genre = NO;
    }
    for(Song *song in _mutArray){
        if(key == song.genre){
            [mArray addObject:song];
        }
    }
    return mArray;
}

- (IBAction)searchClicked:(id)sender {
    mArrayResult = [NSMutableArray new];
    NSString *keyword = self.txt_search.text;
        if([_chooser isOn]){
        mArrayResult = [self searchSong:keyword];
    }else {
        mArrayResult = [self searchGenre:keyword];
    }
    
    SearchResultController *searchView = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
    searchView.mArrayResult = mArrayResult;
    [self presentViewController:searchView animated:YES completion:nil];
}

@end
