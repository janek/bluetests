//
//  TUTCell.m
//  Static
//
//  Created by Jan Szynal on 21.05.2013.
//  Copyright (c) 2013 PJM. All rights reserved.
//

#import "TUTCell.h"

@implementation TUTCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
