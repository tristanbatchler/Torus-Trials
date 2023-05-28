///@description draw_speech(speaker_x, speaker_y, speech_texts)
///@param speaker_x
///@param speaker_y
///@param speech_texts

function draw_speech(speaker_x, speaker_y, speech_texts) {

	instance_create_layer(speaker_x, speaker_y, "Instances", obj_speechbox, {
		texts: speech_texts	
	});

}