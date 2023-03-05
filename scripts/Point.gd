extends Control

func on_get_item(point: int):
	$Label.text = str(int($Label.text) + point).pad_zeros(4)
