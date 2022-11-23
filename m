Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FDBC4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 02:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FFBEC433D6; Wed, 23 Nov 2022 02:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E89FC433D7;
	Wed, 23 Nov 2022 02:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669169043;
	bh=aMhyBhEn7aLHuQHyAXhN7g9Sr2fqtyyeNKmmfSEUb8A=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=u4UY+AUO2u2qktgsvbQYRc+sfDjIdknnvtMIKUUJdpA3Y5Ab3N9k2ZFY+e0Aqr3zc
	 wyMLKCepHqVp2hgDZvXbptPQE1knaeFxQNHHSTLoff35y5j4HAocKLRemQWbCxXKOw
	 R2+xfDsTLidoKjfnegYA2OZ/6hCEMohIWC6QoBCFS8VoJAhDP7e20csxRZJh5Ob3Mx
	 nHLbTuG43ns1EAL7Hj6mUGM5+tfM6lM1oK3E/+PKon3d2BJaGvl0DNd/dfzZlL3cY3
	 Wd+aBQBtKzaAx/fkKyybUOg9tbmzhrp2N3gD9uSI3Svule27ztB4z5CkfqaDAluJrJ
	 P2DmerwOkmmNQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221115135814.214388-2-kory.maincent@bootlin.com>
References: <20221115135814.214388-1-kory.maincent@bootlin.com> <20221115135814.214388-2-kory.maincent@bootlin.com>
Subject: Re: [PATCH v3 1/2] clk: spear: Fix CLCD clock definition on SPEAr600
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kory Maincent <kory.maincent@bootlin.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
To: =?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Nov 2022 18:04:01 -0800
User-Agent: alot/0.10
Message-Id: <20221123020403.4E89FC433D7@smtp.kernel.org>

Quoting K=C3=B6ry Maincent (2022-11-15 05:58:12)
> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> There is no SPEAr600 device named "clcd". Instead, the description of the
> CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
> we should associate the CLCD gateable clock to this device name.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied to clk-next
