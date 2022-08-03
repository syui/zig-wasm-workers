```vim
Plug 'ziglang/zig.vim'
```

```sh
$ zig build -Dtarget=wasm32-wasi
$ ls zig-out/bin/*.wasm
$ echo "Hello\nWorld" | wasmtime ./zig-out/bin/*.wasm
1       Hello
2       World

$ npx wrangler@wasm login
$ npx wrangler@wasm publish --name print-with-line-numbers --compatibility-date=2022-07-07  ./zig-out/bin/*.wasm
```
