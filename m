Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B36ECAAA1
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 16:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46C8AC433B5; Fri,  9 Sep 2022 16:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040F0C433D6;
	Fri,  9 Sep 2022 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662740741;
	bh=nLTkFs9z8j1QAUfnVyzo6vGLqtoch+RIOPyCMCcl2uw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=J5FVvyH1EVRXOTwPE0BauShMbiB5bdTn7RohDVmb1aMx4Fhz9ELsV5LD3hQeTSJq6
	 5W5AbwtymicTxHkpjaEfYq6PLt9HzZ/8plvaMKJIroqS8JJAEpbOLU+SlwUaDd7cX+
	 Tia03tbbyQVWQyqHTRgfARMKvdYS9HAIOykt/VWRc1YUogF7jxk6CgABc66pLr48Fi
	 h5xHdK1b2xNKoxasupM0n5AmhbW48cg10uo1mBjBfB5R7eVQOtd4azaxTEGNs3UBRi
	 6559jUxqZz7g4sO7ilRGnyJrESsy7VFq8zCCSpxgz1ZzKqQ7YkF8RAIBKKcWZYAP7Y
	 lNTCMkvWaGnqg==
Date: Fri, 9 Sep 2022 17:25:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	f.fainelli@gmail.com, andersson@kernel.org, arnd@arndb.de,
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com,
	dmitry.baryshkov@linaro.org, geert+renesas@glider.be,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	marcel.ziswiler@toradex.com, michael@walle.cc, shawnguo@kernel.org,
	soc@kernel.org, vkoul@kernel.org, will@kernel.org,
	lkft-triage@lists.linaro.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Benjamin Copeland <ben.copeland@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: enable ARCH_BCM
Message-ID: <Yxto/ZSqhxvkxu6v@sirena.org.uk>
References: <20220906033957.4377-1-f.fainelli@gmail.com>
 <20220909073509.301363-1-naresh.kamboju@linaro.org>
 <51e6ea21-8af4-775d-1561-6671cfc50ecf@linaro.org>
 <CA+G9fYv79_BrWT28DVfu4JHasiOKMeL-Wr_MJapU5xeB5VomBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FtJCDRPKOZ+t0pWK"
Content-Disposition: inline
In-Reply-To: <CA+G9fYv79_BrWT28DVfu4JHasiOKMeL-Wr_MJapU5xeB5VomBA@mail.gmail.com>
X-Cookie: FORTH IF HONK THEN


--FtJCDRPKOZ+t0pWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 05:54:11PM +0530, Naresh Kamboju wrote:
> On Fri, 9 Sept 2022 at 13:08, Krzysztof Kozlowski
> > On 09/09/2022 09:35, Naresh Kamboju wrote:

> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

> > The patch was sent on 6th of September. Your report on 8th of September=
=2E..

> Understood !

> Maybe off-topic,
> Testing Linux next seems to be a bit late to report the regressions.
> Our testing would have build and boot test devicetree/for-next or
> devicetree / master branches to find early regressions.
> or Any other well known maintainers trees.
>=20
> Your suggestions are most welcome for improving Linux kernel quality.

Checking maintainer trees in addition to -next isn't going to be that
substantially faster except at weekends, the whole thing with -next is
that it gets built daily so depending on when patches appear in the
maintainer trees and how long -next takes to build you'll be running
tests less than two days earlier, the way people's timezones work out
it's often under a day for many maintainer trees.  It can reduce
turnaround time for the specific tree, and it can be useful for
identifying where problems come from, but on the other hand the
integration that -next offers is important, some critical stuff only
appears in -next and obviously each individual tree that gets covered
separately is more load on your systems and triage.

The key thing with -next is that it's a moving target so it's useful to
turn around results as fast as possible so they arrive before it gets
rebuilt, or if you've seen something on an older -next check that it's
still relevant when you do report it.

--FtJCDRPKOZ+t0pWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbaPwACgkQJNaLcl1U
h9Aviwf/bDwMY5MXtBzrvxkPJEUsVcJb7x0Owkq0b0OQqrQRkAZg7MqOa84hOm0Z
EiMVHZNqWLYPB4sn7dXrZsoqx8q/yjbRSZmd3VD9tLxnZZMbNTISLMbhLB7HpYrL
siQVtgST7v5sviKAfGFc0sLz1JkQGShnT7zidkgjsVqybGHvlv3mHb8uLPpHtEXu
RN7znotv2WyiaRqUR72MsWn8mcsjMvwE8SztGeK+wluhjM1M9G+1pRlQBHxD0YDq
7cSAVfdplTdCur0018aysh7GaEleIBVo7nfZSEtnGuGFno4D90cmrBbI6352z3Io
HLsqRGgbcQRSNbW4rA2+7s6eDxXRVA==
=QUMJ
-----END PGP SIGNATURE-----

--FtJCDRPKOZ+t0pWK--
