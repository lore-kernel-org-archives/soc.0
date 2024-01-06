Return-Path: <SRS0=FkAh=IQ=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E820C46CD2
	for <soc@archiver.kernel.org>; Sat,  6 Jan 2024 14:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA39FC433C8; Sat,  6 Jan 2024 14:32:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A31DAC433C7
	for <soc@kernel.org>; Sat,  6 Jan 2024 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A31DAC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rM7jC-0008H8-MT; Sat, 06 Jan 2024 15:32:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rM7jA-000pLJ-Ua; Sat, 06 Jan 2024 15:32:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rM7jA-00414h-2m;
	Sat, 06 Jan 2024 15:32:44 +0100
Date: Sat, 6 Jan 2024 15:32:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lubomir Rintel <lkundrak@v3.sk>, zhang songyi <zhang.songyi@zte.com.cn>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: pxa: ssp: fix casts
Message-ID: <nrdjrxey27v4lodthfmut3g4ms7uf7az5zruzkmfdwijmktjjz@6sphjciyk6p4>
References: <20240106-pxa-ssp-v2-1-69ac9f028bba@skole.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ocldl2dp53qaj2y"
Content-Disposition: inline
In-Reply-To: <20240106-pxa-ssp-v2-1-69ac9f028bba@skole.hr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org


--3ocldl2dp53qaj2y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Duje,

On Sat, Jan 06, 2024 at 03:11:33PM +0100, Duje Mihanovi=C4=87 wrote:
> On ARM64 platforms, id->data is a 64-bit value and casting it to a
> 32-bit integer causes build errors. Cast it to uintptr_t instead.
>=20
> The id->driver_data cast is unnecessary, so drop it.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3ocldl2dp53qaj2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWZZIsACgkQj4D7WH0S
/k7AqwgApVowd0L0QXcUTJ4iXTbT4jKrA7ZfmmagX+WClWlOwl431TSDCdkp55+z
uzmEnpmEjSftVTHmw4gq1a+TXM0dmxExJ1Rw6klFWu30RWmFbas7pgaB9iHwcNOU
gCBBMWdTsogJ5TMtfzCtWOasPxubowK38vNhcKBRFTCUF389eDsd4gvuR1kivqzd
56ZPsiOKVLiio9n+daUSgRWsUGZteZwLIyHk2dX0Znty40trcHJWkBHbv+cah/Bp
hdWa45xzzN1jWBPykdsoeEW3yEZH2PzD5C7S4ewqeEZ2eODxY6Jujkh0lo6lpKsx
s4kAwp5pdjk/DR7irLKXCTVtbZuAzQ==
=JH91
-----END PGP SIGNATURE-----

--3ocldl2dp53qaj2y--
