/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

class UserInfo{
    
    private init(){}
    static let shared = UserInfo()
    
    var info : User?
    
}

struct User : Codable {
	var id : Int?
	var email : String?
	var firstName : String?
    var lastName : String?
    var name : String?
    var gender : String?
    var phone : String?
    var dob : Int64?
    var imageUrl : String?
    var username : String?
    var createdAt : String?
    var sendNotification : Int?
    var notification : String?
    var buildNo : String?
    var buildVersion : String?
    var deviceIndentifier : String?
    var deviceModel : String?
    var deviceName : String?
    var os : Int?
    var osVersion : String?
    var bio : [String]?
    var token : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case email = "email"
		case firstName = "first_name"
		case lastName = "last_name"
		case name = "name"
		case gender = "gender"
		case phone = "phone"
		case dob = "dob"
		case imageUrl = "image_url"
		case username = "username"
		case createdAt = "createdAt"
		case sendNotification = "send_notification"
		case notification = "notification"
		case buildNo = "build_no"
		case buildVersion = "build_version"
		case deviceIndentifier = "device_indentifier"
		case deviceModel = "device_model"
		case deviceName = "device_name"
		case os = "os"
		case osVersion = "os_version"
		case bio = "bio"
		case token = "token"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		dob = try values.decodeIfPresent(Int64.self, forKey: .dob)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        sendNotification = try values.decodeIfPresent(Int.self, forKey: .sendNotification)
		notification = try values.decodeIfPresent(String.self, forKey: .notification)
		buildNo = try values.decodeIfPresent(String.self, forKey: .buildNo)
		buildVersion = try values.decodeIfPresent(String.self, forKey: .buildVersion)
		deviceIndentifier = try values.decodeIfPresent(String.self, forKey: .deviceIndentifier)
		deviceModel = try values.decodeIfPresent(String.self, forKey: .deviceModel)
		deviceName = try values.decodeIfPresent(String.self, forKey: .deviceName)
		os = try values.decodeIfPresent(Int.self, forKey: .os)
		osVersion = try values.decodeIfPresent(String.self, forKey: .osVersion)
		bio = try values.decodeIfPresent([String].self, forKey: .bio)
		token = try values.decodeIfPresent(String.self, forKey: .token)
	}

}
