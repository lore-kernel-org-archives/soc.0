Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA24C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 02:22:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEEE723B28; Wed,  9 Dec 2020 02:22:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607480577;
	bh=YLtysIEwVZnL6MwkzlBFAOiwRSJilA6/Rvv2sqLnSbE=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=GKaJ/aOXo7UtYYKSjhgw41n8kubVYfDm2kRfkNiX/rQiR9EmWwnc9TPlc3S0QZ+Ts
	 miRxmJlBSpcbdfAhrgLGCJ2rQ3LBKQ1wablzV+Lx8rEYS0uXcnodx0Nn2ezslYCimY
	 pe9KcHRibCFEqguwGudiC25PhQIRKBqt91b2igdbMnuULla1DePHfnj1rT00XjRo4G
	 DxkhNEe/gaFswtOCPR52fjrDB5i2Q+l3zpcLBcP7hW2lUMT5y+BTcAqi3ze6woLIO+
	 olIUiNH460fUJOF980A1qJVPx6pN+5YA61t2SZUL1yR/H6YJLtGy+LtPfpmtwHrP3n
	 rHnyKUKbMh6Mg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <pull-1606806458-694517@atomide.com-4>
References: <pull-1606806458-694517@atomide.com> <pull-1606806458-694517@atomide.com-4>
Subject: Re: [GIT PULL 4/4] Remaining genpd changes for omaps for v5.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: arm@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Santosh Shilimkar <ssantosh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Tero Kristo <t-kristo@ti.com>, Michael Turquette <mturquette@baylibre.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>, soc@kernel.org
Date: Tue, 08 Dec 2020 18:22:56 -0800
Message-ID: <160748057621.1580929.5548911592835257040@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Tony Lindgren (2020-11-30 23:18:49)
>=20
> The changes done here are:
>=20
> - Clock driver needs idlest check dropped for IVA for omap4
>   and dra7
>=20
>  drivers/clk/ti/clk-44xx.c                  |   2 +-
>  drivers/clk/ti/clk-7xx.c                   |   7 +
>  include/dt-bindings/clock/dra7.h           |   4 +

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
