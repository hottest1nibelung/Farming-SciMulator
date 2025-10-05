extends Node

signal ai_response(text: String)

var base_url := "http://localhost:11434/api/generate"
var model := "mistral"
var http_request: HTTPRequest

func _ready() -> void:
	http_request = HTTPRequest.new()
	add_child(http_request)

# Send user input to Ollama
func send_to_ai(prompt: String) -> void:
	var headers = ["Content-Type: application/json"]
	var body = {
		"model": model,
		"prompt": prompt,
		"stream": false
	}

	if http_request.is_connected("request_completed", Callable(self, "_on_request_completed")):
		http_request.disconnect("request_completed", Callable(self, "_on_request_completed"))

	var err = http_request.request(
		base_url,
		headers,
		HTTPClient.METHOD_POST,
		JSON.stringify(body)
	)

	if err != OK:
		emit_signal("ai_response", "[Error: Request failed]")
	else:
		http_request.connect("request_completed", Callable(self, "_on_request_completed"), CONNECT_ONE_SHOT)

# Handle Ollama response
func _on_request_completed(result, response_code, headers, body) -> void:
	if response_code == 200:
		var data = JSON.parse_string(body.get_string_from_utf8())
		if typeof(data) == TYPE_DICTIONARY and data.has("response"):
			emit_signal("ai_response", data["response"])
		else:
			emit_signal("ai_response", "[Error: No valid response]")
	else:
		emit_signal("ai_response", "[Error: Server issue]")
