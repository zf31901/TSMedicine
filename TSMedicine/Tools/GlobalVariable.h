//
//  GlobalVariable.h
//  EwtStores
//
//  Created by Harry on 13-11-30.
//  Copyright (c) 2013年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVariable : NSObject

//#define Main_Size                   [UIScreen mainScreen].bounds.size
#define StatusBar_Height            20
#define Navbar_Height               44
#define Tabbar_Height               49

//NSUserDefaults 保存
#define USEROBJECT                  @"userObject"           //用户对象
#define HISTORYARR                  @"historyArr"           //搜索历史纪录
#define BANNERARR                   @"bannerArr"            //保存banner对象,无网络也可以显示上次的品牌图片
#define BRANDSARR                   @"brandsArr"            //保存品牌对象,无网络也可以显示上次的品牌图片
#define FLOWCHOICE                  @"flowChoice"           //流量选择（省／不省）
#define HELPCENTER_SECTION          @"helpCenterSection"    //帮助中心section标题
#define HELPCENTER_ROW              @"helpCenterRow"        //帮助中心row标题
#define ADDRESS_AREA_ARR            @"addressAreaArr"       //送货地址
#define CART_PRODUCT_COUNT          @"cartProductCount"     //购物车里的商品个数
#define FIRSTSORTPRODUCTARR         @"firstSortProductArr"  //保存一级分类商品名称
#define SECONDSORTPRODUCTARR(i)     [NSString stringWithFormat:@"secondSortProductArr_%@",i]   //保存二级分类商品名称
#define ORDEROBJECT                 @"orderObj"             //订单对象
#define ISFIRST_COMING              @"isFirst_coming"       //是否是第一次开机


//网络状态
#define NETWORKERROR                @"网络超时,请重试"
#define NETWORKLOADING              @"正在加载数据"
#define PRODUCTNOEXIST              @"商品不存在"
#define NETWORKFAILED               @"数据加载失败"

//颜色快速生成
//#define RGB(r,g,b)                  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//#define RGBA(r,g,b,a)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//#define RGBS(s)                     [UIColor colorWithRed:s/255.0 green:s/255.0 blue:s/255.0 alpha:1.0]
//#define NavBarColor                 [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]

//Json解析
#define HTTP_STATE                  @"state"                //网络请求状态 0:fail 1:success
#define HTTP_DATA                   @"data"                 //网络数据实体
#define HTTP_MSG                    @"msg"                  //失败msg
#define HTTP_ERRCODE                @"errcode"              //错误编码


//商品api
#define HOME_BANNER_REQUEST         @"/recommend/homebanner/"                   //主页banner api
#define XIANSHIQIANGGOU_REQUEST     @"/recommend/product/xianshiqianggou/"      //限时抢购商品 api
#define HOME_BRANDS_REQUEST         @"/recommend/brands/"                       //主页品牌 api
#define HOME_SPECIAL_REQUEST        @"/recommend/product/tejia/"                //特价商品 api
#define HOME_HOT_REQUEST            @"/recommend/product/remai/"                //热卖商品 api
#define HOME_NEW_REQUEST            @"/recommend/product/xinpin/"               //新品商品 api
#define HOME_CRAZY_REQUEST          @"/recommend/product/fengkuang/"            //疯狂抢购商品 api
#define FIRST_PRODUCT_CATEGORY      @"/categorys/list/"                         //分类商品api
#define SORT_PRODUCT_LIST           @"/products/list/"                          //分类商品列表api
#define BRANDSLIST                  @"/brands/list/"                            //获取品牌列表 api
#define PRODUCT_INFO                @"/products/info/"                          //商品简介 api
#define CART_PRODUCT_NUM            @"/usershopcars/count/"                     //购物车数量
#define PRODUCT_COLORSIZE           @"/products/productlist/"                   //商品颜色尺码
#define PRODUCT_EVALUATE            @"/productAppraises/list/"                  //商品评价 api
//购物车
#define USER_SHOPCART_LIST          @"/userShopCars/list/"                      //获取用户购物车信息
#define ADDPRODUCT_TO_CART          @"/userShopCars/add/"                       //商品加入购物车
#define EDIT_PRODUCT_FROM_CART      @"/userShopCars/updatecount/"               //编辑购物车中的商品 （可以编辑多个）
#define DELETE_PRODCT_FROM_CART     @"/userShopCars/Delete/"                    //将商品从购物车删除 （可以多个删除）
#define SUBMIT_PRODUCT              @"/UserShopCars/updatecount/"               //将商品提交 (可以多个提交)
#define SUBMIT_ORDER                @"/orders/add/"                             //下订单
#define COUPONS_LIST                @"/userCoupons/list/"                       //优惠券列表
#define COUPONS_check               @"/userCoupons/check/"                     //（添加/使用优惠券）
#define BILL_LIST_INFO              @"/userInvoice/list/"                       //发票信息列表
#define ADD_BILL_INFO               @"/userInvoice/Add/"                        //添加发票信息
#define EDIT_BILL_INFO              @"/userInvoice/Edit/"                       //编辑发票信息
#define PAYMENT_LIST_INFO           @"/userDelivery/Info/"                      //获取用户配送信息
#define EDIT_PAYMENT_INFO           @"/userDelivery/Edit/"                      //编辑用户配送信息
#define EDIT_MORE_PRODUCT           @""
//地址管理
#define ADDRESS_LIST                @"/recAddress/list/"                        //获取地址列表
#define ADD_ADDRESS                 @"/recAddress/add/"                         //添加地址
#define EDIT_ADDRESS                @"/recAddress/edit/"                        //编辑地址
#define DELETE_ADDRESS              @"/recAddress/delete/"                      //删除地址
#define SYSTEM_AREAS                @"/areas/list/"                             //获取送货区域
//登录注册
#define REGISTER_SEND_PHONE         @"/User/register/sendverifycode/"           //注册手机号
#define REGISTER_SEND_VERIFYCODE    @"/User/register/checkverifycode/"          //发送验证码
#define  QUICKREGISTER_SEND_PHONE   @"/User/freeregister/sendverifycode/"           //快速注册手机号
#define QUICKREGISTER_SEND_VERIFYCODE    @"/User/freeregister/checkverifycode/"          //快速注册发送验证码
#define REGISTER_SEND_PWD           @"/User/register/"                          //设置密码
#define LOGIN_USER                  @"/User/login/"                             //用户登录
#define FINDPWD_SEND                @"/User/findpassword/sendverifycode/"       //找回密码（发送手机号）
#define FINDPWD_CHECK               @"/User/findpassword/checkverifycode/"      //找回密码（确认验证码）
#define FINDPWD_RESET               @"/User/findpassword/resetpassword/"        //找回密码（重设密码）
#define USER_INFO                   @"/User/info/"                              //获取用户信息
#define USER_LOGINOUT               @"/user/loginout/"                          //注销登陆
#define USER_UPDATEFILE             @"/User/updateavatarfile/"                  //上传头像
//订单
#define ORDER_LIST                  @"/Orders/list/"                            //订单列表
#define ORDER_PRODUCT               @"/Orders/detailproductlist/"               //商品列表
#define ORDER_CANCEL                @"/Orders/Cancel/"                          //取消订单
#define ORDER_REPAY                 @"/Orders/Repay/"                           //立即支付
#define ORDER_TOSHOPCAR             @"/Orders/ToShopCar/"                       //订单重新加入购物车
#define REPAIRS_LIST                @"/Repairs/list/"                           //订单反馈列表
//支付
#define ORDER_CLIENTPAY             @"/Orders/clientpay/"                       //支付成功
//退款退货
#define ORDER_RETURN_REFUND         @"/ApplyRefundments/Add/"                   //退款
#define ORDER_RETURN_REPAIR         @"/Repairs/Add/"                            //换货维修
//活动
#define ACTIVITY_SUBJECT            @"/Subject/do/"                             //活动

//帮助中心
#define HELP_CENTER                 @"/articles/helpcenter/"                    //帮助中心

//意见反馈
#define FEEDBACK                    @"/feedBacks/add/"                          //意见反馈

//检查更新
#define CHECK_SYSTEMVERSON          @"/systems/version/"                        //检查更新

#define LOADING_TIME                1                                           //hud显示时间


//UMeng统计
#define HOME_VIEW                   @"HomeView"                                 //首页
#define RUSH_VIEW                   @"Xsqg"     //限时抢购
#define SPECLIAL_VIEW               @"Tjsp"     //特价商品
#define HOT_VIEW                    @"Rmsp"     //热卖商品
#define CRUZY_VIEW                  @"Fkqg"     //疯狂抢购
#define NEW_VIEW                    @"Xpsj"     //新品上架
#define ACTIVITY_VIEW               @"Cxhdzc"   //促销活动专场
#define ACTIVITY_PRODUCT_LISR_VIEW  @"Splbhd"   //商品列表（活动类）
#define PRODUCT_DETAIL_VIEW         @"Spjj"     //商品简介
#define SPXQ                        @"Spxq"     //商品详情
#define SPDT                        @"Spdt"     //商品大图
#define SPPL                        @"Sppl"     //查看评论
#define YJLM                        @"Yjlm"     //一级类目
#define EJLM                        @"Ejlm"
#define SJLM                        @"Sjlm"
#define SPLB                        @"Splb"     //商品列表
#define LSJL                        @"Lsjl"     //历史记录
#define SS                          @"Ss"       //搜索
#define SSWJG                       @"Sswjg"    //搜索无结果
#define GWC                         @"Gwc"      //购物车
#define SPJS                        @"Spjs"     //商品结算页
#define DZGL                        @"Dzgl"     //地址管理
#define ZFFS                        @"Zffs"     //支付方式
#define PSFS                        @"Psfs"     //配送方式
#define FPXX                        @"Fpxx"     //发票信息
#define YHJ                         @"Yhj"      //优惠券
#define MSZF                        @"Mszf"     //马上支付，
#define DL                          @"Dl"       //登录页面
#define ZC                          @"Zc"       //注册页面
#define KSZC                        @"Kuzc"     //快速注册
#define YZM                         @"Yzm"      //验证码
#define SZMM                        @"Szmm"     //设置密码
#define ZHMM                        @"Zhmm"     //找回密码
#define GRZX                        @"Grzx"     //个人中心
#define GRXS                        @"Grxs"     //个人信息
#define DCL                         @"Dcl"      //待处理订单
#define PSZ                         @"Psz"      //配送中订单
#define YWC                         @"Ywc"      //已完成订单
#define DDFK                        @"Ddfk"     //订单反馈
#define DDSQ                        @"Ddsq"     //订单申请
#define YJFK                        @"Yjfk"     //意见反馈

#define JRGWC                       @"jrgwc"    //加入购物车按钮
#define QXDD                        @"qxdd"     //取消订单
#define QCHC                        @"Qchc"     //清除缓存
#define SXLB                        @"Sxlb"     //筛选列表
#define SYJDT                       @"syjdt"    //首页banner点击

//申明一个 block_self 的指针，指向自身，以用于在block中使用
#define BLOCK_SELF(type) __block    type *block_self=self;

//FMDB
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

#define DATABASE_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]stringByAppendingString:@"/weChat.db"]

//用户信息
#define kMY_USER_ID @"myUserId"
#define kMY_USER_PASSWORD @"myUserPassword"
#define kMY_USER_NICKNAME @"myUserNickname"
#define kMY_USER_Head @"myUserHead"
#define kNewMsgNotifaction @"NewMsgNotifaction"

@end
