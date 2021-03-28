extends Control

signal fillField(text_)
signal close

var textValue=""

func eraseLetter():
	
	var textLength=getText().length()
	if textLength>0:
		var newText= getText().substr(0, textLength-1)
		updateField(newText)
	
func addLetter(letter_):
	var newText=getText()+letter_
	updateField(newText)

func updateField(text_):
	textValue=text_
	$VBox/Label.text=textValue

func getText():
	return textValue

func reset():
	updateField("")


# Called when the node enters the scene tree for the first time.
func _ready():
	build()
	pass # Replace with function body.


func build():
	var templateButton=$Button
	
	var letterList=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","-"]
	
	for letter in letterList:
		var newLetterBtn=templateButton.duplicate()

		newLetterBtn.connect("button_down",self,"_on_button_pressed",[letter])

		newLetterBtn.text=" "+letter+" "
		$VBox/GridContainer.add_child(newLetterBtn)
	

func _on_button_pressed(letter_):
	addLetter(letter_)


func _on_submit_button_down():
	emit_signal("fillField",getText())


func _on_erase_button_down():
	eraseLetter()


func _on_Retour_button_down():
	emit_signal("close")
