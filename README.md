# On the feasibility for the system of quadratic equations

Code for cutting convex parts from a quadratic image

## Prerequisites
* MATLAB
* CVX

## Installing
See [doc/readme.pdf](doc/readme.pdf) file

## Testing
To test separate functions run in MATLAB from root directory:
```
>> cd tests
>> runtests('testFunctions')
```

Result should be like the following:
```
Totals:
   15 Passed, 0 Failed, 0 Incomplete.
   45.7854 seconds testing time.
```

Moreover, see [tests/testCAQM.m](tests/testCAQM.m) as an example of library usage.

```
>> cd tests
>> testCAQM
```

Should give output ending with `TEST PASSED`.
A [Youtube video](https://youtu.be/Ikh_GDHnu-4 "Certificate cutting: z_max test") demonstrates how the test normally performs.

For more information see [doc/readme.pdf](doc/readme.pdf)

## License
See [LICENSE.txt](LICENSE.txt)

## Files and folders
* / -- main functions (see [doc/readme.pdf](doc/readme.pdf))
* [library/](library/) -- supplementary functions (see [doc/library.pdf](doc/library.pdf))
* [doc/](doc/) -- documentation
* [examples/figures/](examples/figures/) -- code for drawing figures from the article
* [examples/maps](examples/maps/) -- sample quadratic maps
* [tests/](tests/) -- code for testing the setup on each machine

## Further reading
Refer to the documentation in [doc/readme.pdf](doc/readme.pdf) and the article

Copyright (c) 2015-2017 Anatoly Dymarsky, Elena Gryazina, Sergei Volodin, Boris Polyak
