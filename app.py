from datetime import datetime
import fields as fields
import requests
import jsonify
import json
#from EbayApi import url
import EbayApi
from flask import Flask
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from flask_sqlalchemy import SQLAlchemy
#from pip._vendor.distlib import database
from sqlalchemy.dialects import sqlite


#server run = ngrok.exe http 5000
app = Flask(__name__)
api = Api(app)
db1 = SQLAlchemy(app)
db2 = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'



class UserModel(db1.Model):
    username = db1.Column(db1.String(1000), nullable=True)
    firstname = db1.Column(db1.String(100), nullable=True)
    lastname = db1.Column(db1.String(100), nullable=True)
    university = db1.Column(db1.String(200), nullable=True)
    password = db1.Column(db1.String(100), nullable=True)
    id = db1.Column(db1.Integer, primary_key=True)

    def __repr__(self):
        return f"Username = {username}, First name = {firstname}, Last name = {lastname}, University = {university}, Password = {password}, ID = {id}"


resource_fields1 = {
    'username': fields.String,
    'firstname': fields.String,
    'lastname': fields.String,
    'university': fields.String,
    'password': fields.String,
    'id': fields.Integer
}

resource_fields2 = {
    'firstname': fields.String,
    'lastname': fields.String,
    'password': fields.String,
    'id': fields.Integer
}

resource_fields3 = {
   # 'id': fields.Integer,
    'description': fields.String,
    'priority': fields.String,
    'username': fields.String
}

resource_fields4 = {
    'id': fields.String
}

resource_fields5 = {
    'replies': fields.String,
    'link': fields.String
}


user_put_args = reqparse.RequestParser()
user_put_args.add_argument("firstname", type=str, help="Please send first name of person", required=True)
user_put_args.add_argument("lastname", type=str, help="Please send last name of person", required=True)
user_put_args.add_argument("university", type=str, help="Please send university they attend", required=True)
user_put_args.add_argument("password", type=str, help="Please send user password", required=True)
# user_put_args.add_argument("id", type=int, help="Please send user ID", required=True)

post_put_args = reqparse.RequestParser()
post_put_args.add_argument("description", type=str, help="Please send the users post", required=True)
post_put_args.add_argument("priority", type=str, help="Please send the users priority rating", required=True)

post_patch_args = reqparse.RequestParser()
post_patch_args.add_argument("replies", type=str, help="Please send the reply", required=False)
post_patch_args.add_argument("link", type=str, help="Please send the item for which a link is needed", required=False)
# in the forums page send userdb info about username, first name, last name and university

class User(Resource):
    @marshal_with(resource_fields1)
    def put(self, username):
        args = user_put_args.parse_args()
        result = UserModel.query.filter_by(username=username).first()
        if result:
            abort(409, message="This username already exists so you cannot add another person to the same username...")
        user = UserModel(username=username, firstname=args['firstname'], lastname=args['lastname'],
                         university=args['university'], password=args['password'])
        db1.session.add(user)
        db1.session.commit()
        return user, 201

    # return first last name and password
    @marshal_with(resource_fields1)
    def get(self, username):
        result = UserModel.query.filter_by(username=username).first()
        if not result:
            abort(404, message="This user does not exist...")
        return result, 201


class UserGetId(Resource):
    @marshal_with(resource_fields4)
    def get(self, username):
        result = UserModel.query.filter_by(username=username).first()
        if not result:
            abort(404, message="This user does not exist...")
        return result, 201


# Post database and class
class PostModel(db2.Model):
    id = db2.Column(db2.Integer, primary_key=True)
    username = db2.Column(db2.String(1000), nullable=False)
    description = db2.Column(db2.String(10000), nullable=False)
    priority = db2.Column(db2.String(10), nullable=False)
    link = db2.Column(db2.String(1000), nullable=True)
    replies = db2.Column(db2.String(1000), nullable=True)


    def __repr__(self):
        return f"ID = {id}, Username = {username}, Description = {description}, Priority rating = {priority}, Links = {link}, Replies = {replies}"

class Post(Resource):
    @marshal_with(resource_fields3)
    def put(self, username):
        args = post_put_args.parse_args()
        user = PostModel(username=username, description=args['description'],
                         priority=args['priority'])
        db2.session.add(user)
        db2.session.commit()
        return user, 201

    @marshal_with(resource_fields5)
    def patch(self, username):
        args = post_patch_args.parse_args()
        id = PostModel.query.filter_by(username=username).first()
        if not id:
            abort(404, "This user does not exist...")

        #   if "name" in args and args['name'] not None: - THIS IS WHAT THE BELOW STATEMENT MEANS
        if args['replies']:
            id.replies = args['replies']
        if args['link']:
            links = EbayApi.getUrl(args['link'])
            id.link = links
        db2.session.commit()
        return id, 201

    #@marshal_with(resource_fields5)
    def get(self, username):
        max = db2.session.query(db2.func.max(PostModel.id)).scalar()
        dict = {'max': max}
        return dict, 201




class PostGetDes(Resource):
    @marshal_with(resource_fields3)
    def get(self, id):
        result = PostModel.query.filter_by(id=id).first()
        if not result:
            abort(404, message="This user does not exist...")
        return result, 201

# Replies database and class


# GET API call to get fname lname and password
api.add_resource(User, "/user/<string:username>")


# GET the max value of db
api.add_resource(Post, "/posts/<string:username>")


#GET the database info given ID
api.add_resource(PostGetDes, "/postsGetDes/<int:id>")


# GET API call to get ID. RETURNS AN INT
api.add_resource(UserGetId, "/userid/<string:username>")

if __name__ == '__main__':
    app.run(debug=False)
