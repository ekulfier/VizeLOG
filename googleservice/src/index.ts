import { app } from "./app";

const start = async () => {
  console.log("Starting google service...");

  app.listen(3000, async () => {
    console.log("Google service listening on port 3000!!! for staging -  9 - 2 - 17:32 ");
  });
};

start();
