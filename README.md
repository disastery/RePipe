# RePipe

RePipe is a lightweight and efficient Golang-based HTTP proxy service designed to relay and facilitate the flow of HTTP traffic between clients and servers. It acts as an intermediary, providing a flexible and customizable solution for routing, forwarding, and managing HTTP requests and responses.
Features

- Proxy Routing: Easily configure rules to route HTTP requests to different backend servers based on various criteria such as URL patterns, headers, or IP addresses.
- Load Balancing: Distribute incoming traffic across multiple backend servers using different load balancing strategies (round-robin, least connections, etc.).
- Caching: Improve performance by caching frequently accessed responses, reducing the load on backend servers.
- Filtering and Transformation: Modify HTTP requests and responses on-the-fly by applying filters, rewriting headers, or transforming content.
- Authentication and Authorization: Implement authentication and authorization mechanisms to secure access to backend services.
- Logging and Monitoring: Comprehensive logging and monitoring capabilities to track and analyze HTTP traffic.

### But, what about Nginx?
While Nginx is a powerful web server, its complexity can be overwhelming, especially for small-scale deployments.
RePipe aims to provide a simpler, more lightweight alternative that focuses on the core functionality of an HTTP proxy 
without the additional features and complexity of a full-fledged web server like Nginx.

## Development

### Build

```
# If golang is missing then install go using the helper script.
$>sh setup_go.sh
```

```
Then build the Program
$>make default 

(or make osx, or make windows)

# All builds are located under `builds` folder
```

### Install (Only supported for Linux)

```
$>sudo make install
```

Installation will create a file `/etc/repipe/app.env`.

Edit this file for the DOMAINS you wish to serve.

### Where are my `logs`?

Logs are located under `/var/log/repipe/repipe.log`

### Is it `Fast`?

We don't know, you can run tests! Send a PR with numbers.
But, it is easy to configure and gets the job done.
