Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC7CC433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 16:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8119C385A6; Tue, 10 May 2022 16:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD9BC385C2;
	Tue, 10 May 2022 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652200275;
	bh=HhAf5//bMx/45QGSbZle4/V2kAePTq1EQF9xsb7qUGQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=g10Z2QNQHeSjpD7dOrkM5FCnfKiw5rbl2mbm1258KMnbVEiMp4Ox013eLsy/YD6X/
	 3gy8nU6WVmp9wiGht2XUAIomPjGH9RMVqczqbn6owNhTdFbrz0IR3OY1UVPgh1lTeM
	 mAFKeDw7ZqMBo+cCxhnFVVlPtz2AJ2imW8/xnda2TIeg1B2BzIfgrMpmfmRLw3Z1C5
	 jiswjRnLT3nteQEW0Tgq52h1jHULh6fnX5RYZNbdnJyWvdw0d7ymPX8YWd2eCZvxum
	 3GhQ+LJDwO9OLFOicY7Gc4oVu1+k2tbVImAJ/+gGHD5cmod9jqktNujRTrSZTROfeV
	 iwkxV7xJb8yJA==
Date: Tue, 10 May 2022 17:31:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, carsten.haitzler@arm.com,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnqTTy7P5IEC6no/@sirena.org.uk>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
 <YnpjKMQnbCr8pD/j@sirena.org.uk>
 <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
 <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Og6uevjlHLvrFs+k"
Content-Disposition: inline
In-Reply-To: <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
X-Cookie: I've read SEVEN MILLION books!!


--Og6uevjlHLvrFs+k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 05:19:04PM +0100, Liviu Dudau wrote:
> On Tue, May 10, 2022 at 03:05:21PM +0100, Carsten Haitzler wrote:

> > is it the:

> > [    7.471809] tda9950 0-0034: driver requires an interrupt

> > that you're talking about Liviu?

> Yes, that is the warning.

That doesn't look too worrying TBH, if it's causing confusion we should
just either fix the tda998x driver to not instantiate the tda9950 unless
it has an interrupt or lower the severity of the log message in the
tda9950 code.  It's certanly not something that should block use in a
defconfig.

Ideally we'd not be using the wildcard compatible in the tda998x and
would know if the CEC functionality was there but I think that ship has
disappeared over the horizon at this point, and in any case someone
might just not want to support CEC for some reason.

--Og6uevjlHLvrFs+k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6k04ACgkQJNaLcl1U
h9CiaAf8CfJa743CI6Kb6mVEilKCVl/Kq4WJcW3/FlcBwXB0qcYDPhTsvU/uFi0M
tKFMk9EQsSWJToZ3B0MnRs3E0GuMWdBEYyRyRVPP2xWu+i1gRs44VsssPrQ1ec0y
x1sveWQ/vjTnOZ42Ie4o7Jd7n0kDGA0JmakEVCTW8c9exFmdxxG1wZIB0hAlujUK
3Kt0kuAvz4IhbI2s2iw0cuanzGN1w5C51Kp2G5GXY4bdmrCNjBYVp1O4sc4DUIH2
7sBnQBkmxtTXPRluRRRiL0XJxQqlbuoXch/5fijA0Oz09Syh9//P16KRiSgqEDpR
ZulpI+fPF5bkN3jy5hEiGqsglx/Y4Q==
=LmTn
-----END PGP SIGNATURE-----

--Og6uevjlHLvrFs+k--
