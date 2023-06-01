Return-Path: <SRS0=WuaE=BV=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADDCC7EE2E
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 14:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC767C4339B; Thu,  1 Jun 2023 14:02:26 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 049B7C433EF
	for <soc@kernel.org>; Thu,  1 Jun 2023 14:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 049B7C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4isb-0001mf-F8; Thu, 01 Jun 2023 16:02:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4isZ-004Mqt-G9; Thu, 01 Jun 2023 16:02:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4isY-00AAqk-MH; Thu, 01 Jun 2023 16:02:14 +0200
Date: Thu, 1 Jun 2023 16:02:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm*/dts: Enable symbols for rpi device trees
Message-ID: <20230601140214.i4yvya763sotyjz7@pengutronix.de>
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="amlqjlvulilkdc53"
Content-Disposition: inline
In-Reply-To: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org


--amlqjlvulilkdc53
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 30, 2023 at 07:56:22PM +0200, Uwe Kleine-K=F6nig wrote:
> based on an earlier submission by Aurelien Jarno, I rebased and slightly
> simplified the patches.
>=20
> There was some related irc conversion in #armlinux. Quoting the relevant
> parts:
>=20
> 1685078851< ukleinek> arnd, [florian]: Who would pick up https://lore.ker=
nel.org/linux-arm-kernel/20220410225940.135744-1-aurelien@aurel32.net ?
> 1685078920< ukleinek> arnd, [florian]: If there is an agreement in genera=
l that this is a good idea, I can coordinate with Aurelien that for arm64 t=
here is a v2 with the simpler approach I pointed out.
> 1685083481< arnd> ukleinek: I have no objections to this, if [florian] wa=
nts to pick it up and send me for 6.5.
> 1685083809< arnd> robher: any comments on this one?
> 1685466520 < [florian]> ukleinek: I was hoping we would get an Ack for ro=
bher before picking it up in the brcm soc tree, don't want to ruffle any fe=
athers unnecessarily
>=20
> So it seems to start a beneficial chain reaction, only Rob's Ack is
> needed.

Not sure this might help, but as Rob seems to be away for mail, I'll
try: arch/arm64/boot/dts/nvidia/Makefile and
arch/arm64/boot/dts/ti/Makefile also make use of -@. So this patch at
least isn't a completely new thing and maybe Florian might dare to take
this patch even without Rob's explicit consent?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--amlqjlvulilkdc53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4pOUACgkQj4D7WH0S
/k4Rtwf+JHWlbKMR+NxhWHLdRZU6hn08KbS1LCLpaUT9otzRZkdJoAUM2V6Z9dG2
4ZBaVwEwIt7sJE+7aKJuFUhWW297t1JFjsHWisbn1fi5G/ebSkDEGSTlT0LWcxZ1
1DBF06ni16hOykNFcXgYv/TNDHhjwrVa2DibEld7cxPOf+GV1gf0X3wMlfQSwkBt
kArT5yePh6pu8E9fOv5UOEvDm94yjSt8hUtAupOblf5O2SKr0WnAI6xL53m18gxR
Swh5Wsf2z5GyQCYCnKh7DPu81TmlVpbOuSBsEmeilAvCx0uxwiFceT7wOaoZemrc
vXJuDMbNpYLjO9/nxdrvxfVQA16TAQ==
=h9eu
-----END PGP SIGNATURE-----

--amlqjlvulilkdc53--
