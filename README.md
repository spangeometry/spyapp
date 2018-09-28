#  SpyApp
A homework assignment for CSC690 at San Francisco State University.

Prompt:

1. Extend the Cipher protocol to include a decrypt method. ✓
- The decrypt method should take in an encrypted string and a secret and should return a plaintext string. [Done]
- Once you update the Cipher protocol you will have to update the CaesarCipher with a decrypt method. [Done]

2. Create a new cipher named AlphanumericCesarCipher that implements the Cipher protocol. Add the cipher to the CipherFactory. ✓  
Your cipher should:
- Only take alphanumeric input. (characters A-Z, a-z and numbers 0-9) ✓
- The output should only include characters A-Z or 0-9. Lower-case characters should be converted to upper-case before they are encrypted. ✓
- The mapping should be cyclical in either direction.  
    Example:  
    Shifting by 1: Z maps to 0, 9 maps to A  
    Shifting by -1: A maps to 9, 0 maps to Z

3. Create at least two more cyphers for the spy app. Add all Ciphers you create to the CipherFactory and add buttons that allow the user to switch to all implemented ciphers. ✓
- Comment your cipher. What characters are valid input, what is the output of your cipher. 
- The decrypt method should reverse what the encrypt method does. ✓

4. Create layout constraints for all new buttons.  ✓
- Make sure your app looks good on devices with different resolutions and in both horizontal and vertical orientation. ✓
- Play around a little with interface builder and improve the look of the app. ✓

5. No input should crash the app. Unwrap all optionals the way we discussed in class and display an appropriate error method. 

6. Write unit tests for all model methods you add.
- Tests for each cipher you create should be in their own file.
- Try to test for all edge cases your cipher introduces.
- Come up with meaningful names for your test classes and test cases. Well written tests serve as documentation of your code!
