Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C90C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 16:50:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A68222B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A68222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OrLJPN5tk4dETCOqBPo14gQkgxH/lTyQ6+VKSeHQirA=; b=LPIXfCAEpd5QMw3nzyYLtsGxC
	xW3pyrqEmAMPmIdRQusxJfS/mUO2sRYRKFq1W35P3CCRQc4TzBG8Gtlv6qU/FtS9moT5ZQpPZ2UKJ
	TEpERXOZjsHmZBbD/DcpD8umpsOu5Pg7kxz1Fx3hasWOlMtnoLjWv4zMHoANoH43Gd/iBotKjpI2Y
	J+d0dIu2u+mi54E6m8TDRCGfS7Rg6LzmLHJttykeUlh9HMIi0vVb/zsn5B1iLcxL2dnAMIXslNQNc
	CBYCNLUay3mSHkfxteOzhP2C1sW8+atD6Vf0OBk2nWnM/gcp0BTflkBymgT/btZT7/eyBjw9UB8PI
	ezAFRtNfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SH2-0005e3-EU; Fri, 15 Jan 2021 16:48:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SGz-0005d9-L8
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 16:48:30 +0000
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
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
Message-ID: <20210115164825.GA466546@ninjato>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_114830_065958_8844C7A7 
X-CRM114-Status: GOOD (  11.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1719779723181762345=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115164825.aN0ovRGjGQYH2iOq7xxyI7ex2Uc30_vcWz7JB1y0Jh4@z>


--===============1719779723181762345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


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


--===============1719779723181762345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1719779723181762345==--

