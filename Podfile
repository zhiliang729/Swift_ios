#########  gem 源有s3 的资源有的被墙了 换国内的 源
#########
#########  gem sources --remove https://rubygems.org/
#########  gem sources -a http://ruby.taobao.org/

#########  gem sources -l # 保证只有淘宝的源
#########  sudo gem install cocoapods // 安装cocoapods
#########  pod --version == 0.38.2 # 请保证版本为0.38.2 否则 Podfile.lock 文件会有冲突


#########  pod repo remove master
#########  pod repo add master https://git.oschina.net/6david9/Specs.git
#########  pod install --verbose --no-repo-update 安装
#########  pod update  --verbose --no-repo-update 更新
#########


######### 淘宝的源404了，cocoapods自己的源现在可以了。修改方法
######### 先gem sources -l 查看有哪些源，都删除gem sources -r 源url
######### 再执行sudo gem sources -a http://rubygems.org
######### 注意一定是http，不是https
######### 升级pod   sudo gem install cocoapods 到0.39.0

#国内镜像 github 太慢

source 'https://git.oschina.net/6david9/Specs.git'

platform :ios, '8.0'
use_frameworks!

pod 'Alamofire', '~> 3.0’  #网络请求库

pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'  #json解析库

pod 'SwiftFilePath'   #轻量级路径工具

pod 'XCGLogger' #log工具

pod 'AsyncSwift' #后台执行代码封装库

pod 'RavenSwift' #Raven

pod 'Dollar' # https://github.com/ankurp/Dollar.swift 很好用

pod 'Cent'  # 和上面同一个地址 一些拓展

pod 'SnapKit' # Auto layout

pod 'Kingfisher' #图片异步加载

pod 'HanekeSwift'  #cache 库

pod 'PySwiftyRegex'   #regex 库

pod 'Ji' #html parse 库
#pod 'Fuzi'

pod 'SwiftDate' #date 库

pod 'ReachabilitySwift', git: 'https://github.com/ashleymills/Reachability.swift' #Reachability in swift

pod 'MJRefresh'

#pod 'ImageScout' #最小代价获取远程图片大小及类型

#pod 'Toucan' # 处理图片大小

#pod 'SCLAlertView' # animate alertView


