Return-Path: <SRS0=26A/=BL=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E80C7EE23
	for <soc@archiver.kernel.org>; Mon, 22 May 2023 06:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7D4FC4339B; Mon, 22 May 2023 06:23:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59214C433D2
	for <soc@kernel.org>; Mon, 22 May 2023 06:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59214C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q0ywb-0001Xd-Gv; Mon, 22 May 2023 08:22:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q0ywY-001wVk-Sw; Mon, 22 May 2023 08:22:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q0ywY-006nxT-7b; Mon, 22 May 2023 08:22:54 +0200
Date: Mon, 22 May 2023 08:22:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Aurelien Jarno <aurelien@aurel32.net>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH 0/2] arm/arm64: dts: Enable device-tree overlay support
 for RPi devices
Message-ID: <20230522062254.6biyisl4qp7krm3h@pengutronix.de>
References: <20220410225940.135744-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owu27q3xhaobzkom"
Content-Disposition: inline
In-Reply-To: <20220410225940.135744-1-aurelien@aurel32.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org


--owu27q3xhaobzkom
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 11, 2022 at 12:59:38AM +0200, Aurelien Jarno wrote:
> This patchset changes the generation of the Raspberry Pi devices DTB
> files to improve the support for out-of-tree device-tree overlays, like
> it has recently been done for the Nvidia SoCs.
>=20
> I personally only need that for arm64, but I have added a similar patch
> to do the same on arm.
>=20
> Aurelien Jarno (2):
>   arm64: dts: broadcom: Enable device-tree overlay support for RPi
>     devices
>   arm: dts: Enable device-tree overlay support for RPi devices

I like these changes,

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Given there was no feedback for >1 year now, I wonder if there are good
reasons against this change, or it just fell through the cracks?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--owu27q3xhaobzkom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRrCj0ACgkQj4D7WH0S
/k7/bQf/Xf3slCx2ZMVVh1c6RAW7rjXO+Ue9JKEO4+afkalpGJNYhhbifc/NcB+8
naeNjgjhQc0g0vAP2MSK+17Tj7vysFC1wKruQ+AhC0rDeCsjGxZNTrZcMCBRyLJm
wYJU+BQxZshzkmUqZvdLQxfFnwt4r8H8cJXo3V0hgSzX9RXEyY+4X5j7n3Mg1HeH
GCY0EbiWds7uQKEMQWh6ITPS8OM8Cdacr5/bcaSM+Sb9wBOg/pejoM0fcnY2hH0w
p0zS7EQox7x4LHa5/SPO+aNrMXYi6iRlfKO/B/jWMWRBeNRnQksQFzWQ3iFCl0GY
lEJ2swJ2QggYRTK81XipLR2fa45pJw==
=T73M
-----END PGP SIGNATURE-----

--owu27q3xhaobzkom--
