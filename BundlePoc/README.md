## How to use Resouces Bundle in Our App 


** FAQ

** Can we use image inside resouces bundle

yes, we can use


** Can we use xib, storyboard inside resources bundles

yes, we can use


** Can we use Core data inside resources bundles

yes, we can use


** Why we are using resouces bundle

We can't bundle resources file with static SDK, In that case resoucces file we have to bundle with resource bundle( xib, storyboard, image, core data etc) and outside the SDK we can access.

Example:-

Class BussinessLogic  and Class Resouces 

We can't have in static lib

We can access  BussinessLogic from Static lib

We can access  Resouces from Resouces bundle

In Class C Meand Sample Applicaton or Any Real Application


** Resouces want to access from Bundle

We have to add those in bundle target.

** How do find .bundle file 

Xcode preference-> drive data-> Product-> Build-> iPhones or simulator

or 

Product targer is thier->Show in finder

## Issues facing with bundle

** While you Uploading Build on AppStore or Validating for App Store. You many face issue with Bundle Structure is not correct, Missing code signing entitlement 
for excutable resouces, Invalid bundle Structure, Lib exec not permit, Bundle structure is not correct 


This error is comming, because you have exec file in bundle, Which is not needed. Delete exec from resouces bundle and delete executable key from bundle plist.

After that you can archive-> Validate it work.


Sample Poc create for it.


