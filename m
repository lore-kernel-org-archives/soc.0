Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F321C433FE
	for <soc@archiver.kernel.org>; Mon,  3 Oct 2022 19:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11F5AC433D6; Mon,  3 Oct 2022 19:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FDFC433C1;
	Mon,  3 Oct 2022 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664825349;
	bh=Ohxb9wVDCtANaJlNvXb161+sInuADg+bmODHASpwDzI=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=cEF9RaEDd3RP6PirkvbpABkj2JwRnBIjLoQsMY3JCgO504sptM+ojZNkqtzR9x40p
	 eVq66NdgGwpbpMObcHo6OHnBL9fEY4OUEh0H6PA3Xoj+3uZBKtChbgAOVTAGQzi/mJ
	 q6K3WOnvIJW1MlFenYlquR2dJo3uRW5FnhyJADv9ws40td29YHa5D+/LuTJIesaBCI
	 wfoxPR5YWu97LSiQG83oz0419mWrBkJR/jrOgyWm/O5WHOgj1mGOLMA0MllubfLnNZ
	 6a9Omzs2P/TyPfMqN+s/Hr6OEThZp6jZEQKNoh963IRD6utEJ3ZbLGN/PB/RBL+4me
	 c7+hKy9YS5GwQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <663cdebe-755f-3a93-07f4-da662ccb5a43@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com> <20220901183343.3188903-9-Mr.Bossman075@gmail.com> <20220930202819.C4952C433D6@smtp.kernel.org> <663cdebe-755f-3a93-07f4-da662ccb5a43@gmail.com>
Subject: Re: [PATCH v6 08/10] clk: imx: Add initial support for i.MXRT1170 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com, cniedermaier@dh-electronics.com, clin@suse.com, giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Mon, 03 Oct 2022 12:29:07 -0700
User-Agent: alot/0.10
Message-Id: <20221003192908.E4FDFC433C1@smtp.kernel.org>

Quoting Jesse Taube (2022-10-01 09:15:38)
> On 9/30/22 16:28, Stephen Boyd wrote:
> > Quoting Jesse Taube (2022-09-01 11:33:41)
> >> +
> >> +       anp =3D of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop"=
);
> >> +       pll_base =3D of_iomap(anp, 0);
> >> +       of_node_put(anp);
> >> +       if (WARN_ON(!pll_base))
> >> +               return -ENOMEM;
> >=20
> > The kzalloc() leaked.
> LOL `grep -r of_find_compatible_node drivers/clk/imx`...
> Shall I send patches for the rest of IMX.
>=20

Sure? Introducing more things to cleanup isn't useful, that's all. If
you have other things to do then don't worry about it.

> >> +
> >> +       imx_check_clk_hws(hws, IMXRT1170_CLK_END);
> >> +
> >> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_=
hw_data);
> >=20
> > Use devm? Or implement a driver remove function?
> Uh this is the same in the rest of imx could you explain a bit more?
>=20

Use devm_of_clk_add_hw_provider() so that the provider is removed on
driver unbind.
