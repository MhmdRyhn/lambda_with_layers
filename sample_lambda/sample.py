from marshmallow import Schema, ValidationError
from marshmallow.fields import Str, Int


class SampleSchema(Schema):
    name = Str(required=True)
    salary = Int(required=True)


def lambda_handler(event, context):
    body = event['body']
    try:
        body = SampleSchema().load(body)
    except ValidationError as ex:
        return {'status': 'fail', 'message': 'please try again', 'error': ex.messages}
    return {
        'status': 'success',
        'message': 'first time successfully deployed lambda with layers using terraform',
        'payload': body
    }
