Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BC433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 13:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 376AEC385C9; Tue, 10 May 2022 13:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F75FC385A6;
	Tue, 10 May 2022 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652187949;
	bh=1V5+GlJy2HiNav41rKO9iyyiweHjJ0Mv6pnIaiWPdXA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=gbDO8zLR3VqNKgExCKdAgLgmt2BmHOGIdRzgN3Q4GkMmGIj1BxzJf7Ivg1MLNF/04
	 2Cx4SPNVWKFswvYy0w8iTvWmPg6AumrlxDvN1oW0ikXyvK+xN8F78L5dfNZH8CX9cY
	 ltjfslzhXoatoRemXohd5frUhv+1mOjmw5FXxmC6QJm19nLiQsbKiYHplGUBdr/Xk/
	 zo7QBxgwgZU5j0z4sh6vuXjubBqeXKYqrhY0eIyQf7nRNG+tm/+VBDupXQoqXtnXvk
	 QqvOXdzxRSxdFyzxmHVG0EAyIqhU9EmHQkzCTvAsTvJDn7kV14qcOCpjvLXLNngKt9
	 gS2hdclmu+Q+g==
Date: Tue, 10 May 2022 14:05:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, carsten.haitzler@foss.arm.com,
	carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnpjKMQnbCr8pD/j@sirena.org.uk>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uiq2O9+pEYgkCGPx"
Content-Disposition: inline
In-Reply-To: <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
X-Cookie: I've read SEVEN MILLION books!!


--uiq2O9+pEYgkCGPx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 01:55:13PM +0100, Liviu Dudau wrote:
> On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:

> > While at it, can we get these too enabled which are needed on JUNO IIUC.
> > CONFIG_DRM_I2C_NXP_TDA998X
> > CONFIG_DRM_I2C_NXP_TDA9950

> I would not enable by default TDA9950 as that one is for CEC, which Juno doesn't
> implement so you get warnings everytime time tda998x probes.

If it's generating a warning due to the config option being enabled
that doesn't sound good - kernels are supposed to be multiplatform.

--uiq2O9+pEYgkCGPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6YycACgkQJNaLcl1U
h9Clagf9Fn8B3AKWgsn9IYBOICfcTDVV7oLxs5jpTuZeH5Rmcq8ijFDzJeXAVnZQ
eHuiBz0nF7jxJLiMafnFMuC+MIRUtT0tc9/7Haal6pl63EUWonJ3CxjNQ2spETsO
mjR+9zYwuVHNJdNsS6W0VuMH9iMho4w3iO3ZkNzi+YC6UnWM7jVmqtfhG2/GTt+h
BqoBnUqSNYqLQGUvjyKlTz03zisKj5wxoAo2uEa1akApLSI8bvANXvEE1+XfwepI
b8tmf07FX6GYYwmC/+Sh9H1T1BI4dJEYkygML9xlE6zjknGE9dGA4oQ9sjaeudR2
VHFbm61i/IiWqgQgW3UeBm9Rnt1FkA==
=1x6Y
-----END PGP SIGNATURE-----

--uiq2O9+pEYgkCGPx--
