Return-Path: <SRS0=5bhV=RE=ucw.cz=pavel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F67C433F5
	for <soc@archiver.kernel.org>; Sun, 19 Dec 2021 13:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 272DFC36AE5; Sun, 19 Dec 2021 13:17:45 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22F8AC36AE0;
	Sun, 19 Dec 2021 13:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22F8AC36AE0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C46E41C0B76; Sun, 19 Dec 2021 14:17:34 +0100 (CET)
Date: Sun, 19 Dec 2021 14:17:34 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Merlijn Wajer <merlijn@wizzup.org>
List-Id: <soc.lore.kernel.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Dev Null <devnull@uvos.xyz>, Tony Lindgren <tony@atomide.com>,
	Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] Droid3: add initial DTS
Message-ID: <20211219131734.GA28481@duo.ucw.cz>
References: <20211212230459.13579-1-merlijn@wizzup.org>
 <20211212230459.13579-3-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20211212230459.13579-3-merlijn@wizzup.org>
User-Agent: Mutt/1.10.1 (2018-07-13)


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +		backlight_led: led@0 {
=2E..
> +			label =3D ":backlight";
> +		};

This is same as Droid 4, good.

> +		led@1 {
=2E..
> +			label =3D ":kbd_backlight";
> +		};
> +	};

This one is new. We should make sure it is same label as on PCs, and
then document it in Documentation/leds/well-known-leds.txt .

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYb8w7gAKCRAw5/Bqldv6
8qhvAJ4j98N12qs8ggWsOf8fa3uQocG3QQCgkKqMgZBqF8OhavVUJ8iZ6MyJiJg=
=Ovad
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
