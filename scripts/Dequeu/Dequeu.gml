//Function to dequeue specific item from a ds_queue
function dequeu(original_queue, to_deque)
{
	var tempQueue = ds_queue_create();
	while (!ds_queue_empty(original_queue)) {
	    var item = ds_queue_dequeue(original_queue);
	    // Check if the item is the one you want to remove
	    if (item != to_deque) {
	        // Add the item to the temporary queue
	        ds_queue_enqueue(tempQueue, item);
	    }
	}
	// Destroy the original queue
	ds_queue_destroy(original_queue);
	// Return the new ID of the queue
	return tempQueue;
}