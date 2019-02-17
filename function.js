/**
 * an example of the invoices
 * if the payment status === 1 , this means the subscribers has paid the fees , otherwise not,
 */
let invoices = [
  {
    id: "x2ysuss9",
    subscriber_id: "1111",
    cost: 30,
    payment_date: "11/01/2018",
    payment_status: 0
  },
  {
    id: "x2ysuss9",
    subscriber_id: "ksksk",
    cost: 30,
    payment_date: "02/30/2019",
    payment_status: 0
  },
  {
    id: "jssnsns",
    subscriber_id: "ksksk",
    cost: 30,
    payment_date: "02/01/2019",
    payment_status: 1
  }
];

let subscribers = [
  {
    id: "1111",
    first_name: "hilal",
    last_name: "aissani",
    pass_word: "12346",
    email: "hilalaissani@gmail.com",
    address_location: "NY",
    videos_streamed: "godfather,mister x ",
    plan_id: "1",
    payment_method: "card",
    credit_card: 122338383,
    starting_date: "09/12/78"
  },
  {
    id: "ksksk",
    first_name: "jon",
    last_name: "steve",
    pass_word: "10000",
    email: "jon@gmail.com",
    address_location: "CA",
    videos_streamed: "fugitive ",
    plan_id: "1",
    payment_method: "card",
    credit_card: 7888
  }
];

const cancellation = (invoices, subscribers) => {
  result = [];
  let notPaidSub;
  let emails;
  let date = new Date();
  for (let i = 0; i < invoices.length; i++) {
    if (
      invoices[i].payment_status === 0 &&
      new Date(invoices[i].payment_date)
    ) {
      result.push(invoices[i]);
    }
  }
  for (let j = 0; j < result.length; j++) {
    notPaidSub = subscribers.filter((a, b) => {
      return result[j].subscriber_id === a.id;
    });
  }
  emails = notPaidSub.map(e => {
    return e.email;
  });
  console.log(emails);
  return emails;
};
cancellation(invoices, subscribers);

/** the function returns all the emails of the not-paid subscribers, so we could cancel their plans   */
