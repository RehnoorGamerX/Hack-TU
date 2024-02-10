import { useState } from "react";
import "./App.css";
import Card from "./components/Cards";
function App() {
  let [toShow, changeShow] = useState("card");
  return (
    <>
      {toShow === "card" ? (
        <Card changeUI={changeShow}></Card>
      ) : (
        <h1>Data Sent</h1>
      )}
    </>
  );
}

export default App;
