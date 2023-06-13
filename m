Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9417C7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 02:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9638EC433A0; Tue, 13 Jun 2023 02:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFE0C433D2;
	Tue, 13 Jun 2023 02:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686622565;
	bh=y+tpkmHrhhV80BKkf0IRp3DxiL2VcneOgIpNiVwOdWs=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=rePw19zwE9GhrlFO5ez6Zv7JrNsZKq2b5KihZPsopJy5mv7LfIJiBkXtRidvrLP58
	 K7ExCf7v3IDwDdpB+qcDB+9PTCAx54zH9UMo7JeSpOOV73Q43kWvQe3W19JasCudaL
	 rmrCpBl/u2aRupE3OAvjA6oSns3zlkcYWXEUjnXhrFa9RUBXPL9p7lnr54l97KCIvQ
	 8czF+76X7KufQb+cEa3sZJhqRgNgTKRAzqqtna/vC1YvUNSTWhesc8QVjUjurTg/FJ
	 DMyf8Jad2MO9ps8oF6JbiiKkuyibMNceUplWRVuncl9DK3SLKbzwa0DU9NBdb2d4Qa
	 1eKpxkximL1Bw==
Message-ID: <b4a20267862f6cd20d50016cb130ba95.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <233f4e83-e872-5499-2ca7-a1c277425fb0@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com> <20230605040749.67964-9-ychuang570808@gmail.com> <bda5f640831a8080a83eca8c8e37c30d.sboyd@kernel.org> <233f4e83-e872-5499-2ca7-a1c277425fb0@gmail.com>
Subject: Re: [PATCH v13 08/10] clk: nuvoton: Add clock driver for ma35d1 clock controller
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org, schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jacky Huang <ychuang570808@gmail.com>, catalin.marinas@arm.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tmaimon77@gmail.com, will@kernel.org
Date: Mon, 12 Jun 2023 19:16:03 -0700
User-Agent: alot/0.10

Quoting Jacky Huang (2023-06-12 18:37:31)
> On 2023/6/13 =E4=B8=8A=E5=8D=88 09:02, Stephen Boyd wrote:
> > Quoting Jacky Huang (2023-06-04 21:07:47)
> >> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nu=
voton/clk-ma35d1-divider.c
> >> +                                           int num_pdata)
> >> +{
> >> +       return clk_hw_register_mux_parent_data(dev, name, pdata, num_p=
data,
> >> +                                              CLK_SET_RATE_NO_REPAREN=
T, reg, shift,
> >> +                                              width, 0, &ma35d1_lock);
> >> +}
> >> +
> >> +static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *=
name,
> >> +                                    void __iomem *reg, u8 shift, u8 w=
idth,
> >> +                                    const char *const *parents, int n=
um_parents)
> > Please don't use string arrays for parent descriptions. Everything
> > should use clk_parent_data or direct clk_hw pointers.
>=20
> I will use clk_parent_data instead of strings.
>=20

When you use clk_parent_data, just don't set anything for the "dummy"
clks besides a -1 .index to indicate there isn't a parent for that
entry.
