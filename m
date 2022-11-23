Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69052C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 02:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BBAAC433B5; Wed, 23 Nov 2022 02:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EF4C433D6;
	Wed, 23 Nov 2022 02:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669169056;
	bh=ulpO3f2wlp8+JTQoS9BoR12+8ZCYLfJxOcANHZrFR94=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=Quqjm1834P+hEsXox7bY7saMkrC248pEVKQ3pMd6G5C5v7J8LF6O/5Ou6WFPhsuwW
	 ot1PnXnGA01kor49ImwKTx1QsvDubb6Ot66RyCy4RMlNyzDp3nteVZw+TUCrg4rNL8
	 rJ7vs8ROVyPsw3b16B+/msn9lx1QY6P4IqlK+ul21DL8gURFzL0R9vXzCYVC4RMYyo
	 ZMOT05/niiLbqvnR3Fehia/egr4Da4l3csPGEr2uSS8tN+svP1ARWsN7GSfGWSHumv
	 Cnmm/Lrh0sV6mrsOkdMPqdoQZo1MtS7aViDXZbPjzhPu+AZBLmO+ZTO1PGFts5LFwQ
	 1fHPk/v2iZtBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221115135814.214388-3-kory.maincent@bootlin.com>
References: <20221115135814.214388-1-kory.maincent@bootlin.com> <20221115135814.214388-3-kory.maincent@bootlin.com>
Subject: Re: [PATCH v3 2/2] clk: spear: Fix SSP clock definition on SPEAr600
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kory Maincent <kory.maincent@bootlin.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
To: =?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Nov 2022 18:04:14 -0800
User-Agent: alot/0.10
Message-Id: <20221123020416.27EF4C433D6@smtp.kernel.org>

Quoting K=C3=B6ry Maincent (2022-11-15 05:58:13)
> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> There is no SPEAr600 device named "ssp-pl022.x". Instead, the description
> of the SSP (Synchronous Serial Port) was recently added to the Device Tre=
e,
> and the device name is "xxx.spi", so we should associate the SSP gateable
> clock to these device names.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied to clk-next
