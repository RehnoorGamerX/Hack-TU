import CardItem from "./CardItem";
let options = {
  mode: "no-cors",
  method: "POST",
  headers: {
    "Content-type": "application/json",
  },
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Credentials": true,
  body: JSON.stringify({
    submit: "submit",
    name: "yash",
  }),
};
async function sendData() {
  let p = await fetch("http://localhost/server", options);
  let resp = await p.json();
  return resp;
}
let locations = {
  Girls_Hostel: ["PG", "Heritage Haveli", "N", "G", "E", "I", "L"],
  Boys_Hostel: ["D", "C", "O", "B", "A", "K", "J", "M", "H"],
  other: [
    "COS",
    "Sports Complex",
    "Gurudwara",
    "Faculty Residential Complex",
    "Synthetic Track",
    "Biogas Plant",
    "R&D Gate",
    "SBOP",
    "Guest Rooms",
    "Car Parking",
    "Dean's Office",
  ],
  education: [
    "LT Building",
    "Library",
    "Mechnical Engineering Workshop",
    "TAN Complex",
    "G block",
    "C block",
    "H, BLock",
    "B block",
    "F block",
    "E block",
    "Main Auditorium",
    "Car Parking",
    "Polytecnic Building",
    "TSLAS",
  ],
};
function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
let NoDataReceived = 1;
function Cards({ changeUI }) {
  let createData = (str) => {
    console.log(str);
    if (NoDataReceived == 1) {
      document.getElementById("location").value = str;
      NoDataReceived = 2;
    } else {
      changeUI("");
      document.getElementById("dest").value = str;
      //document.getElementById("user").value = getCookie("user");
      document.getElementById("user").value = "raulakh_be23@thapar.edu";
      let sub = document.getElementById("submit");
      sub.click();
    }
  };
  return (
    <>
      <form
        action="http://localhost:8081/WebApplication1/Data_Entry"
        method="post"
        style={{ display: "none" }}
      >
        <input type="text" name="user" id="user" />
        <input id="location" type="text" name="location" />
        <input type="text" id="dest" name="destination" />
        <button name="submit" type="submit" id="submit">
          submit
        </button>
      </form>
      <ul className="list-group">
        <li className="list-group-item active" aria-current="true">
          Girls_Hostel
        </li>
        <CardItem
          createData={createData}
          locations={locations.Girls_Hostel}
        ></CardItem>
      </ul>
      <ul className="list-group">
        <li className="list-group-item active" aria-current="true">
          Boys_Hostel
        </li>
        <CardItem
          locations={locations.Boys_Hostel}
          createData={createData}
        ></CardItem>
      </ul>
      <ul className="list-group">
        <li className="list-group-item active" aria-current="true">
          other
        </li>
        <CardItem
          locations={locations.other}
          createData={createData}
        ></CardItem>
      </ul>
      <ul className="list-group">
        <li className="list-group-item active" aria-current="true">
          education
        </li>
        <CardItem
          createData={createData}
          locations={locations.education}
        ></CardItem>
      </ul>
    </>
  );
}
export default Cards;
