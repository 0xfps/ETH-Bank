from brownie import Bank, accounts, network, config

def deploy():
   account = getAccount()

   print("Deploying...")

   deploy = Bank.deploy({"from": account}, publish_source=True)
   #deploy = Bank.deploy({"from": account}, publish_source=False)


   print(f"Deployed at {deploy.address} !!!")

   title = "Bank"
   link = "https://rinkeby.etherscan.io/address/"
   with open("../Deployment Address.txt", "a+") as file:
      file.write(f"{title} => {link}{deploy.address}\n\n")


def getAccount():
   if network.show_active() == "development":
      return accounts[0]
   else:
      return accounts.add(config['wallet']['from_key'])

def main():
   deploy()