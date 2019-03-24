package com.solutions.labwork4;

public interface IDirectory {

    Component create(String path);

    void rmdir(String path);
}
