Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C56C433F5
	for <soc@archiver.kernel.org>; Wed, 12 Jan 2022 02:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9959C36AF2; Wed, 12 Jan 2022 02:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD36C36AEB;
	Wed, 12 Jan 2022 02:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641956238;
	bh=UJ/wlpWaP2zfP6maiTdTn07y5yGSYr3nrb2f0LbFdjg=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=sCZvDs9gOWX/Ar6rMzos/8DtUMezMZFCYGUvz56qxOja+sG9wC3vNgrduTqkklLwu
	 Fx1a271dAbgJlEcU20d/QaUWy2MqHdrTe7slHsVz+UobRJjksjHSLD9JxSXIArkXLC
	 9AkJkPnhMi1G5VC53XmHHzsbbrIi/kZvh3IwbCfLfrr17TDnPnnwdITP1U0IcP4jOS
	 Fmoy52eG/Pad3z90+ux9f4MVpSUickzBB3TgpHCITG7fr+mwU2LpGL/rcJkXM4EPaU
	 JU07pbmcBzj22uXYxh5gTz/qyno709ZxUGKUY1pRLOxzGSeUs1LdOzip+JvAuH4JtL
	 G4DoQjxkw7rWg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111215415.2075257-5-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-5-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v8 4/7] dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Tue, 11 Jan 2022 18:57:17 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112025718.9DD36C36AEB@smtp.kernel.org>

Quoting Jesse Taube (2022-01-11 13:54:12)
> From: Jesse Taube <mr.bossman075@gmail.com>
>=20
> Add DT binding documentation for i.MXRT1050 clock driver.
>=20
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
