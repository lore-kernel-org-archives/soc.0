Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED10C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 20:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE653C36AEA; Mon, 20 Dec 2021 20:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80474C36AE7;
	Mon, 20 Dec 2021 20:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640032060;
	bh=USFBdopFvD6DirDw35ft49hEONzkqi6sUv9KsNlrsEw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=a/TPScQiyvdl1hLFJUqwCii2YGrvQ1o2PFI2ZyNH8tU5SRdTGi6gzjgJA/nYWGak9
	 /9YM4pUGcoMXYothldDEuzYkhC6NwXwbdcsPwm+St1IgHuNn63CpMZ2h+7unuMaOcl
	 SHkED+x48SMqBWf7VV8YgLTNFDUieSYjCWKvzTBK/JXxyETybJuwUT9Vqui9UkfPul
	 +7KeBqTl49xD0XPRcqTrT6Q6k/iltSmdAVPI3DfXi5rb3lazukTzOFqO0UGroecAQ7
	 QZjF+PJ0+2A9o6Dl5UeeHIEkTx6Xg/UdvON2GmNmoHdQ+j3nHuskYa0oIS11c+rHhM
	 KtrW0bUfq8mlA==
Date: Mon, 20 Dec 2021 20:27:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
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
Message-ID: <YcDnNXgH/cTSJE/0@sirena.org.uk>
References: <20211217221232.3664417-1-robh@kernel.org>
 <YcB3ZhbCZGmPNk5s@sirena.org.uk>
 <YcDYCSamA31QLHtm@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxt7YJmghh/LAbx9"
Content-Disposition: inline
In-Reply-To: <YcDYCSamA31QLHtm@piout.net>
X-Cookie: Christ was born in 4 B.C.


--qxt7YJmghh/LAbx9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2021 at 08:22:49PM +0100, Alexandre Belloni wrote:
> On 20/12/2021 12:30:30+0000, Mark Brown wrote:

> > Reviwed-by: Mark Brown <broonie@kernel.org>

> You have a typo there so I'm not sure b4 will be able to pick that up

Reviewed-by: Mark Brown <broonie@kernel.org>

--qxt7YJmghh/LAbx9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHA5zQACgkQJNaLcl1U
h9DGRAf9HCDjei+6so6mF8++uqLGSaH8rvnvawAr/UDqbwExGFbNyY4kYejuLL1z
/dNhSggRwEq7nOHFblz/RJ18zsURaL7oJntHsih1b1axT2T87I/D0RHQdg/rD05f
EGbdg1QCkTvxpWLZz8XPNizRg968BDfvZe3BL5MvnR56VHS8TxTCNamD9WepI1xs
imz5SLDajLufV0Yl1cyBWjV22fP7KiXxukJurmBiL849xDO9VmaPfMxIGJX6vGvf
aebuQhEIkXjEQ6tfLAky8UmoHFyRFM/02n0ZjPYsFZ8dmOKIJcEcv//dRd517QB/
ofcY/a+bNBKZgDeLwuoScyX7442VQA==
=v/br
-----END PGP SIGNATURE-----

--qxt7YJmghh/LAbx9--
