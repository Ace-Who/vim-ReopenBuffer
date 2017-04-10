# vim-ReopenBuffer

Reopen the recently closed buffer in a new tab page.

## Usage

```vimL
:ReopenBuffer [{index}]
```

`{index}` is an zero-based integer which indicates the position in a List where
the closed buffers are stored. The default is `0` and refers to the most
recently closed buffer. At most 100 buffers are stored.

A negative index is counted from the end. Index `-1` refers to the most early
closed buffer in the List.

## Limitation

Doesn't change the recently closed buffer if the closed buffer is still visible
in another window, 
