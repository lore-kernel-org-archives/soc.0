Return-Path: <SRS0=C0bj=SA=ucw.cz=pavel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0397DC433F5
	for <soc@archiver.kernel.org>; Sun, 16 Jan 2022 09:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B88F1C36AE3; Sun, 16 Jan 2022 09:23:39 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D532DC36AE7;
	Sun, 16 Jan 2022 09:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D532DC36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id AD7BA1C0B76; Sun, 16 Jan 2022 10:23:28 +0100 (CET)
Date: Sun, 16 Jan 2022 10:23:26 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, olof@lixom.net,
	linus.walleij@linaro.org, catalin.marinas@arm.com,
	robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
	s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
Message-ID: <20220116092325.GA30745@amd>
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <20220113121143.22280-1-alim.akhtar@samsung.com>
User-Agent: Mutt/1.5.23 (2014-03-12)


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> as well as several IPs.

I'm not thrilled by their naming. Intel does not produce "Intel
Fastest in world SoC", and this chip is not actually suitable for
autonomous driving :-(.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmHj5A0ACgkQMOfwapXb+vLGvwCffXsUnQ6Xkz2YZtJkEworpnyu
jUUAn2Zr5IbMgKWYXoNIDLq5OJbwbM48
=Vle9
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
