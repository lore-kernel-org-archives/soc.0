Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267B9C433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 13:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBBE4C34111; Wed, 11 May 2022 13:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30003C34110;
	Wed, 11 May 2022 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652274788;
	bh=g6AP2mOn4r0mBHmFBWeCj8s1yPZtKg1jfCdKfza0eZ4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=M3mQ8c4VGBxOq6FQQFXKXLjEngDx5roARmi4dVb0kmcgsv3oY1A4fXlrbO6usrpZX
	 L0hTrzpKR/HI6nrXUi98i4+S9KNtGtfzhYpt4z2a93oEI9VlrhOk2VpfUL7NMvlQwV
	 eCDTdX4GldGVHNyCl4aVCExlMHfQUz0Xh7XMQKZnPmvrR90nJINHapblFmgGIwP1H9
	 9SnQeUvh/gbvqRbgmQrDRKSUGNuzVe65bXEQEb/1eCy+J2S7PugRmi0Dv8gdbVwWY/
	 BRgG0d34tqafwcTYMZ760pAufNSdg4vnlr9vKkN3ZRbA7DmGNJfg0xaXiTJJhLqUCV
	 wmb4aVqkU7Big==
Date: Wed, 11 May 2022 14:13:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, carsten.haitzler@arm.com,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <Ynu2X/SwS7XqEEEs@sirena.org.uk>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
 <YnpjKMQnbCr8pD/j@sirena.org.uk>
 <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
 <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
 <YnqTTy7P5IEC6no/@sirena.org.uk>
 <YnrF3Nc7NbcX6v3b@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vj+Up9p+S45+hYAV"
Content-Disposition: inline
In-Reply-To: <YnrF3Nc7NbcX6v3b@e110455-lin.cambridge.arm.com>
X-Cookie: Look ere ye leap.


--vj+Up9p+S45+hYAV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 09:06:52PM +0100, Liviu Dudau wrote:

> The quickest way is to harmonise the treatment of IRQs between tda998x an=
d tda9950.
> The former treats the IRQ as optional, the later as mandatory. Given that=
 (according
> to comments in the code) TDA998X is actually a TDA9989+TDA9950, it makes =
sense to
> treat the lack of IRQ the same way (make it optional, IMHO).

The check in tda9950 is sensible enough, the device relies on interrupts
to report the status of CEC operations so we'd need to poll constantly
which doesn't seem great.  It wouldn't be *so* bad for things initiated
by the device but given that CEC is a network and we might get messages
=66rom other devices in the system at any time we'd need to poll
constantly even when otherwise idle which doesn't seem good.  I sent a
patch to lower the level of the log message, hopefully that's OK for
people.

--vj+Up9p+S45+hYAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ7tl8ACgkQJNaLcl1U
h9DFrgf/b4RpFBQ5m3hzH/EqEjhAZgef1qIQsozfhsHowAhxXaDA47nSo3LxvEt7
U3sMHsBX7C1Qy+DnjppjuKkXYOHQtB6q5U+nJFLROC+UK4/fh9z1Vn9eo1xkqsMI
zXUZNIKhZUQVctlP23Dz/GLot5a9L++BQTNqfGW6KrvKOTcaJ9CTdqxX4OYc8ben
GVj7VtyribCEneAVgVMSTwkSODmOc9hWWIDy3v3K46ZR3gpmzMjK78nkM9pHPxmE
rlfk6admkcMmz1rgrXy6zVy/o1ObNJxYLFtLN9LWNw2k8x1KJk6cjHgHPlweWwq8
3Px8Zv9REJsTYhbp3HDfoyKl7jePOw==
=u7zY
-----END PGP SIGNATURE-----

--vj+Up9p+S45+hYAV--
