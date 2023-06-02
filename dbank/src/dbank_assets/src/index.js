import { dbank } from "../../declarations/dbank";


window.addEventListener("load", async function () {
      dbank.compound();
      const currentAmount = Math.round(await dbank.checkBalance() * 100) / 100;
      this.document.getElementById("value").innerText = currentAmount;
      console.log(currentAmount)
});

document.querySelector('form').addEventListener('submit', async function (event) {
      console.log(typeof parseFloat(document.getElementById('input-amount')).value+" -- typeof")

      event.target.querySelector('#submit-btn').setAttribute('disabled',true);
      document.getElementById("value").innerText = "[Loading...]";

      event.preventDefault();
      const inputAmount = parseFloat(document.getElementById('input-amount').value); // str to float
      const withdrawalAmount = parseFloat(document.getElementById('withdrawal-amount').value);

      if(inputAmount>0)
      await dbank.topUp(inputAmount);
      else
      console.log('Invalid TopUp amount')
      if(withdrawalAmount>0)
      await dbank.withdrawal(withdrawalAmount);
      else
      console.log('Invalid withdrawal')

      await dbank.compound();

      const currentAmount = Math.round(await dbank.checkBalance() * 100) / 100;
      document.getElementById("value").innerText = currentAmount;
      console.log(currentAmount)

      document.getElementById('input-amount').value = ""
      event.target.querySelector('#submit-btn').removeAttribute('disabled')


});