import random, math

class Keys:
	"""
	This is a class for Keys.
 
    Attributes:
        minNumber (int): Constant 2 value.
        minLimit (int): Minimal value for range prime number.
        maxLimit (int): Maximal value for range prime number.
	"""
	def __init__(self):
		"""
        The constructor for RSA class.
 
        Parameters:
            none
        """
		self.minNumber = 2
		self.minLimit = 8
		self.maxLimit = 16

	def isPrime(self, num):
		if num <= 1:
			return False

		for i in range(self.minNumber, int(num ** 0.5) + 1):
			if num % i == 0:
				return False
		return True

	def generatePrime(self):
		"""
        The function to generate prime number on selected range.
 
        Parameters:
            none
        """
		# batas minimal angka prima
		minimal = self.minNumber ** self.minLimit
		# batas maksimal angka prima
		maximal = self.minNumber ** self.maxLimit
		while True:
			prime = random.randint(minimal, maximal)
			if self.isPrime(prime):
				return prime

	def generatePrimePair(self):
		"""
        The function to generate public key and private key.
 
        Parameters:
            none

        Returns:
            keyPair: A couple number of public key and private key.
        """
		p = self.generatePrime()
		q = self.generatePrime()
		return (p, q)

	def determinedKey(self, p, q):
		n = p * q
		phi = (p - 1) * (q - 1)
		while True:
			e = random.randint(self.minNumber, phi)
			if math.gcd(e, phi) == 1:
				break

		d = pow(e, -1, phi)
		keyPair = ((n, e), (n, d))
		return keyPair
		