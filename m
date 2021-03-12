Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16209C433DB
	for <soc@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D4E5E64FF5; Fri, 12 Mar 2021 12:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8A7864FE0;
	Fri, 12 Mar 2021 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615553256;
	bh=tC9vXuNeMt2BcsSWomDvOlVNAT15v0VJGkzD4Spk0nk=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=SBXMNvUWf1XVnDxY8VlIAVrxvfKd50uGoa3aJz0VWBFfyDk+qHSm85xZM/9jbmrt2
	 GPFZ1bPWPXGlPlEXPslBLW1OCbV0GnsJui1JTq+UmleN7b49Wf0AqoJiTPnvdS41/E
	 Yu0Libd3eiVPXFm3dNSuZAZC19beLgkXEDaPrqgtdC4CxHjLwPwFa8QYvTpa83nXFo
	 0LeqqdQ3WESLGfE0z2xrUhduHLXfAvxoIdsF/CsclCyLWmL/fxb69A7vpr8jhbBzM+
	 L+4Ed9UBxDCULa+USnF4te+wbOUgTTbjOug9B3xkUwAZcmyA8I5wVjECfuZhnM9QtC
	 JTnAl9rdPo93Q==
Subject: Re: [PATCH v3 05/15] clk: socfpga: build together Stratix 10, Agilex
 and N5X clock drivers
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-6-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <5dc72298-a44a-1f99-c7d6-b69001f7c7fe@kernel.org>
Date: Fri, 12 Mar 2021 06:47:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-6-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> On a multiplatform kernel there is little benefit in splitting each
> clock driver per platform because space savings are minimal.  Such split
> also complicates the code, especially after adding compile testing.
> 
> Build all arm64 Intel SoCFPGA clocks together with one entry in
> Makefile.  This also removed duplicated line in the Makefile (selecting
> common part of clocks per platform).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/socfpga/Kconfig  | 6 +++---
>   drivers/clk/socfpga/Makefile | 7 +++----
>   2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index 3c30617169bf..bc102e0f0be0 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   config CLK_INTEL_SOCFPGA64
>   	bool
> -	# Intel Agilex / N5X clock controller support
> -	default (ARCH_AGILEX || ARCH_N5X)
> -	depends on ARCH_AGILEX || ARCH_N5X
> +	# Intel Stratix / Agilex / N5X clock controller support
> +	default (ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10)
> +	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
> index c6db8dd4ab35..ebd3538d12de 100644
> --- a/drivers/clk/socfpga/Makefile
> +++ b/drivers/clk/socfpga/Makefile
> @@ -1,7 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
>   obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
> -obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
> -obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> -obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-agilex.o
> -obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
> +				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
> +				     clk-agilex.o
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
