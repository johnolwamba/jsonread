//
//  ViewController.m
//  JSONRead
//
//  Created by Johnstone Ananda on 5/1/22.
//

#import "ViewController.h"
#import "PeopleDetailsViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *names;

@property (strong, nonatomic) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JSONRead";
    
    //Download JSON
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString: @"https://raw.githubusercontent.com/Binpress/learn-objective-c-in-24-Days/master/Working%20With%20Web%20Data/JSONRead.json"]];
    
    //Parse JSON
    NSArray *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:nil];
    self.data = jsonResult;
    
    NSMutableArray *_names = [NSMutableArray array];
    
    for (id item in jsonResult)
        [_names addObject:[NSString stringWithFormat:@"%@ %@", item[@"fname"], item[@"lname"]]];
    self.names = _names;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
    //[self.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PeopleDetailsViewController *detailViewController = [[PeopleDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped];
      detailViewController.details = self.data[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}
@end
