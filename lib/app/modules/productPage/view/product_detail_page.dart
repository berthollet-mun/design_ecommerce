import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/product_model.dart';
import '../../providers/providers.dart';
import '../../utils/theme.dart';
import '../components/button_components.dart';
import '../components/space.dart';
import '../components/text_components.dart';
import '../panier/view/panier.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _imageController = PageController();
  String? _selectedSize;
  Color? _selectedColor;
  int _quantity = 1;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.product.sizes.first;
    _selectedColor = widget.product.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isInWishlist = wishlistProvider.isInWishlist(widget.product.id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar with Image Carousel
          SliverAppBar(
            expandedHeight: 350.h,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  wishlistProvider.toggleWishlist(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isInWishlist ? 'Removed from wishlist' : 'Added to wishlist',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8.w),
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    isInWishlist ? Icons.favorite : Icons.favorite_border,
                    color: isInWishlist ? Colors.red : Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Pannier()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8.w),
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _imageController,
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: AppTheme.grey1,
                        child: widget.product.images[index].startsWith('http')
                            ? CachedNetworkImage(
                                imageUrl: widget.product.images[index],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : Image.asset(
                                widget.product.images[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: AppTheme.grey2,
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 64,
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16.h,
                    child: SmoothPageIndicator(
                      controller: _imageController,
                      count: widget.product.images.length,
                      effect: WormEffect(
                        dotWidth: 8.w,
                        dotHeight: 8.h,
                        spacing: 8.w,
                        dotColor: AppTheme.grey3,
                        activeDotColor: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product Details
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          widget.product.brand,
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: widget.product.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18.sp,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '(${widget.product.reviewCount} reviews)',
                            style: TextStyle(
                              color: AppTheme.grey4,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Product Name
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryLight,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Price
                  Row(
                    children: [
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      if (widget.product.hasDiscount) ...[
                        SizedBox(width: 12.w),
                        Text(
                          '\$${widget.product.originalPrice?.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            decoration: TextDecoration.lineThrough,
                            color: AppTheme.grey4,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.error.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '-${widget.product.discountPercentage.toInt()}%',
                            style: TextStyle(
                              color: AppTheme.error,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryLight,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ReadMoreText(
                    widget.product.description,
                    trimLines: 3,
                    colorClickableText: AppTheme.primaryColor,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppTheme.textSecondaryLight,
                      height: 1.5,
                    ),
                    moreStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Size Selection
                  Text(
                    'Select Size',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryLight,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 8.h,
                    children: widget.product.sizes.map((size) {
                      final isSelected = _selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedSize = size),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primaryColor
                                : AppTheme.grey1,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryColor
                                  : AppTheme.grey2,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.grey5,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 24.h),

                  // Color Selection
                  Text(
                    'Select Color',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryLight,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 8.h,
                    children: widget.product.colors.map((color) {
                      final isSelected = _selectedColor == color;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColor = color),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: color,
                            child: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16.sp,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 24.h),

                  // Quantity
                  Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryLight,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      _buildQuantityButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (_quantity > 1) {
                            setState(() => _quantity--);
                          }
                        },
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        '$_quantity',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      _buildQuantityButton(
                        icon: Icons.add,
                        onTap: () {
                          if (_quantity < widget.product.stockQuantity) {
                            setState(() => _quantity++);
                          }
                        },
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        '${widget.product.stockQuantity} items available',
                        style: TextStyle(
                          color: AppTheme.grey4,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: AppTheme.grey4,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final cart = Provider.of<CartProvider>(context, listen: false);
                    cart.addToCart(
                      widget.product,
                      size: _selectedSize,
                      color: _selectedColor,
                      quantity: _quantity,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag),
                  label: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppTheme.grey1,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 20.sp),
      ),
    );
  }
}
