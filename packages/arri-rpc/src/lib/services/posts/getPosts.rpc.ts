import { Type } from "@sinclair/typebox";
import { defineRpc } from "../../arri-rpc";

export default defineRpc({
    method: "post",
    response: Type.Object({
        total: Type.Integer(),
        items: Type.Array(
            Type.Object({
                id: Type.String(),
                createdAt: Type.Date(),
                content: Type.String(),
            })
        ),
    }),
    async handler(_) {
        return {
            total: 10,
            items: [],
        };
    },
});
