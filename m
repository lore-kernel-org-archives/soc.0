Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57609C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 01:33:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 28F786105A; Thu,  1 Apr 2021 01:33:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A3A60FEE;
	Thu,  1 Apr 2021 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617240827;
	bh=ZSMa4F5FXloJJQUx1kfzxITNV51gR6HaqXz0n/51KZk=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=BH9h/twYsSs5gg9Fx69VW9+TSLfOCwzW8d9snXPaJmKt+WmC5bG0v2vFrDa3YMbM2
	 BIzXsUMp2KOrQAMY3A7j7/jk/2PVGClukY1YTcEvEGTjpq2kH1DfNyhfvMwLw8+nmj
	 yx9bAsNpQF50YxZ+oR/8amCHby6/P8EClIbvy7tqJmQQkAY3hiwJub2Pv0DpNY/2OO
	 5XGVL9KBeQG1qNaFuEvSN0lQ3Ee9BC6oZVV579A3027k5b+11CxEoV6/nwiZojKCRy
	 pc5YSXjrrqmVcthwzgL20IKhV6j5a/zFu2yNkpE/38w5S+Vs1w3JT1bKfidNZEyskj
	 Zr3471wPqZMYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com> <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, David S. Miller <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>, Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, lin
 ux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, soc@kernel.org
Date: Wed, 31 Mar 2021 18:33:45 -0700
Message-ID: <161724082587.2260335.4838247818929514810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2021-03-11 07:25:36)
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
