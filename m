Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0852C3DA59
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 15:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67A0CC4AF0A; Fri, 19 Jul 2024 15:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C21C32782;
	Fri, 19 Jul 2024 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721403905;
	bh=o60RdR8lVa2pTQqEz8xaB4kgXJbqbhpsKFph+urOiH0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=KZxUNXwbFLJ9iHhF4icgNBLkMrxBHWzJYT1UKKXx9Yq22AClzdJMs0xkTb5/ZRTSC
	 YHOcL4kLdGB8xo17hTZIA82iijXRjv9LP0L/OFG9LQwugXyPhRCbT0tw67CNvI+JOC
	 vgq4WyHjlsZAxfrr3IHpY0SpY90TZSTAK7AQx60mpxHb5G++k/N4SD3lYytuJRmLEF
	 HORGE0PA5yJ7eYxIYOt4tcxZxLXXhLmBCpyioe/0imNwuZqVfPYcTd373Q9KuXNV/P
	 tm3En3A+nbZDQ2N+KYP59m7H34zNyP/7R2OBvyv98gyK9QahR8z+icoKaWHMSdbOAp
	 Z/LeCw9teNpsQ==
Date: Fri, 19 Jul 2024 16:45:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Inochi Amaoto <inochiama@outlook.com>, soc@kernel.org
Subject: Re: Fwd: [soc:sophgo/dt 1/1]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
Message-ID: <20240719-species-fastness-a7030e42d314@spud>
References: <20240717143016.GA94990@thelio-3990X>
 <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240718-unworn-showbiz-2fb68210b43a@wendy>
 <c6722b03-328a-4647-ac5f-d6c00835b61a@app.fastmail.com>
 <MA0P287MB28222A76DAD21778CAF69C4DFEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L4hehvycwaWAILLO"
Content-Disposition: inline
In-Reply-To: <MA0P287MB28222A76DAD21778CAF69C4DFEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>


--L4hehvycwaWAILLO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2024 at 08:17:41PM +0800, Chen Wang wrote:
> Thank you Conor and Arnd for your input, I have learned and will notice this
> next time.

Something else worth mentioning is getting your tree added to the stuff
that the linux test robot builds:
https://github.com/intel/lkp-tests/tree/22f5cf2c860a5604f182f966b1f105ce1c0becb7/repo/linux

That will build your branch in isolation, and will report if it is not
building.

--L4hehvycwaWAILLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpqJ/QAKCRB4tDGHoIJi
0oVSAP9+J3cGC5Lsoae+ubU8jYrcaJ3N+Gn2y6a7iEY2coQ7OwD/RWCxeAEcXN9g
CerzsXY9BD4RppPvVhF9XFBbCUXKQA4=
=R8Ym
-----END PGP SIGNATURE-----

--L4hehvycwaWAILLO--
