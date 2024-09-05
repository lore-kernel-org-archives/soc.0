Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C8CD5BC7
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 14:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45B4CC4CEC5; Thu,  5 Sep 2024 14:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8636AC4CEC3;
	Thu,  5 Sep 2024 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545524;
	bh=LiM18QQ8KZAdWmtS108wtpHVsXHV+blPnGP7wyjLLYc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=bnZMJDNihQFag3NjCVTfjamz2+EUvxUgZm+SQaw/xpWFUyXpOZEBCHamNfLshtGug
	 /XnxEG/2u4ODiNWmiP3C5yB0TkoT+uINqmybvGTNeP9eXckdiNBp2C9bCl0yh/8IO8
	 5z/Yt8apcKsBP5JyOv5FuoiXoLShM573HjQaV6lBM/yFpVE0lhppXBnr8Nj3yIi2q3
	 lvwNXvGUlF/Q4ZRiZmYH5/HCWXkGzHqSQYOoEDJNgHv4DvL5T9GWBA7At8F6qCOEwr
	 C/ms3hT/ttBHItLRnFbhv1tFxl5i03U3XZahbkOYyVuJppQVSR0W1cLcFy1aGHwgiM
	 S4YJCnnD9LZhw==
Date: Thu, 5 Sep 2024 15:11:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Damien FLETY <damien@flety.net>, Olof Johansson <olof@lixom.net>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	"soc@kernel.org" <soc@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: PATCH: Turing RK1 DTB Fan
Message-ID: <d966c347-6cc3-4cb1-b8d5-33c37f693a21@sirena.org.uk>
References: <bZF0liAaH-7lJuzf_4iIfAWAgwYauu7IpIJMMpY7BT8mZXiKZFZ797Sa9gONDEt2wIFlLd4l10qSfs44ZAiBJ7_c3yvAFci4kuOdeYy7ZQU=@flety.net>
 <CBBY-R4n8r7s8-gRkQLEWfFmBE-2ncks_UUQnnajujY-KYz4Xug2rwDI_pOZYLBi2d3qy-gP9c4l0i61ptlm39t_wscyvJPVV5CTlsdm-as=@flety.net>
 <52a52558-2f7a-41ca-a0ee-98ef4eca3e6e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yUVLDQtxfzSSGWT"
Content-Disposition: inline
In-Reply-To: <52a52558-2f7a-41ca-a0ee-98ef4eca3e6e@app.fastmail.com>
X-Cookie: The horror... the horror!


--4yUVLDQtxfzSSGWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2024 at 01:23:34PM +0000, Arnd Bergmann wrote:

> - Use 'git send-email' to send the patch in a form that can
>   be applied from the mailing list.

There's another tool 'b4' which does this too, plus wrapping some other
technical bits of the upstreaming process:

   https://b4.docs.kernel.org/en/latest/

--4yUVLDQtxfzSSGWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZvC8ACgkQJNaLcl1U
h9C1Lgf8CXzL/OxY4rM8auy+qZrwePpfNccMQKLqt6qZj5W0NPkggd/r6Mrr9J4Q
rKIKF7FAjD3TtQfVl3UyAqU19msTcG+9TSZBjQFr7OXT4hcvxdpzlMA97vcRyoh+
fogu+4rT4KcnBiURQHqtKTUWwVqQRBJZGaveNL1MqEMt6eVzkwFHN5bhr23EPOk5
s3+bbSQELNWV8NrFGR8f2nXLriv3VWqk3YnWuNhEZj0UosVgAkQslgvgVwVHyzHT
+dWgfT1aMC/DihaTHc21PYkZtqp6+v+qQDzafEnIrcUKziJ2C/irFa9CuHlxIIY9
c6j+TksJ4fqLmbgFxiqQBHr1KZtPcQ==
=Bity
-----END PGP SIGNATURE-----

--4yUVLDQtxfzSSGWT--
