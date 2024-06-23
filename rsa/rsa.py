class RSACrypto:
	"""
	This is a class for RSA Cryptography.
 
    Attributes:
        minNumber (int): Constant 2 value.
        minLimit (int): Minimal value for range prime number.
        maxLimit (int): Maximal value for range prime number.
	"""
	def encrypt(self, messages, public):
		"""
        The function to ecnrypt massage using determined public key.
 
        Parameters:
            messages: The messages to be encrypted.
            public: The key used to encrypt messages.

        Returns:
            encrypted: Result of encrypted messages.
        """
		n, e = public
		encrypted = [pow(ord(message), e, n) for message in messages]
		return encrypted
	
	def decrypt(self, messages, private):
		"""
        The function to decrypt massage using determined private key.
 
        Parameters:
            messages: The messages to be decrypted.
            private: The key used to decrypt messages.

        Returns:
            decrypted: Result of decrypted messages.
        """
		n, d = private
		decrypted = ''.join([chr(pow(message, d, n)) for message in messages])
		return decrypted