package com.lab111.labwork3;

class main {
    public static void main(String[] args) {
        FileSystem fileSystem = new FileSystem();
        Component file_1 = new File(3);
        Component file_2 = new File(5);
        Component file_3 = new File(1);
        Component file_4 = new File(10);

        Component catalog_1 = new Catalog();
        Component catalog_2 = new Catalog();


        catalog_1.addComponent(file_1);
        catalog_1.addComponent(file_2);
        catalog_2.addComponent(file_3);
        catalog_2.addComponent(file_4);
        catalog_1.addComponent(catalog_2);
        catalog_1.removeComponent(catalog_2);

        fileSystem.addComponent(catalog_1);

        System.out.println(catalog_1.getSize());

    }
}
