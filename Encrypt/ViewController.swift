//
//  ViewController.swift
//  Encrypt
//
//  Created by HL on 2018/7/16.
//  Copyright © 2018年 XL. All rights reserved.
//

import UIKit


let Public_Key =  "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5K5/SikLCQF6Lw6si4lXYbw2WNJ04XOVm1PWsN5WFD9w/bNO7Y6OHzs9Imy+kF7qZHLuepYGFxVeY7bZOiL9t09pQC5QmWp8CQB4y2/18+NBx02oyUej8RA/tQ3OBz7ffz3nZSUu2aI1T6iUvOu50tm95FwtB1Tb3ckChqClERwIDAQAB"

let Private_Key = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALkrn9KKQsJAXovDqyLiVdhvDZY0nThc5WbU9aw3lYUP3D9s07tjo4fOz0ibL6QXupkcu56lgYXFV5jttk6Iv23T2lALlCZanwJAHjLb/Xz40HHTajJR6PxED+1Dc4HPt9/PedlJS7ZojVPqJS867nS2b3kXC0HVNvdyQKGoKURHAgMBAAECgYA9+0U/IzqfbQ54uCFjxuE3Vkz0912dDTNYjXZClER/SsTNki75bavCfM5TnmZ/BdZXBBAlVX8aeOkObpt0hD+XAAsp3vGm2WZ9PzOsCcURijHnZ1JC4fCD0Zbu33tDWJohTONHXc2daZCc5KlFAGEGfgSRvTyY7zjE0BhnvU2WeQJBAPMVHL2rTdpbc+AWIMmZ3VeEMJMqL0i62UF8dEzxVwNJdNlsvG/XNPavzMiyfYmUJjRCGuHKH0YKmNpVasUOonMCQQDDAq2FTMbGJneuVjJtTqM+n+uUmmdS2M9lFWYBoNBk8yarW5zCzeTGn2d9nTMLdG/TQhWuvp4/2HmcTdltYB3dAkAe+2TjY88Tcq6NNCTPrTXB7s5GI41NRstkBlnIaMY/XABxqeNGmfZdLsD6H43SmDhaVsaYWqurwLQEt/hYz2mzAkEAi0x4YsXLH3QO/at47ffESFG32DjLIbTZwN0eNn+HHPVLZBBW1Bh7GR54sJQACGiuEHwePOrQ485gYDSD4ctMyQJBAOnzo5C9pv7V+wmUhdU7TQbaA8m771VWgIe/h1q1o8D99jQRmL0TEtmHH+GkvmrQbIM/5nsGHhSFI9S2tmbTn6M="

class ViewController: UIViewController {
    
    var encryptedString = "123456"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func encryptMD5Click() {

      
        let MD5_String = Encrypt_MD5.md5_encrypt(encryptedString)
    
        print(MD5_String)

    }
    
    
    
    
    func encrypt3DesClick() {
    ///加密
        Encrypt_3DES.des3EncryptString(encryptedString, publicKey: Public_Key)
    ///解密
        Encrypt_3DES.des3DecryptString(encryptedString, publicKey: Public_Key)
    }
    
    
    func AES_Encrypt() {
        Encrypt_AES.aes128DecryptString(encryptedString, key: Public_Key)
    }
    
    func RSA_Encrypt() {
        RSAOC.encryptString(encryptedString, byDerFile: "rsa_public_key")
    }
    
    func RSA_sign_Encrypt() {
        RSAOC.sign(encryptedString, byP12File: "rsa_private_key", password: "123")
    }
    


}

