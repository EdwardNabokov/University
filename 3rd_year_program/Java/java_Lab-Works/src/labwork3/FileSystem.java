package com.lab111.labwork3;

import java.util.ArrayList;
import java.util.List;

public class FileSystem {
    private List<Component> components = new ArrayList<>();

    public void addComponent(Component component) {
        components.add(component);
    }
    public void removeComponent(Component component) {
        components.remove(component);
    }
}
