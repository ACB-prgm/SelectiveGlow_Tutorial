extends AnimatedSprite


onready var hotParticles = $HotParticles
onready var partsParticles = $ExplosionParticlesParts


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()
	hotParticles.set_emitting(true)
	partsParticles.set_emitting(true)


func _on_ResetTimer_timeout():
	self.set_frame(0)
	hotParticles.restart()
	partsParticles.restart()
	
	self.play()
	hotParticles.set_emitting(true)
	partsParticles.set_emitting(true)
