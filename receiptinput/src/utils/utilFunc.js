function generateDate() {
    let dt = new Date();
    let year = dt.getFullYear();
    let month = dt.getMonth() + 1;
    let date = dt.getDate();
    return year + "/" + month + "/" + date;
}
function generateTime() {
    let dt = new Date();
    let hours = dt.getHours();
    let minutes = dt.getMinutes();
    return hours + ":" + minutes;
}
export default {generateDate,generateTime};