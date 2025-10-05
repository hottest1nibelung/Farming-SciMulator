extends Node

signal ai_response(text: String)

var base_url := "http://localhost:11434/api/generate"
var model := "mistral"
var http_request: HTTPRequest

# <<<--- Just put your NASA resources here
var resources := """
You are an AI with access to NASA resources.
Here are some useful references:

Astronauts in space sometimes get itchy noses — but they can’t just lift their hand to scratch. They use a little foam “Valsalva” device inside their helmet to itch their nose. 
Astronomy
+1

On July 21, 1969, the first meal eaten on the Moon included bacon, peaches, sugar cookie squares, a pineapple-grapefruit drink, and coffee. 
Astronomy

Giant storms on Neptune are large enough to swallow Earth. 
NASA

In microgravity (space), boiling is weird: vapor bubbles don’t float away because there’s no buoyancy — they stay attached to the heat source and grow, which can disrupt cooling systems. 
NASA

NASA’s astronaut Scott Kelly spent 340 days in space, during which he interacted with only 12 people (while aboard the International Space Station). 
NASA

NASA has sent over 2,200 animals into space — from insects to pigs to spiders — to study biological effects of microgravity. 
thefactsite.com
"""

func _ready() -> void:
	http_request = HTTPRequest.new()
	add_child(http_request)

# Send user input to Ollama
func send_to_ai(prompt: String) -> void:
	var headers = ["Content-Type: application/json"]

	# Combine resources with user prompt
	var full_prompt = resources + "\n\nUser: " + prompt

	var body = {
		"model": model,
		"prompt": full_prompt,
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
