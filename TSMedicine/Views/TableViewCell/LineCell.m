
@interface LineCell : X_TableViewCell
@end

@implementation LineCell
-(void)update{
    self.backgroundColor = self.cellData[@"color"];
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
