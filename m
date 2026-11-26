Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707146;
	b=4w808cH5f3p7mEVPibkw3h2XWNgxEE5UQ+MlXeJ/XGUS6WAsHl9//rho1oskqvsxJk9C
	 Hbi+Bckg7KnVCn2rK3zpDv15o3dVWxrPZJsBTSbN8pR9UIaRsAq64IJ++yiw5wUvMagZU
	 iIFvW+lTfR5pBTy/llkUuNMYRKZTBtTBZUqT9OHP5l2+ft+Ayqy87MayCJi2IfOIseR5C
	 ErhunaDkiMlfeZ6cl9PmcHkUb1HwDWOsAlV1SOaf8nboSRU9ITNGCkZNF2p6Lu4b6x3cS
	 B5DzcN/5SBOS4ZUIDgMGiu+mpMkk8tva0l5S3RZhsNVQVX8dgo7C6XwXAsKxKKKgebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707146;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=nPMFdqo4O58hWDqbu5Wcd7f7q48E1zoRcgRviqnNnk4=;
	b=TsTuUKGVt/JfkNMXznXBP+nip/pzqtTCsvc0+GlRmVPELKYezosekUwVZauxqXtuAErU
	 r+HoLN4rsof/r5Gor1GR8LkkOdcSoHvEw3SiOLfb/sEeJQGIvcqOC/OlwJf6ew6oCWCDu
	 FD1/HB84I/T7s+RoUVGhNkYqnltgLn31AfP9KXsblP6oigqwZNtxXm3lJj5vjnQnOjteY
	 ho9rP7YepBwUlc0ZeIumQZ5QMFLr9eiTLY8m5OTPM+YPtOqaJjRPV0/GDLIhOwYP6c2PN
	 8jgIakD0J1Cv0QcDhpqbzxrgu0FTgH2Cv1fqHl8yrYQl4i+fmKEgZkkXbQZk9sF5NIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ext8jkBd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1B4606A331;
	Thu, 26 Nov 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ext8jkBd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D601F000EC;
	Thu, 26 Nov 2026 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707146;
	bh=nPMFdqo4O58hWDqbu5Wcd7f7q48E1zoRcgRviqnNnk4=;
	h=Date:From:To:Cc:Subject;
	b=Ext8jkBd4ux4m9a+o9fjEIyd7udsACvNEvyTKEM6AQ8V3M+QaHRu3yHTslVUwQe6r
	 zJcoMBzz0bEz9uMGtZfh5Gi3tboDTdPenGuaolNyA9P1aKKUoduKEEeRLy1SzGVu2D
	 nIplHZYpmGCxMlfOiN312S5Irhe3r4P8+wtXPw6Sv5KQ+yYJ5Q6Xjx6H1K27r+WjiC
	 k5V7FhK6BvDhsq/pDoVKOHMWF/d8l66AGARsiPHTGh51tzBIu4F9dijnXLhxtjfvfa
	 IGwQM1gpu7/vSGxkhf+49Djph9qUGctV70ZOdWvmzl+zScVUNmAO6u2fKsh1522v1H
	 xPeg5eCgTXvbA==
Date: Thu, 26 Nov 2026 15:32:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	soc@lists.linux.dev
Subject: linux-next: manual merge of the gpio-brgl tree with the arm-soc tree
Message-ID: <awhRBtAEYE3g8sIh@sirena.org.uk>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DdXgPadP7NCBeaEF"
Content-Disposition: inline


--DdXgPadP7NCBeaEF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  arch/arm/mach-pxa/spitz_pm.c

between commit:

  71a0ba7b39ad4 ("ARM: remove legacy pxa board files")

=66rom the arm-soc tree and commit:

  cdd365a6eeb7f ("ARM: pxa: spitz: Open code gpio_request_one()")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the file]

--DdXgPadP7NCBeaEF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIUQUACgkQJNaLcl1U
h9CFKAf9FF4AIHt6Y7+WGLfj94wwmzwpm6fqhp9DmGxTN76lJx3tfAMCbFgNcZAG
yGeSm72U7Evzh1kRJp0wLbIont13A3gHtmr6soWaTfjn0kRONMHlFMxGnusvs0cq
TCEchOhEIAEAeTfoL0mpu2mYtNP/Cb6C305zAgTevKPHRFBgF4rlQI2pwbYL7p+2
qZQkAmS7YfLMPJrUt5FLoQE7WJFZmSpObAOVE3Ra0uh8MJ7tF9LJgjZgbckaieFZ
aOFwY4aKDwbMEyd1+8sMWIKAgu3Q5f9N0SHNC21DzFO3kbrpUuTYIT6Frb7iwhGK
pshU4tKgE+6UYOk7ck/XEHrgWY4hDg==
=u6pP
-----END PGP SIGNATURE-----

--DdXgPadP7NCBeaEF--
