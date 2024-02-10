function CardItem({ locations, createData }) {
  let c = locations.map((item) => {
    return (
      <li
        onClick={() => createData(item)}
        key={item}
        className="list-group-item"
      >
        {item}
      </li>
    );
  });
  return c;
}
export default CardItem;
