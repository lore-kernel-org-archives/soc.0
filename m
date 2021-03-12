Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D70C433DB
	for <soc@archiver.kernel.org>; Fri, 12 Mar 2021 12:48:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8897465004; Fri, 12 Mar 2021 12:48:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C27F764FF5;
	Fri, 12 Mar 2021 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615553316;
	bh=0M3AWAnfNcs/YwhscgnVDNjOxG7wujCB0Tnhsuxfu4M=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=tYS7wMpvc8ozOG2Vz0TZhyKmTxGN8o8bUAYQJ1RM6gYkDL2+jHfYwQhjJMgJkjxy/
	 AGFUkZOXTkaUHsrtUSx3AmyjE60KOQJuhLQROl/w7Tm84mvcTe0nQoI8EIgjVo1p56
	 7/ODZrr9JDAjEj25OPYw9IhND9/hfNqfd1NgOeDNG2ThZ2oQ8kCxB4z/uVPARd37Ac
	 CjFiPVkgFqEHLYNvIKNOy2XDM0coEexoTl5wLnA47VPh+6Z2noTtHzgzIR6Qgk3nSy
	 /Bm0Sj1ifjvKczJv/OX9bWOjSxzHzro/Yu+B1I53wZvSpmkZWivNrCPwFsCios7Xr6
	 5y1sBZT+or9hQ==
Subject: Re: [PATCH v3 10/15] clk: socfpga: use ARCH_INTEL_SOCFPGA also for
 32-bit ARM SoCs (and compile test)
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
 <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <3470598f-b301-952b-3b13-43b36ff8a8fa@kernel.org>
Date: Fri, 12 Mar 2021 06:48:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 9:27 AM, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
> 
> There is little point to share clock controller drivers between 32-bit
> and 64-bit platforms because there will not be a generic image for both
> of them.  Therefore add a new Kconfig entry for building 32-bit clock
> driverss, similar to one for 64-bit.  This allows enabling compile
> testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/socfpga/Kconfig  | 6 +++++-
>   drivers/clk/socfpga/Makefile | 4 ++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index b62ede8cad01..0cf16b894efb 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -4,10 +4,14 @@ config CLK_INTEL_SOCFPGA
>   	default ARCH_INTEL_SOCFPGA
>   	help
>   	  Support for the clock controllers present on Intel SoCFPGA and eASIC
> -	  devices like Stratix 10, Agilex and N5X eASIC.
> +	  devices like Aria, Cyclone, Stratix 10, Agilex and N5X eASIC.
>   
>   if CLK_INTEL_SOCFPGA
>   
> +config CLK_INTEL_SOCFPGA32
> +	bool "Intel Aria / Cyclone clock controller support" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
> +	default ARM && ARCH_INTEL_SOCFPGA
> +
>   config CLK_INTEL_SOCFPGA64
>   	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>   	default ARM64 && ARCH_INTEL_SOCFPGA
> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
> index ebd3538d12de..e8dfce339c91 100644
> --- a/drivers/clk/socfpga/Makefile
> +++ b/drivers/clk/socfpga/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
> -obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o clk-pll.o clk-periph.o \
> +				     clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>   obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
>   				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
>   				     clk-agilex.o
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
