# google-or-tools-template
Example Google OR-tools Dockerfile 

#### Build Image
```
docker build -t test-or-tools .
```

Run & execute cmd inside container to test whether knapsack binary work.
```
docker run -it --rm test-or-tools bash
```

Then you should get output as follows

<img width="573" alt="Screen Shot 2564-06-27 at 02 36 53" src="https://user-images.githubusercontent.com/13428859/123523891-12743480-d6f1-11eb-882f-e2a1c200e758.png">
