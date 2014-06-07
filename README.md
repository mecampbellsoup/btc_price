# BTC Price

## What does it do?

From within your Code (or really any) directory, run:

`git clone git@github.com:mecampbellsoup/btc_price.git`;

then:

`cd btc_price`.

If you do not have the [`memcached`](https://github.com/evan/memcached) gem, go get it:

`gem install memcached`.

Next, start (and immediately background) your cache process with:

`memcached -p 11211 &`;

and finally you can run the executable:

`./bin/btc_price`.

You should see some content in STDOUT like this:

```bash
External services status: Good.
Current BTC price: $622.21.
```

If you run the executable again (`./bin/btc_price`), you'll notice it's much faster. This is because the library uses [`memcached`](https://github.com/evan/memcached) to cache the BTC price and avoid making redundant API requests.

# Why did I write this library?

I wrote this small library initially to learn about caching and how to implement it in Ruby.

We started using a text file for caching and later on switched to `Memcached`.

I like to hack on this on the weekends in order to improve my OOP and design skills.
