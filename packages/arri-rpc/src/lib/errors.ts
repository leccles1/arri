import { type Static, Type } from "@sinclair/typebox";

export const RpcError = Type.Object(
    {
        name: Type.String(),
        statusCode: Type.Integer(),
        statusMessage: Type.String(),
        message: Type.String(),
        data: Type.Optional(Type.Object({}, { additionalProperties: true })),
    },
    { $id: "RpcError" }
);

export type RpcError = Static<typeof RpcError> & Error;

export function defineRpcError(
    statusCode: StatusCode,
    input: Partial<Omit<RpcError, "statusCode">> = {}
): RpcError {
    const defaultVals = errorResponseDefaults[statusCode];
    return {
        name: input.name ?? defaultVals.name ?? "UNKNOWN",
        statusCode,
        statusMessage:
            input.statusMessage ??
            input.statusMessage ??
            defaultVals.message ??
            "an unknown error occurred",
        message:
            input.message ??
            input.statusMessage ??
            defaultVals.message ??
            "an unknown occurred",
        data: input.data,
    };
}

export function isRpcError(input: unknown): input is RpcError {
    if (input === null) {
        return false;
    }
    if (typeof input !== "object") {
        return false;
    }
    return (
        "name" in input &&
        typeof input.name === "string" &&
        "statusCode" in input &&
        typeof input.statusCode === "number" &&
        "statusMessage" in input &&
        typeof input.statusMessage === "string" &&
        "message" in input &&
        typeof input.message === "string"
    );
}

export type StatusCode =
    | number
    | 400
    | 401
    | 402
    | 403
    | 404
    | 405
    | 406
    | 407
    | 408
    | 409
    | 410
    | 411
    | 412
    | 413
    | 414
    | 415
    | 416
    | 417
    | 418
    | 419
    | 420
    | 421
    | 422
    | 423
    | 424
    | 428
    | 429
    | 431
    | 451
    | 500
    | 501
    | 502
    | 503
    | 504
    | 505
    | 507
    | 511;

const errorResponseDefaults: Record<
    StatusCode,
    { name: string; message: string }
> = {
    400: {
        name: "BAD_REQUEST",
        message: "Bad Request",
    },
    401: {
        name: "UNAUTHORIZED",
        message: "Unauthorized",
    },
    402: {
        name: "PAYMENT_REQUIRED",
        message: "Payment Required",
    },
    403: {
        name: "FORBIDDEN",
        message: "Forbidden",
    },
    404: {
        name: "NOT_FOUND",
        message: "Not Found",
    },
    405: {
        name: "METHOD_NOT_ALLOWED",
        message: "Method Not Allowed",
    },
    406: {
        name: "NOT_ACCEPTABLE",
        message: "Not Acceptable",
    },
    407: {
        name: "PROXY_AUTHENTICATION_REQUIRED",
        message: "Proxy Authentication Required",
    },
    408: {
        name: "REQUEST_TIMEOUT",
        message: "Request Timeout",
    },
    409: {
        name: "CONFLICT",
        message: "Conflict",
    },
    410: {
        name: "GONE",
        message: "Gone",
    },
    411: {
        name: "LENGTH_REQUIRED",
        message: "Length Required",
    },
    412: {
        name: "PRECONDITION_FAILED",
        message: "Precondition Failed",
    },
    413: {
        name: "REQUEST_TOO_LONG",
        message: "Request Entity Too Large",
    },
    414: {
        name: "REQUEST_URI_TOO_LONG",
        message: "Request-URI Too Long",
    },
    415: {
        name: "UNSUPPORTED_MEDIA_TYPE",
        message: "Unsupported Media Type",
    },
    416: {
        name: "REQUESTED_RANGE_NOT_SATISFIABLE",
        message: "Requested Range Not Satisfiable",
    },
    417: {
        name: "EXPECTATION_FAILED",
        message: "Expectation Failed",
    },
    418: {
        name: "IM_A_TEAPOT",
        message: "I'm a teapot",
    },
    419: {
        name: "INSUFFICIENT_SPACE_ON_RESOURCE",
        message: "Insufficient Space on Resource",
    },
    420: {
        name: "METHOD_FAILURE",
        message: "Method Failure",
    },
    421: {
        name: "MISDIRECTED_REQUEST",
        message: "Misdirected Request",
    },
    422: {
        name: "UNPROCESSABLE_ENTITY",
        message: "Unprocessable Entity",
    },
    423: {
        name: "LOCKED",
        message: "Locked",
    },
    424: {
        name: "FAILED_DEPENDENCY",
        message: "Failed Dependency",
    },
    428: {
        name: "PRECONDITION_REQUIRED",
        message: "Precondition Required",
    },
    429: {
        name: "TOO_MANY_REQUESTS",
        message: "Too Many Requests",
    },
    431: {
        name: "REQUEST_HEADER_FIELDS_TOO_LARGE",
        message: "Request Header Fields Too Large",
    },
    451: {
        name: "UNAVAILABLE_FOR_LEGAL_REASONS",
        message: "Unavailable For Legal Reasons",
    },
    500: {
        name: "INTERNAL_SERVER_ERROR",
        message: "Internal Server Error",
    },
    501: {
        name: "NOT_IMPLEMENTED",
        message: "Not Implemented",
    },
    502: {
        name: "BAD_GATEWAY",
        message: "Bad Gateway",
    },
    503: {
        name: "SERVICE_UNAVAILABLE",
        message: "Service Unavailable",
    },
    504: {
        name: "GATEWAY_TIMEOUT",
        message: "Gateway Timeout",
    },
    505: {
        name: "HTTP_VERSION_NOT_SUPPORTED",
        message: "HTTP Version Not Supported",
    },
    507: {
        name: "INSUFFICIENT_STORAGE",
        message: "Insufficient Storage",
    },
    511: {
        name: "NETWORK_AUTHENTICATION_REQUIRED",
        message: "Network Authentication Required",
    },
};
