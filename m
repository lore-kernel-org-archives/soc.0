Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF32C001E0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 15:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3A1DC433C8; Mon, 23 Oct 2023 15:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8C8C433C9;
	Mon, 23 Oct 2023 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698073394;
	bh=fpFM9m8aSmPZRNqC55pvlGffUEuq0Fu6lXvayw+85Lw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AVt9J0bFS9MbY22bF0uf11w0J84uYZaUJWbqP+KXzPSSrnQ+CxEZ/RRTJWVu6Di+F
	 M4uw6hyQyD0HUJKarnPJSq7UaL7Dq6y6G0Xqi7AYoiNL7AMWsUnaRUg1rP4MAF0wLn
	 iCziNfUL2MmtkCoOmiQ0Nxje3zcJ5oTgVlqpmTIX7jq8MPokkCAcLJm6vk8Wp+c0Vb
	 JbdIVQ4JFS6pxZ2ZRMuNsbMyKuJHyjiC/07GdE96/9uOZ4yar6jQQUdUCdx/s0L0yX
	 jjRCWc3QDnlwyOujseyamEKEJSzoeiOldW8HVn8tjH6ABcTiGVgeQnLbRifEocAxCs
	 U2/SOJu8cow9Q==
Date: Mon, 23 Oct 2023 16:03:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v3 5/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <89295349-198d-4ae6-942e-913f95e34974@sirena.org.uk>
References: <20231023143130.11602-1-kabel@kernel.org>
 <20231023143130.11602-6-kabel@kernel.org>
 <2439af40-0c78-6b41-1746-c71b67af217a@roeck-us.net>
 <20231023165959.104f6843@dellmb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/3D+MmOz0uhnTItB"
Content-Disposition: inline
In-Reply-To: <20231023165959.104f6843@dellmb>
X-Cookie: Never reveal your best argument.


--/3D+MmOz0uhnTItB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:59:59PM +0200, Marek Beh=FAn wrote:
> Guenter Roeck <linux@roeck-us.net> wrote:
> > On 10/23/23 07:31, Marek Beh=FAn wrote:

> > > Add support for the watchdog mechanism provided by the MCU.

> > Any reason for keeping this out of drivers/watchdog ?

> Because this whole thing is compiled as one driver, turris-omnia-mcu.ko.
> The whole driver is specific for one device, the Turris Omnia router.
> Splitting it into separate modules would be unnecessary, the driver is
> meant to provide all the Turris Omnia MCU functionality.

> I've seen this done in various platform drivers.

> Moreover, all of the functionality lives at one I2C address, so only
> one I2C client is used.

That all sounds a bit like drivers/mfd...

--/3D+MmOz0uhnTItB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU2iysACgkQJNaLcl1U
h9BY2wf+Jrh2GcqFiDTOhrKO5fJ5wpQxs+QWCyqBC+A1E0cxrI6sJKCjlhwgqVdD
L6+KgTgje+U8T3ChsqjaBCSFcGAkhvttnJLD+Rypxa+UPYKftgx0yqFh4Ac3M/RK
CtLp0JThiquO5wmEcRFLXsSQOYvlKhpvzI09YKQYaB5byBilwVV8ggA5aUfY+fyo
M7MQI9GlzedlUIn79Ex1nCb8IkCS8pop/f8PaAUiV522LLVlorW4rgeazIMMPlpC
s4nwe+ytPIeoOBwEkCi7jfkXAECDcgbpw8/+ahR9Ng2eniz035NR/evfiTZ8RThy
UABg4iy5gVmJ/GZj6iyvBEPX2NYu+g==
=Ka6A
-----END PGP SIGNATURE-----

--/3D+MmOz0uhnTItB--
