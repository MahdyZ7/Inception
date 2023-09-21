to build and run the container
```
docker build -t green-leaf .
```

to run the container
```
docker run --init -dp 127.0.0.1:3000:3000 green-leaf
```

Makke is there for ease