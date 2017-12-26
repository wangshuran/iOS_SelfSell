# iOS_LBaseClass
iOS重写基类


#一、修改后发布到服务器的命令
pod lib lint --allow-warnings LBaseClass.podspec --verbose
git tag 'X.X.X'
git push --tags
pod trunk push --allow-warnings LBaseClass.podspec --verbose

#二、发布到服务器后，更新的命令
pod install --verbose --no-repo-update（相比pod install速度快很多）
pod update --verbose --no-repo-update（相比pod update速度快很多）
