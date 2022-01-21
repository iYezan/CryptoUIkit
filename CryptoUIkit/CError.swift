//
//  CError.swift
//  CryptoUIkit
//
//  Created by iYezan on 21/01/2022.
//

import UIKit

enum CError: String, Error {
    case invalidData        = "The data recieved from the server was inavalid. Please contact support."
    case InvalidResponse    = "Invalid response from the server. Please try again later or contact support."
    case invalidURL         = "There was an issuse connecting to the server. if this persists. Please contact support."
    case unableToComplete   = "Unable to complete your request at this time. Please check your internet connection."
}
