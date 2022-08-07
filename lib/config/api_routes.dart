// * # Q U E E N  👑
class ApiRoutesConfig {
  ApiRoutesConfig._();

  // ? BaseURL
  static const kBaseUrl = 'https://www.elmanhg.com/wp-json/wp/v2';

  // ? Categories Of All Stages and Classes
  /*
   *   Get All Stages
   *  EndPoints.CATEGORIES + "?parent=913&per_page=100&orderby=id&order=asc"
   *
   *   If You Want To Select Specific Stage => Pass Class Id Like that :
   *   EndPoints.CATEGORIES + "?parent=$ClassId&per_page=100&orderby=id&order=asc"  => $4
   */

  static const kCATEGORIES = kBaseUrl + '/categories';

  /*
       ? Home Slider
       posts?per_page=10
       EndPoints.kSlider + "/$id"
  */

  static const kSlider = kBaseUrl + '/posts?per_page=10';

  /*
     ? Slider Details
     /posts?id=5711
     EndPoints.kSliderDetails + "/$id"
  */

  static const kSliderDetails = kBaseUrl + '/posts';

  /*
     ? Latest New Notes - List
     /posts?per_page=10&page=10
     EndPoints.kBaseUrl + "/posts?per_page=10&page=$_page")
  */

  static const kLatestNewNotes = kBaseUrl + '/posts?per_page=10&page=';
  // some updated

  /*
     ? Ads In Every Screen
     /posts?id=5711
     (EndPoints.kAds + "?search=$txt&per_page=100&page=1")
  */
  static const kAds = kBaseUrl + '/posts?per_page=20';
}
