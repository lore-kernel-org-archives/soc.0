Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99BCC433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 11:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFD74C385A6; Tue, 10 May 2022 11:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0604EC385C9;
	Tue, 10 May 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652182075;
	bh=xBzkswwwhpYOAZatV88vrw07nEj4inGtCxGOAgEp7sk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=KnoF9ekdcyNC3xsoYqv6J8IUTjUeLvXycvEMxejdCF21Tlx+eOOZn+0t36NSZI8yb
	 w007kQ2MDIIriroRA/CiuWSN6S5TGdiPPtJlk2RmKfIPOuT/hdmhXC+1605F4GJ4/M
	 XBObxAZPVQs6uBHZBin8cJHwC9CDDkxaCb0XE18hZIQPQyqKCPN5SHzE24nP3Pgm9e
	 aiMaC7QWziwKB7jUDot7p7m1NWw+lfHpteCp6UQt8FTsAFofTnj84BT0DIO/W8/MUJ
	 hZ/FC5T3CxXYH5lQGL+dXqpUP8tnghrRMkbd1StHREx1FMfTY+aKvF//4BWkYxbpDe
	 ThkKHJDZSb6Hw==
Date: Tue, 10 May 2022 12:27:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: carsten.haitzler@foss.arm.com, carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnpMNmNIy1f2/dmc@sirena.org.uk>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G6eEnhcvxCzS/cUW"
Content-Disposition: inline
In-Reply-To: <20220510111545.uqatdfthc6lv5p7i@bogus>
X-Cookie: I've read SEVEN MILLION books!!


--G6eEnhcvxCzS/cUW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:

> While at it, can we get these too enabled which are needed on JUNO IIUC.
> CONFIG_DRM_I2C_NXP_TDA998X
> CONFIG_DRM_I2C_NXP_TDA9950

> Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
> needed or not. I seem to have these for some HDLCD clock testing using SCMI.

Those two, especially TDA998x, are very widely used so should probably
just be enabled anyway regardless of what's on Juno.

--G6eEnhcvxCzS/cUW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6TDYACgkQJNaLcl1U
h9DW9wf7B4BRPxZ658afv6kJQLMhmeok5DgkC7yZq429UjY1RhmyVMRWGyzmRunB
J8mAT15GfJHAqXOaITkPHALXL/k9+g/FKHjNCCUMThZaDkd9L/Vm29r+2O6/o+QG
7p+cBYZVu5z/lpaWMjW3Gm+0Bnl3D/uVpVzLDbF9Am0izq22Ulf6cp51VmcHKG2a
rijNiZkQ5KStCvRB5FazrGX0wt02ClAutM1Gq+z7a5Od8waPMzXfPpsSdXil9vWq
8E1MyZKP+2ctenZGCYNnR9xNzc/EmR+rXLXHu0qvKqlt0TNpBI67RlSf/NFz6m4i
ghHlvWBq1mip9nNLFAbL/0KP3aOD4w==
=LBl0
-----END PGP SIGNATURE-----

--G6eEnhcvxCzS/cUW--
