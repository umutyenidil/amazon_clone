part of 'admin_add_product_page.dart';

abstract class _AdminAddProductPageManager extends State<AdminAddProductPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _quantityController;
  late String _categoryId;
  late final List<Map<String, String>> _categories;
  late List<File> _images;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();

    _categories = [
      {
        "name": "Technology",
        "uuid": "0149c6c3-053b-4f9f-9732-44d7ae3a7d4f",
      },
      {
        "name": "Essentials",
        "uuid": "4c53517b-a2f5-46b3-8585-a114f1a3cdce",
      },
      {
        "name": "Appliances",
        "uuid": "88bb2c18-e21e-42e2-b83e-db64ab7be8cf",
      },
      {
        "name": "Books",
        "uuid": "45e294af-a619-4a0a-899d-de0f70cef276",
      },
      {
        "name": "Fashion",
        "uuid": "15bd6fe1-e972-444f-ab40-eab3e5de30a1",
      },
    ];

    _categoryId = _categories[0]['uuid']!;

    _images = [];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();

    super.dispose();
  }

  Future<void> _onSelectImages() async {
    List<File> imageFiles = [];
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage();

      for (XFile image in images) {
        imageFiles.add(File(image.path));
      }

      setState(() {
        _images = imageFiles;
      });
    } catch (exception) {
      print(exception);
    }
  }

  Future<void> _onSubmitForm() async {
    if (_images.isEmpty) {
      SnackbarHelper.of(context).showSnackBar('Lutfen urun resim/resimleri secin');
    } else {
      if (_formKey.currentState!.validate()) {
        UserModel? user = Provider.of<AuthProvider>(context, listen: false).getCurrentUser();

        AdminServiceResponse response = await AdminService.instance.sellProduct(
          formData: AddProductFormModel(
            productImages: _images,
            productName: _nameController.text,
            productDescription: _descriptionController.text,
            productPrice: double.parse(_priceController.text),
            productQuantity: int.parse(_quantityController.text),
            categoryId: _categoryId,
          ),
          xAuthToken: user!.token!,
        );

        if (response.status == AdminServiceResponseStatus.successful) {
          AppRouter.of(context).route(Routes.admin_main_page, routingMethod: RoutingMethods.popAndPush);

          return;
        }

        if (mounted) SnackbarHelper.of(context).showSnackBar(response.message!);

        print(response.status);
      }
    }
  }
}
