//
//  MealViewController.swift
//  spa
//
//  Created by Sendhil kumar Gurunathan on 10/24/15.
//  Copyright © 2015 Sendhil kumar Gurunathan. All rights reserved.
//

import UIKit

class MealViewController: UIViewController , UITextFieldDelegate ,
UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    //MARK: Properties
    
    @IBOutlet weak var lblText1: UILabel!

    @IBOutlet weak var btn1: UIButton!
   
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var txtSearch: UITextField!

    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //@IBOutlet weak var cancelButton: UIBarButtonItem!
    var meal : Meal?
    
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //lblText1.text = "please select a image";
        txtSearch.resignFirstResponder()
        let imagePickerController =  UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
         presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    override func viewDidLayoutSubviews() {
        //ratingControl.stars=6;
        //ratingControl.layoutSubviews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch.delegate = self
        
        if(self.meal != nil){
            let m = meal!
            txtSearch.text = m.name
            photoImageView.image = m.photo
            ratingControl.rating = m.rating
        }
        
        //ratingControl.stars=6
        //ratingControl.CreateStars()
        checkValidMealName()
        // Do any additional setup after loading the view, typically from a nib.
    }
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        //saveButton.enabled = true;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //lblText1.text = textField.text;
        //saveButton.enabled = false
        checkValidMealName()
        navigationItem.title = textField.text;
    }
    
    func checkValidMealName(){
        let name = txtSearch.text ?? ""
        saveButton.enabled =  !name.isEmpty
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage;
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: UINavigationControllerDelegate
    
    //MARK: Actions
   

    
    @IBAction func btnClick(sender: UIButton) {
        // lblText1.text = "Hi Sendhil!";
        btn1.enabled = false;
        btn2.enabled = true;
        //ratingControl.CreateStars()
        //ratingControl.setNeedsLayout()
        
        //lblText1.text = "Hi \(ratingControl.stars)"
    }
    
    @IBAction func btnClickAgain(sender: UIButton) {
        //lblText1.text = "Hi Again!";
        btn1.enabled = true;
        btn2.enabled = false;

    }
    
    //MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if ( sender === saveButton){
            let name = txtSearch.text ?? ""
            let image = photoImageView.image
            let ratings = ratingControl.rating
            
            self.meal = Meal(name: name, photo: image, rating: ratings)
        }
        else    {
            print("seage not by save button")
        }
    }
    
    @IBAction func cancelAction(sender: UIBarButtonItem) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController;
        if(isPresentingInAddMode){
             dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            navigationController!.popViewControllerAnimated(true)
        }
        
       
    }
    
    
}

