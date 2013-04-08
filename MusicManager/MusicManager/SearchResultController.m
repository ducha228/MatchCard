//
//  SearchResultController.m
//  MusicManager
//
//  Created by DucHa on 4/8/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "SearchResultController.h"
#import "Song.h"
#import "ViewController.h"

@interface SearchResultController (){
    
    IBOutlet UITableView *_tableView;
}

@end

@implementation SearchResultController
//@synthesize mArrayResult;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",[_mArrayResult count]);
    return [_mArrayResult count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    //set data for cell
    
    Song *searchedSong = [_mArrayResult objectAtIndex:indexPath.row];
    
    cell.textLabel.text = searchedSong.name;
    cell.detailTextLabel.text = searchedSong.singer;
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",searchedSong.imageUrl]];
    
    cell.imageView.image = image;
    
    return cell;
}
- (IBAction)backToMain:(id)sender {
    ViewController *mainView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self presentViewController:mainView animated:NO completion:nil];
}

@end
