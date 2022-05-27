//
//  PeopleDetailsViewController.m
//  JSONRead
//
//  Created by Johnstone Ananda on 5/1/22.
//

#import "PeopleDetailsViewController.h"

@interface PeopleDetailsViewController()
//@property (strong, nonatomic) NSDictionary *details;
@end

@implementation PeopleDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self name];
}

-(NSString *) name {
    return [NSString stringWithFormat:@"%@ %@", self.details[@"fname"], self.details[@"lname"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
 
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [self name];
            cell.detailTextLabel.text = @"Name";
            break;
        case 1: {
            NSString *email = [_details objectForKey:@"email"];
            if (!email)
                email = @"No email";
            if ([email isKindOfClass:[NSArray class]])
                email = @"<Multiple emails>";
            cell.textLabel.text = email;
            cell.detailTextLabel.text = @"Email";
            break;
        }
        case 2:
            cell.textLabel.text = self.details[@"phone"];
            cell.detailTextLabel.text = @"Phone";
            break;
        default:
            break;
    }
 
    return cell;
}


@end
