class_name Quest extends QuestManager

func start_quest() -> void:
	print("start quest")
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		# TODO update ui
		
		
func reached_goal() -> void:
	print("reached goal")
	if quest_status == QuestStatus.started:
		quest_status = QuestStatus.reached_goal
		# TODO update ui
		
func finish_quest() -> void:
	print("finished quest")
	if quest_status == QuestStatus.reached_goal:
		quest_status = QuestStatus.finished
		# TODO update UI
