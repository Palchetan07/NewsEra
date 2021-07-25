import 'package:NewsEra/models/category_model.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  return myCategories;

}





























// import 'package:NewsEra/models/category_model.dart';
//
// List<CategoryModel> getCategories(){
//   List<CategoryModel> category =new List<CategoryModel>();
//   //1
//   CategoryModel categoryModel =new CategoryModel();
//   categoryModel.categoryName='Business';
//   categoryModel.imageUrl='https://images.unsplash.com/photo-1517048676732-d65bc937f952?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
//   category.add(categoryModel);
//   //2
//   categoryModel  =new CategoryModel();
//   categoryModel.categoryName='Entertainment';
//   categoryModel.imageUrl='https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
//   category.add(categoryModel);
//   //3
//   categoryModel=new CategoryModel();
//   categoryModel.categoryName='General';
//   categoryModel.imageUrl='https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
//   category.add(categoryModel);
// //4
//   categoryModel =new CategoryModel();
//   categoryModel.categoryName='Health';
//   categoryModel.imageUrl='https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1335&q=80';
//   category.add(categoryModel);
//   //5
//   categoryModel  =new CategoryModel();
//   categoryModel.categoryName='Science';
//   categoryModel.imageUrl='https://images.unsplash.com/photo-1574170608990-8b45e8d75449?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80';
//   category.add(categoryModel);
//
//
//
//  return category;
//
//
// }