#include <stdio.h>
#include "alloclib.h"

struct Tblock {
    size_t size;
    unsigned is_free;
    struct Tblock *next;
};

struct Tblock *head, *tail;

void *mem_malloc(size_t size)
{
    // total size of allocated _blocks
    size_t total_size;
    // simple pointer to the future _block
    void *_block;

    struct Tblock *h;

    // check in case size < 0
	if (size < 1)
        return NULL;

    h = get_Tblock(size);

    // if free _block was found,
    // then it sets as 'not free', release lock and return _block
    if (h) {
  		h->is_free = 0;
  		return (void*)(h + 1);
    }

    // total_size = allocated mem + requested mem size
    total_size = sizeof(struct Tblock) + size;

    // allocate a new a _block
    _block = sbrk(total_size);

    // if allocation was not successfull, it releases lock, returns Null
	if (_block == (void*) -1) {
		return NULL;
  }

    // otherwise assigns to the h
	h = _block;
	h->size = size;
	h->is_free = 0;
    h->next = NULL;

	if (!head)
        head = h;

    // add new h to the end of linked list
	if (tail)
        tail->next = h;

    tail = h;

    return (void*)(h + 1);
}

struct Tblock *get_Tblock(size_t size)
{
  // loop through the linked list
  // if free _block found, return pointer to it
  struct Tblock *curr = head;
  while(curr) {
  	if (curr->is_free && curr->size >= size)
  		return curr;
  	curr = curr->next;
  }
  return NULL;
}

void mem_free(void *_block)
{
	struct Tblock *h, *tmp;
	void *programbreak;

	if (!_block)
		return;

  // get previous h
	h = (struct Tblock*)_block - 1;

  // get current value of program break
	programbreak = sbrk(0);

  // check if it was freed
	if ((char*)_block + h->size == programbreak) {

		if (head == tail) {
			head = tail = NULL;
		} else {
			tmp = head;
			while (tmp) {
				if(tmp->next == tail) {
					tmp->next = NULL;
					tail = tmp;
				}
				tmp = tmp->next;
			}
		}
		sbrk(0 - sizeof(struct Tblock) - h->size);
		return;
	}
	h->is_free = 1;
}

void *mem_realloc(void *_block, size_t size)
{
  // initializing variable
	struct Tblock *h;
	void *ret;

  // if there is no block or size is not give
	if (!_block || !size)
		return mem_malloc(size);

  // set to the header previouse block 
	h = (struct Tblock*)_block - 1;

  if (h->size >= size)
		return _block;

	ret = mem_malloc(size);

	if (ret) {
		memcpy(ret, _block, h->size);
		mem_free(_block);
	}

	return ret;
}
