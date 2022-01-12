Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54257C433F5
	for <soc@archiver.kernel.org>; Wed, 12 Jan 2022 02:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01597C36AED; Wed, 12 Jan 2022 02:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5266C36AE3;
	Wed, 12 Jan 2022 02:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641955581;
	bh=OZfNXL4MnKaUhxdWponGWXg2xOKdXHnrj3FC9N364Y0=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=UTkUNTMG0yjaLfPj9l9I/3KX8ZmDwsDp5ffl/I16ep0GrMy9AICHSRSDE2u1nFFdI
	 io8WQHFllD7xXSTw3BWZ026ISo6G6H2j62MSCUqgQJ9WJOTEvHNMCa8dfwmQ6HTovR
	 AUPtVxOZ2tiOUqL2UysbHtIxLQiNDOhzPsoMHO6OmxaUwWizHndahJQtySQamMhM4o
	 Z5tMf2s4K+NOh1eIT6N734CPLCsq91p8PoodxUBSNfHG0VjTSQjH2uGb5K3obTqlT9
	 gRpRfZernSklsZubEhqKOXHsLX7m8lHA/lP3DX1QPco+wil31OmBH45DgLcohwWm1x
	 mwhr6CsO/Y4lA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Ydy3qvT5w6IWnR7s@abelvesa>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com> <20220103233948.198119-6-Mr.Bossman075@gmail.com> <20220105235157.8ED80C36AEB@smtp.kernel.org> <89046151-e44e-6828-ad76-8574fba4fca8@gmail.com> <20220110201201.C1E37C36AE9@smtp.kernel.org> <Ydy3qvT5w6IWnR7s@abelvesa>
Subject: Re: [PATCH v7 5/7] clk: imx: Add initial support for i.MXRT1050 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com, mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Date: Tue, 11 Jan 2022 18:46:20 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112024621.C5266C36AE3@smtp.kernel.org>

Quoting Abel Vesa (2022-01-10 14:48:10)
> On 22-01-10 12:12:00, Stephen Boyd wrote:
> > Quoting Jesse Taube (2022-01-09 11:07:42)
> > > >> +
> > > >> +       clk_hw_data->num =3D IMXRT1050_CLK_END;
> > > >> +       hws =3D clk_hw_data->hws;
> > > >> +
> > > >> +       hws[IMXRT1050_CLK_OSC] =3D __clk_get_hw(of_clk_get_by_name=
(np, "osc"));
> > > >=20
> > > > Use clk_parent_data instead and reference the binding name with .fw=
_name
> > >=20
> > > Hi Stephen, sorry to bother you again.
> > > I'm wondering if adding `clk_parent_data` is necessary as it seems li=
ke=20
> > > it wold be a big change and the other IMX boards haven't implemented =

> > > this yet would it be okay if I don't do this, or if it is necessary=20
> > > could you link to a patch set to change it.
> > >=20
> >=20
> > Is it a big change because the imx_clk_hw*() APIs aren't prepared for
> > non-string parents? Can you make some clk_parent_data based APIs and
> > migrate things over gradually? This is really a question for i.MX folks
> > to see if anyone is working on moving away from the string names.
>=20
> I'm currently looking into it. I would suggest we take this patch as is
> and I'll switch it later on to clk_parent_data.
>=20

Ok sounds like a plan.
