# GUI Gotchas & Tips

### Container Position Lock
**Prohibition**: Do not manually set the `position` or `size` of a node that is a child of a `Container`. The container will instantly override your changes. Use `custom_minimum_size` instead.

### MarginContainer Padding
Margins in `MarginContainer` are not simple properties. They are handled via **Theme Overrides** -> **Constants**.

### Performance
Complex nested containers can be slow to update. If you have a massive list of items, consider using a `ItemList` or a custom virtualized list.
