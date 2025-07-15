import Server from "./src/Server";
import Logger from "./src/Modules/Logger";

declare module "express-session" {
    export interface SessionData {
        user: { [key: string]: any };
        data: { [key: string]: any };
        token: string;
    }
}

const PORT = parseInt(process.env.PORT || "4000");
const server = new Server(PORT);

server.start(() => {
    Logger.log(`Server is listening on port ${PORT}`);
});