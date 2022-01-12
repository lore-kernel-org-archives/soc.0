Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96CC433EF
	for <soc@archiver.kernel.org>; Wed, 12 Jan 2022 02:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED43AC36AF3; Wed, 12 Jan 2022 02:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2402C36AE3;
	Wed, 12 Jan 2022 02:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641956272;
	bh=+X9kkG1rprTDzyGONdgoFopTcpGiNRGBdPchBikPezE=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=aHkMSLDhSU2vUvSwHHkP+5Jj52IJ5mkvz2pCMn3skPKSf4gXc2T5FAhkSMZYQDfYv
	 aCB6Fg5g6VhTDeOLMRbUvAb4bX1pylzqS4vY81cVJDnWxeW5t+Fg6TWyfSHEsYGpxc
	 fwKPZER9CMbUz97lFPYEoK0KPTBJ1ZaJuGrfjdwJl+HT1a/wt8sD0LV9gAUL0LN+ix
	 4dduIiV5unv7D1o1+g2IWzlD3RB6eyBq5lmpwHqMMn2i/kDT7vmZzHYKp+0Mcec0cv
	 FyMZWrM4HoCt1VacLf1pSYlHvwwKlRvX28XkrSZ1h8OMMzdhCBqcwc6AmGNq+t3Y40
	 P/Gvp8tCtGt1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111215415.2075257-6-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-1-Mr.Bossman075@gmail.com> <20220111215415.2075257-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v8 5/7] clk: imx: Add initial support for i.MXRT1050 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Tue, 11 Jan 2022 18:57:51 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112025752.C2402C36AE3@smtp.kernel.org>

Quoting Jesse Taube (2022-01-11 13:54:13)
> Add clock driver support for i.MXRT1050.
>=20
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
