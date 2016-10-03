# PrimeNumbers
[![Build Status](https://travis-ci.org/TrevorRawlings/FundingCircle.png)](https://travis-ci.org/TrevorRawlings/FundingCircle)
[![Code Climate](https://codeclimate.com/github/TrevorRawlings/FundingCircle/badges/gpa.svg)](https://codeclimate.com/github/TrevorRawlings/FundingCircle)
[![Test Coverage](https://codeclimate.com/github/TrevorRawlings/FundingCircle/badges/coverage.svg)](https://codeclimate.com/github/TrevorRawlings/FundingCircle/coverage)

## Objective

Write a program that prints out a multiplication table of the first 10 prime number.
* The program must run from the command line and print one table to STDOUT.
* The first row and column of the table should have the 10 primes, with each cell
containing the product of the primes for the corresponding row and column.

### Notes
* Consider complexity. How fast does your code run? How does it scale?
* Consider cases where we want N primes.
* Do not use the Prime class from stdlib (write your own code).
* Write tests. Try to demonstrate TDD/BDD.
* If you’re using external dependencies please specify those dependencies and how to
install them.
* Please package your code, OR include running instructions.
When you’re done
Put your code on GitHub or email us a zip/tarball.
Thanks!


## Running
```
 ruby ./prime_numbers.rb
```

### Expected output
```
~/projects/fundingcircle$ ./prime_numbers.rb
    2   3   5   7   11  13  17  19  23  29
2   4   6   10  14  22  26  34  38  46  58
3   6   9   15  21  33  39  51  57  69  87
5   10  15  25  35  55  65  85  95  115 145
7   14  21  35  49  77  91  119 133 161 203
11  22  33  55  77  121 143 187 209 253 319
13  26  39  65  91  143 169 221 247 299 377
17  34  51  85  119 187 221 289 323 391 493
19  38  57  95  133 209 247 323 361 437 551
23  46  69  115 161 253 299 391 437 529 667
29  58  87  145 203 319 377 493 551 667 841
```

### Options
The size of the table can be controlled with the `-s` argument. 

```
prime_numbers.rb [options]
    -s, --size number              Size of the table
```

## Tests
Rspec tests are in the [./spec](https://github.com/TrevorRawlings/FundingCircle/tree/master/spec)
directory. Code coverage is available on [codeclimate](https://codeclimate.com/github/TrevorRawlings/FundingCircle/coverage)
```
bundle install; bundle exec rspec
```

## Implementations of the prime number generator
Two generators have been implemented. The first and simplest generator 
tests each number in turn by dividing it by all previous numbers. This 
is clearly efficient but for sequences of less than 10 it is 
not significantly slower than the alternative [SieveOfEratosthenes](https://github.com/TrevorRawlings/FundingCircle/blob/master/lib/generators/sieve_of_eratosthenes.rb)
approach.

If this program is only intended for generating relatively small tables 
(where n < 100) I consider the [simple approach](https://github.com/TrevorRawlings/FundingCircle/blob/master/lib/generators/simple_prime_generator.rb) 
a good compromise. If 500 or more prime numbers are required then the 
simple approach takes a noticeable length of time and the 
slightly more complex Sieve of Eratosthenes preforms better 
(see the performance tests below).

## Performance tests
The scripts directory contains [benchmark.rb](https://github.com/TrevorRawlings/FundingCircle/blob/master/scripts/benchmark.rb)
that tests the time taken to generate the first 10, 50, 100 and 500 prime
 numbers. On my machine it generates the following output:
```
allin@trevor-dev:~/projects/fundingcircle$ ./scripts/benchmark.rb
Testing the PrimeNumbers::SimplePrimeGenerator (each test is repeated 100 times)

                         total test time     time taken find each prime number
first 10 prime numbers   0.00165             1.5e-05
first 50 prime numbers   0.0514              0.000342
first 100 prime numbers  0.176               0.000882
first 500 prime numbers  5.52                0.00921

Testing the PrimeNumbers::SieveOfEratosthenes (each test is repeated 100 times)

                         total test time     time taken find each prime number
first 10 prime numbers   0.00141             1.28e-05
first 50 prime numbers   0.00953             6.35e-05
first 100 prime numbers  0.0274              0.000137
first 500 prime numbers  0.153               0.000254
```

When the application is asked to generate 10 prime numbers the simple 
implementation executes so quickly that the more complicated 
SieveOfEratosthenes doesn't seem necessary.

When asked to generate a very large table the amount of memory used by the 
[sieve](https://github.com/TrevorRawlings/FundingCircle/blob/master/lib/generators/sieve_of_eratosthenes.rb#L35)
and by the [ProductsTable](https://github.com/TrevorRawlings/FundingCircle/blob/master/lib/products_table.rb#L12-L14)
would become an issue. 
 
An [incremental sieve](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Incremental_sieve)
would reduce the amount of memory required when generating the primes. 
The full list of primes is needed before the first line of the table can 
be written but memory consumption would be reduced if each line of the
table was written to stdout as soon as the products for that row had 
been calculated.  

## Packaging
PrimeNumbers has been packaged using [traveling-ruby](http://phusion.github.io/traveling-ruby/).

Packages are available for [linux](https://github.com/TrevorRawlings/FundingCircle/blob/master/prime_numbers-1.0.0-linux-x86.tar.gz?raw=true),
[linux-64](https://github.com/TrevorRawlings/FundingCircle/blob/master/prime_numbers-1.0.0-linux-x86_64.tar.gz?raw=true) 
and [OSX](https://github.com/TrevorRawlings/FundingCircle/blob/master/prime_numbers-1.0.0-osx.tar.gz?raw=true), 
although only linux-64 package has been tested (sorry, I don't have easy 
access to the other environments).
 
To run: Download the above package, extract it and run `prime_numbers`:
```bash
wget https://github.com/TrevorRawlings/FundingCircle/blob/master/prime_numbers-1.0.0-linux-x86_64.tar.gz?raw=true
...
tar xzf prime_numbers-1.0.0-linux-x86_64.tar.gz?raw=true
cd prime_numbers-1.0.0-linux-x86_64
./prime_numbers
```
