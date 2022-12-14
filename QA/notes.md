[What are file descriptors, explained in simple terms?](https://stackoverflow.com/questions/5256599/what-are-file-descriptors-explained-in-simple-terms)

[get field of a class by its annotation](https://stackoverflow.com/questions/38425037/how-to-get-field-of-a-class-by-its-annotation)

    事实 1    一个大的文件需要多个磁盘块
    事实 2    在 i-node 中存放有磁盘块分配列表

    - 问题：一个固定大小的 i-node 如何存储较长的分配列表？
    解决方案：将分配列表的大部分存储在数据块，在 i-node 中存放指向那些块的指针

    目录包含的是文件的引用，每个引用被称为链接。文件的内容存储在数据块，文件的属性被记录在一个被称为 i-node 的结构中，i-node
    的编号和文件名存储在目录中。"目录包含子目录的远离与此相同；

    ln：创建一个文件的链接

To create a new symlink(will fail if symlink exists already)

> ln -s /path/to/file /path/to/symlink

To create or update a symlink

> ln -sf /path/to/file /path/to/symlink