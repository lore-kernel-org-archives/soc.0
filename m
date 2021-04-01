Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E55EC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 01:33:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0B2261078; Thu,  1 Apr 2021 01:33:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA19A60FEE;
	Thu,  1 Apr 2021 01:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617240812;
	bh=598DKBcAK/NF0LHzzuzH0WtFEvaGwrQggdQRWGX8ti4=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=WhF2QaSpCrTuMOawZKX92SZjGsEvoBkMeilOfJci+eNZEztdZJKLl+uK0dTXJxj9P
	 mlJ8uEG7RXsH2U83qRb20bxtUiPkwF6aiCbdmS1Io/bn3Cy9Ri6iSVva3C0CqRJv1w
	 K8D0cwALtGfV98xuZsN5HYaeWMmEG27v299HqR+t44o6D3OnjLJI42QAJ99/3GvNqp
	 smRFF/qr1ODDm7Lpy6ysNnf2kuvn2b0Zn17F6V7Oxu9Gl15bzB8MUNyFtkfV+SP6hz
	 u15je3tk2f04+ELBR8ApFW6GX2reEnC8KdW7cPzPZh91l4A74DpzeX82oVkrYCeLQm
	 3jxqvZ0JKCH+Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311152545.1317581-6-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com> <20210311152545.1317581-6-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 05/15] clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, David S. Miller <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>, Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, lin
 ux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, soc@kernel.org
Date: Wed, 31 Mar 2021 18:33:31 -0700
Message-ID: <161724081168.2260335.16893413885670212373@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2021-03-11 07:25:35)
> On a multiplatform kernel there is little benefit in splitting each
> clock driver per platform because space savings are minimal.  Such split
> also complicates the code, especially after adding compile testing.
>=20
> Build all arm64 Intel SoCFPGA clocks together with one entry in
> Makefile.  This also removed duplicated line in the Makefile (selecting
> common part of clocks per platform).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
