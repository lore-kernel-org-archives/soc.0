Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2341C433DB
	for <soc@archiver.kernel.org>; Fri, 12 Mar 2021 12:48:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3F3364FFE; Fri, 12 Mar 2021 12:48:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0097964FEA;
	Fri, 12 Mar 2021 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615553293;
	bh=zqQ+TLOED1Y90DQzgPBBXvQKHXerBwQtp3QdYQkiG3o=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=KV8zoYaMonNQ2Ukt9r6YBu5pNJuO+KRTKV0eB+qBSeDuj7mpk25jEhvp2VVPbhENZ
	 HlPB94sz8D+yMyOppP2cfSFwwwWohi5xWFLgB7vk+lYg+Ubs4aVWzFTs1ECskzRwUF
	 bM/iaFhy0jJ0DjP50M0AeOYXAT4fq8KeiVTg0XtgMM5PXY64gszADeqZBokHGf1HDN
	 MmLV7Rb3nFgeJ39jC4PANu9lArPKhdggNDwBF8Fs9ka9bDmje4i9PC0JJmfuWfD26w
	 6DFQ3KFXYrIb1Q2e0w8NODcDYBda1OkrpS7M9VoIm79ZkvZiGje1FJEPrvEzHb+jbO
	 Xh4dtOt9oTxhg==
Subject: Re: [PATCH v3 09/15] clk: socfpga: allow compile testing of Stratix
 10 / Agilex clocks
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
 <20210311152707.1317791-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <2a358f79-c6c4-e1b7-980e-b14d6a15d45d@kernel.org>
Date: Fri, 12 Mar 2021 06:48:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152707.1317791-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 9:27 AM, Krzysztof Kozlowski wrote:
> The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
> or COMMON_CLK so they should be compile testable on most of the
> platforms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/Makefile        |  2 +-
>   drivers/clk/socfpga/Kconfig | 15 ++++++++++++---
>   2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 96802294d35a..9b582b3fca34 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -104,7 +104,7 @@ obj-y					+= renesas/
>   obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>   obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> -obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
> +obj-y					+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
>   obj-$(CONFIG_ARCH_STI)			+= st/
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index b6c5b9737174..b62ede8cad01 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -1,6 +1,15 @@
>   # SPDX-License-Identifier: GPL-2.0
> +config CLK_INTEL_SOCFPGA
> +	bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_INTEL_SOCFPGA
> +	default ARCH_INTEL_SOCFPGA
> +	help
> +	  Support for the clock controllers present on Intel SoCFPGA and eASIC
> +	  devices like Stratix 10, Agilex and N5X eASIC.
> +
> +if CLK_INTEL_SOCFPGA
> +
>   config CLK_INTEL_SOCFPGA64
> -	bool
> -	# Intel Stratix / Agilex / N5X clock controller support
> +	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>   	default ARM64 && ARCH_INTEL_SOCFPGA
> -	depends on ARM64 && ARCH_INTEL_SOCFPGA
> +
> +endif # CLK_INTEL_SOCFPGA
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
