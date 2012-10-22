//
//  ViewController.m
//  TableViewAdvancedDemo
//
//  Created by Suraj Mirajkar on 22/10/12.
//  Copyright (c) 2012 suraj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableViewForScreen;
@synthesize arrayForTableContent;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = self.editButtonItem; // Add an Edit Button to Navigation bar
    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease]; // Add an Add Item Button to Navigation bar
    self.navigationItem.rightBarButtonItem = addButton;
    
    arrayForTableContent = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
}

- (void)viewDidUnload
{
    [self setTableViewForScreen:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - Table View
// set number of Sections in Table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// set number of Rows in each Sections of Table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayForTableContent.count;
}

// Set animated style for Table Cell Editing
-(void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableViewForScreen setEditing:editing animated:animated];
}

// Customize the appearance of Table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }    
    cell.textLabel.text = [arrayForTableContent objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// 
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayForTableContent removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */
/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Selected Item" message:[arrayForTableContent objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alrt show];
    [alrt release];
}

// Insert cell to 
- (void)insertNewObject:(id)sender
{
    if (!arrayForTableContent) {
       // arrayForTableContent = [[NSMutableArray alloc] init];
    }
    NSString *strTobeAdded = [NSString stringWithFormat:@"%d",[arrayForTableContent count]+1];
    [arrayForTableContent insertObject:strTobeAdded atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableViewForScreen insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [tableViewForScreen release];
    [super dealloc];
}
@end
