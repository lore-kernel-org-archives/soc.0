Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E5C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 12:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 329B6C36AEB; Mon, 20 Dec 2021 12:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ED5C36AE7;
	Mon, 20 Dec 2021 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640003438;
	bh=eem1eLQ2jUjaia4FqA+dzyZsSkwIx8x5IOyoSYcP1FQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=meDdw6hmj7FsKKQSG3LICmFd7qEoHdEfre8Glaq2QPb6jj5HkeRm8Gp1VQabzn1EW
	 08MwkiiTcnWuTABhlKICDLqp3RwqGtpFIagk1YUuKyR1Bd8/BPDFPC0OejVyJIXLhW
	 PRqHL2NdC8XUgWBQsksNMgXFS+3RTRHNOk3rYfKkhPNCqH+ibOZM0MOjrT6ZLsHFuR
	 CWY5uoAjAdN1YMqg12ZUiryXogQptdT7cBYIvqBWpJvKMk8ScHjLloPdRN9A5OiOtK
	 cJHziXrHfQDF/Nq5j5+B8tHdKgg03uAlUuiy+7lk6nZ6e2fPE8lCf4FDMB1JTSfZsJ
	 x3pJUEBha4XEQ==
Date: Mon, 20 Dec 2021 12:30:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
Message-ID: <YcB3ZhbCZGmPNk5s@sirena.org.uk>
References: <20211217221232.3664417-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BoScVDD/q/KxhBff"
Content-Disposition: inline
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
X-Cookie: Christ was born in 4 B.C.


--BoScVDD/q/KxhBff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 04:12:32PM -0600, Rob Herring wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.

Reviwed-by: Mark Brown <broonie@kernel.org>

--BoScVDD/q/KxhBff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAd2YACgkQJNaLcl1U
h9AlJAgAg76yWAxnDjTQ4DgWOhcse5AhHyxF1I/JNKRfg7ODEtrt/SMX6Tfxlctj
Gtmk/c2NrH1YvPtA4npe8S9B8Rpnc5Is57tZYatLiHSIjq2wXYrnKq1hPZgFvz80
QLInTHHT74BKIFipfp/7PAV6adjeY8tISiz3RJklRoPe2rxNb7vtauO/z3OIut2y
MgAtV5UcRqmxb6CIkHCu8akHsqWg+JIxHPqjm+2Zk8mWfuE5KaYMQY4BKcbAw2Va
FaMJbdbhK5XF+kOEjIm7RCmxLYPXYzNaQZ4W/MN+PjoL/36IpV2GejN/BAIiiFDn
/4Pdvl2pkJeBkrREiU+LSG08QojLpg==
=ycEh
-----END PGP SIGNATURE-----

--BoScVDD/q/KxhBff--
