Return-Path: <SRS0=HSRe=FN=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A4E743ED
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 06:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE5FFC433C9; Fri, 29 Sep 2023 06:01:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A67FC433C8
	for <soc@kernel.org>; Fri, 29 Sep 2023 06:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A67FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6Yu-00056R-GL; Fri, 29 Sep 2023 08:01:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6Yt-009kA5-25; Fri, 29 Sep 2023 08:01:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qm6Ys-005pya-PG; Fri, 29 Sep 2023 08:01:14 +0200
Date: Fri, 29 Sep 2023 08:01:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: kernel@pengutronix.de, soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Fix Florian Fainelli's email address
Message-ID: <20230929060114.zbex7z4atuzojs45@pengutronix.de>
References: <20230928070652.2290946-1-u.kleine-koenig@pengutronix.de>
 <a5aadd2b-6c88-4a7e-a0e5-580dfe604c68@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buaieoofig252hiw"
Content-Disposition: inline
In-Reply-To: <a5aadd2b-6c88-4a7e-a0e5-580dfe604c68@broadcom.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org


--buaieoofig252hiw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 28, 2023 at 11:21:50PM +0200, Florian Fainelli wrote:
> On 9/28/2023 9:06 AM, Uwe Kleine-K=F6nig wrote:
> > Commit 31345a0f5901 ("MAINTAINERS: Replace my email address") added 13
> > instances of ...@broadcom.com and one of only ...@broadcom. I didn't
> > double check if Broadcom really owns that TLD, but git send-email
> > doesn't accept it, so add ".com" to that one bogous(?) instance.
> >=20
> > Fixes: 31345a0f5901 ("MAINTAINERS: Replace my email address")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Embarrassing, thanks for fixing this Uwe!
>=20
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Who picks this up? 31345a0f5901 went in via arm-soc. Arnd, will you?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--buaieoofig252hiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUWaCkACgkQj4D7WH0S
/k5N9gf9FkIV2dZeRVasQHHxxUFvxnaqnNXX29fBo2bDLXQ1Jpn01s+0YpRBaq2m
rF1ax4Gn1bZVjpq1El3Z4IAn+VR4oRgJtde/+6w3r//9Lz30tzNl3VG3L8sJZIhK
YQotJ1nxMJ6oosnIi6sw3WgUaactU4+4s3acjvYcMBQRu6T7hV9zG/sEEPYJiDgt
M4jzZCDhrvWA3TcHHARAznNthMhX0irb29NNyavwYTXiBwcJtK+NzhFJoEaeqDWG
lEmMIZQFX41FW7IF7Di3S+qQ4O6nNTPtTTH0j7xi6eGsu5lGqVgkvIkg4AqUA6r/
FcYjwQUNpMI79dd6xBl10cJL2my8bA==
=uhmd
-----END PGP SIGNATURE-----

--buaieoofig252hiw--
