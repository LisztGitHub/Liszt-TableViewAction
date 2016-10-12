# Liszt-TableViewAction
亲测支持iOS7+的TableView侧滑多选按钮
## @Jazys 作者
    #import <UIKit/UIKit.h>

    @interface UITableViewRowAction (JZExtension)

    @property (nonatomic, strong, nullable) UIImage *image;

    @property (nonatomic, assign) BOOL enabled;

    + (nonnull instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(nullable UIImage *)image handler:(nullable void (^)(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath))handler;

    @end
# 
<img src="https://github.com/LisztGitHub/Liszt-TableViewAction/blob/master/Liszt.gif">
