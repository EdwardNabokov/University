void *mem_malloc(size_t size);
void mem_free(void*);
void *mem_realloc(void*, size_t);
struct header_t *get_free_block(size_t);
