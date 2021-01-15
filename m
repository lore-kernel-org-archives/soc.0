Return-Path: <wsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F881C433E9
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 16:48:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC2482313E; Fri, 15 Jan 2021 16:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310D9222B3;
	Fri, 15 Jan 2021 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610729308;
	bh=HILkcxtkAP8++7FYsCWqvIaUEywPTFRgunyMvs1A8QQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=qe+G84d/fcRHu9fMKLutxC56OjUkiJmqKahrtb+3jnaysGhicMlcRScYOrqxEWDFd
	 GN8NvaA6717jiPoiGA4p3gJwlUXGqgyx3kQiMbRdBZe3G8U2kG2pFnDqqnkbnNHM6W
	 zhzXgza9mH4HIYUycJWLZ9wx+VZzsUlstHHBo+4J19dKLFbRV8rNMcWP/rvuKEcDrD
	 d09JechN21coJSZx1qMETBb+KvzzpOW6WK9NVUuKL+JnSSQDf1qKnzIudAuFDbTNn/
	 ZDD64+5fmch3pDsXApudYl4DiYVgqpWnsa+xkmzNFjMqB0UvTh/pdIJDGIXXLovt4r
	 mnE4bY2oUBjZg==
Date: Fri, 15 Jan 2021 17:48:25 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-spi <linux-spi@vger.kernel.org>,
	Linux I2C <linux-i2c@vger.kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
Message-ID: <20210115164825.GA466546@ninjato>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Subsystem maintainers: Please let me know if you want to pick the
> driver removal patches into your tree, or if which ones I should apply
> here, with your Ack.

I'll apply the I2C patch here. Thanks, Uwe and Arnd!


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmABx1UACgkQFA3kzBSg
KbYTYA/7BC5oMTeiR0NZuH753UoTSs+YWVXUtCN9/UAnZpSdMn1TKaqhBrqLt1gu
cZXHBZbHIV4WsOAHS2v+kI6rwbMHPA8hW6AswWdgQvry/sVcqa1rO+oR4Parbxw3
sz+UneLkleaoRugvo/HwLqDT4V876nlRiWtHvqDk9KQ5oIq28KTGYyUiucTGoWZ3
vl9sTbC6Pi9ko06Pe27X4mYnn3ebC58q6yt93hvEIgfeFXpU8MvzsSkiqTHcPuIg
8epzRLSQ1Tr6f2Tcxno2X4y9CCZu7Zr8jtK2ATOs56F5X+voR34k+VJbToLJceFP
Q11UiNtMcGYBXybeHRP0EkZAFnjB1OzLD5eE1fvfBsnn76hDpNwOhmaLnDp1Twos
Pszzecylm54E1fN164+3DrVe29o6hlKk/DKErVzef75/9tg5fWYzeDttBwTx+sD4
YtldjOCF9gVu5mwmzDhFK1DKDRTw7Cg6eixKkJRK0c5aRxl/qEI1hkSVbQFXqu7z
KevlC9y2zWDF5fcixLPaNzsRFF8zYC/4/rOON7tbqCN1nEclUUe8nW6NvC5hzCaX
TCIF3K25RP3qcyEAfNqb5x3e414s/MYEt4+u5I+/9LHUK5A7EfJtpXNjwhijTjaK
G5qx96FMRbrcH7Ul+gC8jXJ8lhI0YiCdmq1r1crXHpXR3N7T7kg=
=GmSO
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
