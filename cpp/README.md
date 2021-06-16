# C++ Mock-Driven Unit Testing with Google Test

This repository will require some manual configuration for your environments.

## Getting Started

Please make sure you have C++ compiler available in your environment path, as well as `cmake`. If
you satisfy this requirement, then you can simply run the following to build and kick-off the tests.

### CMaking
Simply `cd` to wherever you have cloned this code. Create a `build` directory and move inside.
Run `cmake ..`.

### Testing
Once `cmake` has done it's, and you have a `build` folder present in this directory, simply run
`ctest --test-dir build` and you _should_ see a failing test, as expected.

## Add a mock

1- If you want to add mock. Add it inside the directory `Tests/include`.
2- Modify the `Tests/CMakeLists.txt` inside the line 15 setter. You could add your file like this

```bash
    set (HEADERS
        ${HEADER_DIR}/MockUserRepository.h
        ${HEADER_DIR}/MySuperMock.h
    )
```

3- Save and build again and have fun !

## Add a file

1- If you want to add file. Add it inside the wished directory.
2- Modify the `CMakeLists.txt` close to it by adding your file path in the headers or sources.

```bash
    set (HEADERS
        ${HEADER_DIR}/MySuperHeader.h
    )
```

3- Save and build again and have fun !