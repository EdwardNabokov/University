package com.solutions.labwork4;

/**
 * Interface File.
 * It's common access to handle
 * files.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 9.11.17
 */
public interface IFile {
    Component open(String path, boolean createIfNotExists);
    void close();
    void delete(String path);
}
