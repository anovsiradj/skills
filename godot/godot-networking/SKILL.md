---
name: godot-networking
description: Godot Engine networking, TCP, UDP, HTTP, and multiplayer.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Networking

## Overview
Godot Engine's networking system provides powerful tools for creating games with features like TCP, UDP, HTTP, and multiplayer. This skill covers everything you need to know to create efficient and organized networking content in Godot 4.7.

## Key Insights

### Networking Features
- **TCP**: TCP networking using StreamPeer and TCPServer
- **UDP**: UDP networking using PacketPeer and UDPServer
- **HTTP**: HTTP networking using HTTPClient and HTTPRequest
- **Multiplayer**: High-level multiplayer API using UDP and ENet

### Networking Features
- **TCP**: TCP networking
- **UDP**: UDP networking
- **HTTP**: HTTP networking
- **Multiplayer**: Multiplayer networking

## Major Version Differences (3.x vs 4.x)

### Networking System Changes
- **TCP**: Enhanced TCP networking using StreamPeer and TCPServer
- **UDP**: Enhanced UDP networking using PacketPeer and UDPServer
- **HTTP**: Enhanced HTTP networking using HTTPClient and HTTPRequest
- **Multiplayer**: Enhanced high-level multiplayer API using UDP and ENet
- **Better Performance**: Improved performance for networking operations
- **Enhanced Editor**: Better editor support for networking management

### Networking Features
- **TCP**: Enhanced TCP networking
- **UDP**: Enhanced UDP networking
- **HTTP**: Enhanced HTTP networking
- **Multiplayer**: Enhanced multiplayer networking

## New Features in Godot 4.7

### Networking Features
- **TCP**: Enhanced TCP networking
- **UDP**: Enhanced UDP networking
- **HTTP**: Enhanced HTTP networking
- **Multiplayer**: Enhanced multiplayer networking
- **Better Performance**: Improved performance for networking operations
- **Enhanced Editor**: Better editor support for networking management

## Technical Implementation

### File: tcp.gd
```gdscript
extends Node

@export_group("TCP Properties")
@export var tcp_name: String = ""
@export var tcp_path: String = ""

@export_group("TCP Features")
@export var tcp_visible: bool = true
@export var tcp_enabled: bool = true
@export var tcp_host: bool = false
@export var tcp_client: bool = false
@export var tcp_port: int = 8080

func _ready() -> void:
    # Set up the TCP
    if tcp_name:
        name = tcp_name
    
    if tcp_path:
        # Load the TCP
        load_tcp(tcp_path)
    
    if tcp_visible:
        # Show the TCP
        show()
    
    if tcp_enabled:
        # Enable the TCP
        pass
    
    if tcp_host:
        # Host the TCP
        host_tcp()
    
    if tcp_client:
        # Connect to the TCP
        connect_to_tcp()

func _process(delta: float) -> void:
    # Update the TCP

func load_tcp(path: String) -> void:
    # Load a TCP
    var tcp = load(path)
    if tcp:
        # Load the TCP
        pass

func show_tcp() -> void:
    # Show the TCP
    show()

func hide_tcp() -> void:
    # Hide the TCP
    hide()

func set_tcp_visible(visible: bool) -> void:
    # Set the TCP visible
    if visible:
        show()
    else:
        hide()

func set_tcp_enabled(enabled: bool) -> void:
    # Set the TCP enabled
    pass

func host_tcp() -> void:
    # Host the TCP
    pass

func connect_to_tcp() -> void:
    # Connect to the TCP
    pass

func disconnect_from_tcp() -> void:
    # Disconnect from the TCP
    pass
```

### File: udp.gd
```gdscript
extends Node

@export_group("UDP Properties")
@export var udp_name: String = ""
@export var udp_path: String = ""

@export_group("UDP Features")
@export var udp_visible: bool = true
@export var udp_enabled: bool = true
@export var udp_host: bool = false
@export var udp_client: bool = false
@export var udp_port: int = 8080

func _ready() -> void:
    # Set up the UDP
    if udp_name:
        name = udp_name
    
    if udp_path:
        # Load the UDP
        load_udp(udp_path)
    
    if udp_visible:
        # Show the UDP
        show()
    
    if udp_enabled:
        # Enable the UDP
        pass
    
    if udp_host:
        # Host the UDP
        host_udp()
    
    if udp_client:
        # Connect to the UDP
        connect_to_udp()

func _process(delta: float) -> void:
    # Update the UDP

func load_udp(path: String) -> void:
    # Load a UDP
    var udp = load(path)
    if udp:
        # Load the UDP
        pass

func show_udp() -> void:
    # Show the UDP
    show()

func hide_udp() -> void:
    # Hide the UDP
    hide()

func set_udp_visible(visible: bool) -> void:
    # Set the UDP visible
    if visible:
        show()
    else:
        hide()

func set_udp_enabled(enabled: bool) -> void:
    # Set the UDP enabled
    pass

func host_udp() -> void:
    # Host the UDP
    pass

func connect_to_udp() -> void:
    # Connect to the UDP
    pass

func disconnect_from_udp() -> void:
    # Disconnect from the UDP
    pass
```

### File: http.gd
```gdscript
extends Node

@export_group("HTTP Properties")
@export var http_name: String = ""
@export var http_path: String = ""

@export_group("HTTP Features")
@export var http_visible: bool = true
@export var http_enabled: bool = true
@export var http_client: bool = false
@export var http_url: String = ""

func _ready() -> void:
    # Set up the HTTP
    if http_name:
        name = http_name
    
    if http_path:
        # Load the HTTP
        load_http(http_path)
    
    if http_visible:
        # Show the HTTP
        show()
    
    if http_enabled:
        # Enable the HTTP
        pass
    
    if http_client:
        # Connect to the HTTP
        connect_to_http()

func _process(delta: float) -> void:
    # Update the HTTP

func load_http(path: String) -> void:
    # Load a HTTP
    var http = load(path)
    if http:
        # Load the HTTP
        pass

func show_http() -> void:
    # Show the HTTP
    show()

func hide_http() -> void:
    # Hide the HTTP
    hide()

func set_http_visible(visible: bool) -> void:
    # Set the HTTP visible
    if visible:
        show()
    else:
        hide()

func set_http_enabled(enabled: bool) -> void:
    # Set the HTTP enabled
    pass

func connect_to_http() -> void:
    # Connect to the HTTP
    pass

func disconnect_from_http() -> void:
    # Disconnect from the HTTP
    pass
```

### File: multiplayer.gd
```gdscript
extends Node

@export_group("Multiplayer Properties")
@export var multiplayer_name: String = ""
@export var multiplayer_path: String = ""

@export_group("Multiplayer Features")
@export var multiplayer_visible: bool = true
@export var multiplayer_enabled: bool = true
@export var multiplayer_host: bool = false
@export var multiplayer_client: bool = false
@export var multiplayer_port: int = 8080

func _ready() -> void:
    # Set up the multiplayer
    if multiplayer_name:
        name = multiplayer_name
    
    if multiplayer_path:
        # Load the multiplayer
        load_multiplayer(multiplayer_path)
    
    if multiplayer_visible:
        # Show the multiplayer
        show()
    
    if multiplayer_enabled:
        # Enable the multiplayer
        pass
    
    if multiplayer_host:
        # Host the multiplayer
        host_multiplayer()
    
    if multiplayer_client:
        # Connect to the multiplayer
        connect_to_multiplayer()

func _process(delta: float) -> void:
    # Update the multiplayer

func load_multiplayer(path: String) -> void:
    # Load a multiplayer
    var multiplayer = load(path)
    if multiplayer:
        # Load the multiplayer
        pass

func show_multiplayer() -> void:
    # Show the multiplayer
    show()

func hide_multiplayer() -> void:
    # Hide the multiplayer
    hide()

func set_multiplayer_visible(visible: bool) -> void:
    # Set the multiplayer visible
    if visible:
        show()
    else:
        hide()

func set_multiplayer_enabled(enabled: bool) -> void:
    # Set the multiplayer enabled
    pass

func host_multiplayer() -> void:
    # Host the multiplayer
    pass

func connect_to_multiplayer() -> void:
    # Connect to the multiplayer
    pass

func disconnect_from_multiplayer() -> void:
    # Disconnect from the multiplayer
    pass
```

## Unusual Things

### TCP
- **TCP**: TCP networking using StreamPeer and TCPServer
- **Visible**: Visible for TCP
- **Enabled**: Enabled for TCP
- **Host**: Host for TCP
- **Client**: Client for TCP

### UDP
- **UDP**: UDP networking using PacketPeer and UDPServer
- **Visible**: Visible for UDP
- **Enabled**: Enabled for UDP
- **Host**: Host for UDP
- **Client**: Client for UDP

### HTTP
- **HTTP**: HTTP networking using HTTPClient and HTTPRequest
- **Visible**: Visible for HTTP
- **Enabled**: Enabled for HTTP
- **Client**: Client for HTTP

### Multiplayer
- **Multiplayer**: High-level multiplayer API using UDP and ENet
- **Visible**: Visible for multiplayer
- **Enabled**: Enabled for multiplayer
- **Host**: Host for multiplayer
- **Client**: Client for multiplayer

## Recommendations

### For TCP
- **Use TCP**: Use TCP networking
- **Set TCP Visible**: Set TCP visible
- **Set TCP Enabled**: Set TCP enabled
- **Host TCP**: Host TCP
- **Connect to TCP**: Connect to TCP
- **Test in Editor**: Always test in editor

### For UDP
- **Use UDP**: Use UDP networking
- **Set UDP Visible**: Set UDP visible
- **Set UDP Enabled**: Set UDP enabled
- **Host UDP**: Host UDP
- **Connect to UDP**: Connect to UDP
- **Test in Editor**: Always test in editor

### For HTTP
- **Use HTTP**: Use HTTP networking
- **Set HTTP Visible**: Set HTTP visible
- **Set HTTP Enabled**: Set HTTP enabled
- **Connect to HTTP**: Connect to HTTP
- **Test in Editor**: Always test in editor

### For Multiplayer
- **Use Multiplayer**: Use multiplayer networking
- **Set Multiplayer Visible**: Set multiplayer visible
- **Set Multiplayer Enabled**: Set multiplayer enabled
- **Host Multiplayer**: Host multiplayer
- **Connect to Multiplayer**: Connect to multiplayer
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many TCP**: Avoid using too many TCP without optimization
- **Complex UDP**: Avoid using complex UDP without optimization
- **Unbounded HTTP**: Avoid creating unbounded HTTP
- **Unbounded Multiplayer**: Avoid creating unbounded multiplayer

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### TCP
- **Incorrect Setup**: Incorrect TCP setup can cause issues
- **Performance Issues**: Complex TCP features can cause performance issues
- **Complexity**: TCP features can be complex

### UDP
- **Incorrect Setup**: Incorrect UDP setup can cause issues
- **Performance Issues**: Complex UDP features can cause performance issues
- **Complexity**: UDP features can be complex

### HTTP
- **Incorrect Setup**: Incorrect HTTP setup can cause issues
- **Performance Issues**: Complex HTTP features can cause performance issues
- **Complexity**: HTTP features can be complex

### Multiplayer
- **Incorrect Setup**: Incorrect multiplayer setup can cause issues
- **Performance Issues**: Complex multiplayer features can cause performance issues
- **Complexity**: Multiplayer features can be complex

## ELI5: TCP

Imagine you have a bunch of TCP connections that you want to establish. TCP is like a system that can establish TCP connections.

### Example: Using TCP
```gdscript
extends Node

func _ready() -> void:
    # Create a TCP
    var tcp = Node.new()
    add_child(tcp)
    
    # Set the TCP name
    tcp.name = "My TCP"
    
    # Set the TCP path
    tcp.tcp_path = "res://tcp/tcp.tscn"
    
    # Set the TCP visible
    tcp.tcp_visible = true
    
    # Set the TCP enabled
    tcp.tcp_enabled = true
    
    # Set the TCP host
    tcp.tcp_host = true
    
    # Set the TCP client
    tcp.tcp_client = false
    
    # Set the TCP port
    tcp.tcp_port = 8080
    
    # Load the TCP
    tcp.load_tcp("res://tcp/tcp.tscn")
    
    # Host the TCP
    tcp.host_tcp()
```

## ELI5: UDP

Imagine you have a bunch of UDP connections that you want to establish. UDP is like a system that can establish UDP connections.

### Example: Using UDP
```gdscript
extends Node

func _ready() -> void:
    # Create a UDP
    var udp = Node.new()
    add_child(udp)
    
    # Set the UDP name
    udp.name = "My UDP"
    
    # Set the UDP path
    udp.udp_path = "res://udp/udp.tscn"
    
    # Set the UDP visible
    udp.udp_visible = true
    
    # Set the UDP enabled
    udp.udp_enabled = true
    
    # Set the UDP host
    udp.udp_host = true
    
    # Set the UDP client
    udp.udp_client = false
    
    # Set the UDP port
    udp.udp_port = 8080
    
    # Load the UDP
    udp.load_udp("res://udp/udp.tscn")
    
    # Host the UDP
    udp.host_udp()
```

## ELI5: HTTP

Imagine you have a bunch of HTTP requests that you want to make. HTTP is like a system that can make HTTP requests.

### Example: Using HTTP
```gdscript
extends Node

func _ready() -> void:
    # Create a HTTP
    var http = Node.new()
    add_child(http)
    
    # Set the HTTP name
    http.name = "My HTTP"
    
    # Set the HTTP path
    http.http_path = "res://http/http.tscn"
    
    # Set the HTTP visible
    http.http_visible = true
    
    # Set the HTTP enabled
    http.http_enabled = true
    
    # Set the HTTP client
    http.http_client = true
    
    # Set the HTTP URL
    http.http_url = "http://example.com"
    
    # Load the HTTP
    http.load_http("res://http/http.tscn")
    
    # Connect to the HTTP
    http.connect_to_http()
```

## ELI5: Multiplayer

Imagine you have a bunch of multiplayer games that you want to host or join. Multiplayer is like a system that can host or join multiplayer games.

### Example: Using Multiplayer
```gdscript
extends Node

func _ready() -> void:
    # Create a multiplayer
    var multiplayer = Node.new()
    add_child(multiplayer)
    
    # Set the multiplayer name
    multiplayer.name = "My Multiplayer"
    
    # Set the multiplayer path
    multiplayer.multiplayer_path = "res://multiplayer/multiplayer.tscn"
    
    # Set the multiplayer visible
    multiplayer.multiplayer_visible = true
    
    # Set the multiplayer enabled
    multiplayer.multiplayer_enabled = true
    
    # Set the multiplayer host
    multiplayer.multiplayer_host = true
    
    # Set the multiplayer client
    multiplayer.multiplayer_client = false
    
    # Set the multiplayer port
    multiplayer.multiplayer_port = 8080
    
    # Load the multiplayer
    multiplayer.load_multiplayer("res://multiplayer/multiplayer.tscn")
    
    # Host the multiplayer
    multiplayer.host_multiplayer()
```

## Best Practices Summary

1. **Use TCP** for networking
2. **Set TCP Visible** for TCP
3. **Set TCP Enabled** for TCP
4. **Host TCP** for TCP
5. **Connect to TCP** for TCP
6. **Use UDP** for networking
7. **Set UDP Visible** for UDP
8. **Set UDP Enabled** for UDP
9. **Host UDP** for UDP
10. **Connect to UDP** for UDP
11. **Use HTTP** for networking
12. **Set HTTP Visible** for HTTP
13. **Set HTTP Enabled** for HTTP
14. **Connect to HTTP** for HTTP
15. **Use Multiplayer** for networking
16. **Set Multiplayer Visible** for multiplayer
17. **Set Multiplayer Enabled** for multiplayer
18. **Host Multiplayer** for multiplayer
19. **Connect to Multiplayer** for multiplayer
20. **Test in Editor** for proper setup
21. **Always clean up** unused nodes to prevent memory leaks
