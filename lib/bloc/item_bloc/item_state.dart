part of 'item_bloc.dart';

enum ItemStatus { success, loading, failure, isDeleted }

class ItemState extends Equatable {
  final ItemStatus status;
  final ItemModel? item;
  final Object? listItem;
  final String? imageUrl;
  final bool? isDeleted;

  const ItemState._(
      {this.status = ItemStatus.loading,
      this.item,
      this.listItem,
      this.imageUrl,
      this.isDeleted});

  const ItemState.loading() : this._();

  const ItemState.success(ItemModel item)
      : this._(status: ItemStatus.success, item: item);

  const ItemState.successListItem(Object listItem)
      : this._(status: ItemStatus.success, listItem: listItem);

  const ItemState.successUploadImage(String imageUrl)
      : this._(status: ItemStatus.success, imageUrl: imageUrl);

  const ItemState.isDeleted(bool isDeleted)
      : this._(status: ItemStatus.isDeleted, isDeleted: isDeleted);

  const ItemState.failure() : this._(status: ItemStatus.failure);

  @override
  List<Object?> get props => [status, item, listItem, imageUrl, isDeleted];
}

final class GetListItemSuccess extends ItemState {
  final Query<ItemModel> listItem;

  const GetListItemSuccess(this.listItem) : super.failure();
}

final class UploadItemSuccess extends ItemState {
  final ItemModel item;

  const UploadItemSuccess(this.item) : super.failure();
}
