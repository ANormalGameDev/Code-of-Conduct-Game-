extends Area2D

signal interacted(package: Package)

func interact(package: Package):
	interacted.emit(package)
