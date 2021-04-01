Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EA2C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 01:34:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FBAF6108B; Thu,  1 Apr 2021 01:34:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD99C60FEE;
	Thu,  1 Apr 2021 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617240869;
	bh=bLi8Heg2h/8F0/IsFstgTPeT7YXO5Y5atCsLe3vWS2w=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=Wg86w79o4OsG6qzMODajtnJYG9UaK0xGUh6Wt3/BAR/XuIav+wR6d9ot1YGAUpi2p
	 cciswzGAhHIZBJ3A2M5t4i2dlQSaRMSh3dLU8NJzutW0yIrZGmATeEDCCKr8evYis8
	 ZHl/ZlQZAOc8/p6qVB8Wi5FXCk/gTik+wYfN9VnlEByK7fdgxtS7+5HBM7001ynMzo
	 iql829XIajtuGciRkHn5vC+xSVVOFx6oYwFP8U92Bpnh7XNtw5bsCpQ3sX6kfTFdkY
	 cqNZ6WvkmNfyOKtzvNt6dWe4zCFLRGqq19b57oR/zSOfRWon5NOlsRTT5drYMgTEz8
	 TQIR2cPeo9few==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311152707.1317791-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com> <20210311152707.1317791-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 09/15] clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, David S. Miller <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>, Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, lin
 ux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, soc@kernel.org
Date: Wed, 31 Mar 2021 18:34:27 -0700
Message-ID: <161724086773.2260335.15880909020293435157@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2021-03-11 07:27:07)
> The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
> or COMMON_CLK so they should be compile testable on most of the
> platforms.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
