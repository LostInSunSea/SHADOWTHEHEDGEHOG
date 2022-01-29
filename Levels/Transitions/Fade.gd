extends CanvasLayer

signal transitioned

func transition():
	$AnimationPlayer.play("FadeToBlack")
	print("fading to black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "FadeToBlack"):
		emit_signal("transitioned")
		print("transitioned signal emitted")
		$AnimationPlayer.play("FadeToNormal")
	if(anim_name == "FadeToNormal"):
		print("done transitioning")
		

