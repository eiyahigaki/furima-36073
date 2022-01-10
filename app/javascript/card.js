const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("history_delivery[number]"),
      cvc: formData.get("history_delivery[cvc]"),
      exp_month: formData.get("history_delivery[exp_month]"),
      exp_year: `20${formData.get("history_delivery[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        console.log(token)
      }
    })
  });
};

window.addEventListener("load", pay);