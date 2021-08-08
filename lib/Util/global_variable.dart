import 'package:flutter/material.dart';

///This page contain all global varibales including list and string constant

///This variable will store all user selected website feature
List<String> websiteFeature = <String>[];

///This variable will store all website feature
final List<String> websiteFullFeature = websiteFeatureString.split(",");

///Used to differentiate prod build from debug build
const bool isProd = false;
const Color myCardColor = Colors.green;
const Color myMainTextColor = Colors.black;
const Color myTitleTextColor = Colors.black87;
const Color mySubTitleTextColor = Colors.black87;

///This variable will store mobile device screen width maximum limit
const double screenForMobile = 520;

///This variable will store mobile device screen width maximum limit
const double screenForLaptop = 900;
bool isNotDesktopView = false;

///device width dynamically
double myDeviceWidth = 1200.0;

///Used as string constant to signify DeviceView
const String desktopView = "DesktopView";

///Used as string constant to signify DeviceView
const String tabletView = "TabletView";

///Used as string constant to signify DeviceView
const String mobileView = "MobileView";

///Used as string constant for localisation
const String createWeb = "Create Website / App";

///Used as string constant for localisation
const String createWebSub = "We help you make customized websites "
    "and mobile apps, in affordable manner. "
    "We provide a website that will help you in creating ";

///Used as string constant for localisation
const String credibility = "Credibility";

///Used as string constant for localisation
const String credibilitySub1 = "You will standout "
    "against similar service provider";

///Used as string constant for localisation
const String credibilitySub2 = "People believe more on Business with a website";

///Used as string constant for localisation
const String brand = "Brand";

///Used as string constant for localisation
const String brandSub1 = "Establishing your story & unique identity";

///Used as string constant for localisation
const String brandSub2 = "Set you apart from your competitors";

///Used as string constant for localisation
const String leads = "Leads";

///Used as string constant for localisation
const String leadsSub1 = "Generate Organic Traffic via good SEO";

///Used as string constant for localisation
const String leadsSub2 = "Better ROI then any other marketing channel";

///Used as string constant for localisation
const String betterService = "Better Service";

///Used as string constant for localisation
const String betterServiceSub1 = "Save time & resource,"
    " yet 24X7 Customer Service";

///Used as string constant for localisation
const String betterServiceSub2 = "Deliver immediate updates and announcement";

///Used as string constant for localisation
const String turnDreamsReality = "TURN your DREAMS into REALITY";

///Used as string constant for localisation
const String turnDreamsRealitySub = "We got you covered,"
    " with everything you need online";

///Used as string constant for localisation
const String selectDesign = "Find your style";

///Used as string constant for localisation
const String selectDesignSub = "find the reference design,"
    " which suits your taste. "
    "We have a huge library for you to explore. "
    "You cam also provide your own design for us to implement.";

///Used as string constant for localisation
const String addFeature = "Add Feature";

///Used as string constant for localisation
const String addFeatureSub = "let us know what"
    " all capabilities you expect from your website."
    " We build all kinds of workflow/system including operational, marketing,interactive.";

///Used as string constant for localisation
const String discussContent = "Discuss Data";

///Used as string constant for localisation
const String discussContentSub = "Inform us about your"
    " business to help us understand your data need. "
    "It will also let our domain experts prepare a customize prototype for you.";

///Used as string constant for localisation
const String selectDesignSub1 = "Select from 1000's of"
    " top designs in each category";

///Used as string constant for localisation
const String addFeatureSub1 = "Explore features/System you need";

///Used as string constant for localisation
const String tellUsBusiness = "Let's discuss Data";

///Used as string constant for localisation
const String tellUsBusinessSub1 = "Tell us about you Idea/Business";

///Used as string constant for localisation
const String chkBxYouWant = "You want to make :";

///Used as string constant for localisation
const String chkBxPageCount = "No. of Screens :";

///Used as string constant for localisation
const String chkBxAnimationExtent = "Extent of animation :";

///Used as string constant for localisation
const String chkBxCustomerCount = "Target Audience Monthly Average :";

///Used as string constant for localisation
const String websiteFeatureString = "online payment, booking service, "
    "email campaign ,message campaign,push notification,"
    " Customer chat., Analytics, "
    "Google sheet Integration, Youtube Integration,"
    " social media Integration, "
    "Feedback system, Billing system,Approval"
    " workflow,Attendance system,Tracking system, "
    "Online Order system, Content Management etc.";

///Used as string constant for localisation
const String dataDiscussionIntroduce = "Briefly Introduce your Business";

///Used as string constant for localisation
const String dataDiscussionContact = "Your contact no.";
