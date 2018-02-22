import socket from './socket'
(function() {
    if (document.getElementById('id')) {
        const id = document.getElementById('id').dataset.id || undefined
    } else {
        return
    }

    const channel = socket.channel("event:" + id, {})

    // update
    channel.on("update_quantity", event => {
        // console.log("Update", event)
        document.getElementById('quantity').textContent = event.quantity
    })

    channel.join()
    .receive("ok", resp => console.log(`Joined succesfully event: ${id}`, resp))
    .receive("error", resp => console.log(`Unable to join`, resp))
})()

