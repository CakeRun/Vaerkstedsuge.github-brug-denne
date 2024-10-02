extends Area2D


func _on_body_entered(body):
	if body.has_method("player"):
		GameManager.player_heal = true
		await get_tree().create_timer(0.01).timeout
		GameManager.player_heal = false
		self.queue_free()
