Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3ABC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 01:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 465086108B; Thu,  1 Apr 2021 01:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DFB61002;
	Thu,  1 Apr 2021 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617240750;
	bh=1pKzTV1rSUrVvS8ear40uiy8cJ8WKDAJLPyT943wPt8=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=hvo7booBTicx2YIuvBa7JRSRk0xF8QRfxoGJ3xNaNqQ8zq8B+UmUzLVFKDrWXTMIQ
	 5mNS68qGD9DQ3jx/uyCrPb4LVl1df+SxgejeKfjUHfxmdjA18EQ05wNcbvIZK4R704
	 Wcxfx7rJ261yGmN/zMOtkk4qnoGgvundVPRSle/8o7dGVBxcvDz1Y4O42a4T3miNSl
	 XDLFdd40T+chnxyKFRFxRpH37H1DzCE7Fcd+BejN3wuotFFNSfnuNsMAdFNc+wnB7k
	 GAsd6EXeWHsR8l2Clm7zPhAYjRwUfVYGM+CObn7h3VsUnDMHahts5uvIoefxjMzNIO
	 Fp3We/0p0LExQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com> <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 01/15] clk: socfpga: allow building N5X clocks with ARCH_N5X
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, David S. Miller <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>, Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, lin
 ux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, soc@kernel.org
Date: Wed, 31 Mar 2021 18:32:28 -0700
Message-ID: <161724074854.2260335.2479133227977254546@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2021-03-11 07:25:31)
> The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
> (ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
> changes.  Also the clock drivers are the same.
>=20
> However the clock drivers won't be build without ARCH_AGILEX.  One could
> assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
> modeled in Kconfig.  In current stage the ARCH_N5X is simply
> unbootable.
>=20
> Add a separate Kconfig entry for clocks used by both ARCH_N5X and
> ARCH_AGILEX so the necessary objects will be built if either of them is
> selected.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

FYI, Dinh sent some patches to change socfpga code to use clk_hw so it
may conflict.
