# Ruby_Thingy

Work Sample aimed at normalizing csv files along provided specifications 
with coding time timeboxed to "less than 4 hours of actual coding time".

## Getting Started

Funtionality verified on
Mac OS X 10.11 and Ubuntu 14.04 (via Cloud9 container)

### Prerequisites

Ruby 2.2 and 2.3 verified

Assumes bundler installed

If not:
```
$ gem install bundler
```

### Installing
To Clone:
```
$ git clone https://github.com/TheObtuseAutodidact/ruby_thingy.git
```
cd into directory 
```
$ cd ruby_thingy
```

and run bundler

```
$ bundle install
```

## Running the tests

Simply enter
```
$ rspec
```
(Unit tests only)


## Use
From inside of ruby_thingy directory
```
$ ruby lib/ruby_thing.rb <path/to/your/csv/file>
```
This will generate `cleaned_file.csv` and drop it into the
ruby_thingy directory. The file will over written on subsequent runs of the program.

