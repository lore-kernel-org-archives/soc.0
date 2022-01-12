Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24592C433EF
	for <soc@archiver.kernel.org>; Wed, 12 Jan 2022 02:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E98B2C36AED; Wed, 12 Jan 2022 02:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76F0C36AF2;
	Wed, 12 Jan 2022 02:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641956222;
	bh=Hr2QBpHNZPq1ci4qb18txaMouLIjEEUWdCOWlDhIO+Q=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=UChE2U0IH82C7vzmLh8ra7rEP+whmMTV7gYlVUuC+XTOJ5DSq8PWAwZsKymv2MgjG
	 KpIISTt3I6YGG2HqMZdTv8m+KfnDPw0e9U9yztrGI4zwt630BMx0AJMZhjpYh5Txi2
	 hGV6M1e7VeA3psuNB/326+n/QGG/5E9TFWXcaNYi9wng5PgI/TUMEinjQkh8AkWxns
	 3c6puDLE26xjoazrBu0uDuBPhVq2LTH6Gy2SmJsf/KEBrBpYOPHGacXdfic78G/9FJ
	 xQrw227KAQTTDl0i9TrjZfzCP4OEVBi+XA6pELiTF0VMWdJHGjlbnLcjY15cYyHhlh
	 iUWDQ5pRbnQ2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111215415.2075257-4-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-4-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v8 3/7] dt-bindings: imx: Add clock binding for i.MXRT1050
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Tue, 11 Jan 2022 18:57:01 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112025702.C76F0C36AF2@smtp.kernel.org>

Quoting Jesse Taube (2022-01-11 13:54:11)
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>=20
> Add the clock binding doc for i.MXRT1050.
>=20
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: added all clocks up to IMXRT1050_CLK_USBOH3]
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: added clocks from IMXRT1050_CLK_IPG_PDOF to
> IMXRT1050_CLK_DMA_MUX and moved IMXRT1050_CLK_END on]
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
