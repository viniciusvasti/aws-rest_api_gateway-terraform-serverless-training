const AWS = require("aws-sdk");

module.exports.hello = async (event) => {
    AWS.config.update({ region: "us-east-1" });
    try {
        const { phoneNumber, message } = JSON.parse(event.body);
        await new AWS.SNS({ apiVersion: "2010-03-31" })
            .publish({ Message: message, PhoneNumber: `+55${phoneNumber}` })
            .promise();
        return {
            statusCode: 201,
            body: JSON.stringify(
                {
                    message: "SMS sent!",
                },
                null,
                2
            ),
        };
    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify(error),
        };
    }
};
