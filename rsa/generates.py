import string, secrets

def GenerateSlug():
	slug = string.ascii_letters + string.digits
	return ''.join(secrets.choice(slug) for _ in range(7))