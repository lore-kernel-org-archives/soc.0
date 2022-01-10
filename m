Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B00C433F5
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 20:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBC0FC36AEF; Mon, 10 Jan 2022 20:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E37C36AE9;
	Mon, 10 Jan 2022 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641845521;
	bh=1lf/ELFerWFfOHZ3BPKudqF7I3BLnH/Pps9NEDUeYrk=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=ITvSF+sawCB0+JHKmRu1WmUCj1uknYVJCZGVCjOto/T71DioD4j4dtQlmo13kNI4C
	 qG3IZxBgeMtnVW1oWVDFDnsPP+/vTYgwrTTIOTMo9OrLi0+XDGUety+aD/Yqw/brGR
	 NZnq1q2db3ysnReYB3rnQtMEoKgHe/AYgG6+cq+odFqVbY2wUEilPziPRkqRdTIERn
	 Ine9S31pxMowd789Az8jJGIqLUu/FE7F29520cm6HYfENmXd3iHszCMhXjdZa4gWEh
	 e4fxiaZRkpzrSfvIDaFEkAxT/fpIYGcH/nNDslQ7WOVaCaFg0By088I6rR3Y0ME4nJ
	 c+OOSMwzdURJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <89046151-e44e-6828-ad76-8574fba4fca8@gmail.com>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com> <20220103233948.198119-6-Mr.Bossman075@gmail.com> <20220105235157.8ED80C36AEB@smtp.kernel.org> <89046151-e44e-6828-ad76-8574fba4fca8@gmail.com>
Subject: Re: [PATCH v7 5/7] clk: imx: Add initial support for i.MXRT1050 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Mon, 10 Jan 2022 12:12:00 -0800
User-Agent: alot/0.9.1
Message-Id: <20220110201201.C1E37C36AE9@smtp.kernel.org>

Quoting Jesse Taube (2022-01-09 11:07:42)
> >> +
> >> +       clk_hw_data->num =3D IMXRT1050_CLK_END;
> >> +       hws =3D clk_hw_data->hws;
> >> +
> >> +       hws[IMXRT1050_CLK_OSC] =3D __clk_get_hw(of_clk_get_by_name(np,=
 "osc"));
> >=20
> > Use clk_parent_data instead and reference the binding name with .fw_name
>=20
> Hi Stephen, sorry to bother you again.
> I'm wondering if adding `clk_parent_data` is necessary as it seems like=20
> it wold be a big change and the other IMX boards haven't implemented=20
> this yet would it be okay if I don't do this, or if it is necessary=20
> could you link to a patch set to change it.
>=20

Is it a big change because the imx_clk_hw*() APIs aren't prepared for
non-string parents? Can you make some clk_parent_data based APIs and
migrate things over gradually? This is really a question for i.MX folks
to see if anyone is working on moving away from the string names.
