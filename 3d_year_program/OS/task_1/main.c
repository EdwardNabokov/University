#include <stdio.h>
#include "alloclib.h"

int main() {
    void *ptr = mem_malloc(16);
    if (ptr) {
        printf("Memory was allocated!\n");
    }
    else {
        printf("Errror! Mem was not allocated!\n");
    }
}
