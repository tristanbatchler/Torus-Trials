///@description draw_speech(speaker, speech_texts)
///@param speaker
///@param speech_texts

function draw_speech(speaker, speech_texts) {
	
	speaker.speaking = true;

	instance_create_layer(speaker.x, speaker.bbox_top - 32, "Instances", obj_speechbox, {
		texts: speech_texts,
		speaker: speaker
	});

}