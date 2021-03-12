Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABCBC433E0
	for <soc@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CB3C64FFB; Fri, 12 Mar 2021 12:47:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A47A264F09;
	Fri, 12 Mar 2021 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615553267;
	bh=awQ6d7P1pAN97VdaNOlxDQLyaL1R4wg5mSfN6uui2Cs=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=snYRkE8OdVItCuahvzED4D/CcrPgHCrfl8Tex+db/QhBid/F+FfGc6+ZkwGoMRlsE
	 S1ntrBtgjSMyZ2walfpsuK7o43DQiHVsmmZKa+8I2TydDMmNHfJWoF3HwYdMkD1RvN
	 947m7YyhTXgfrY1tAOlX6JcvVlzBF0j5DgUG4u9lMPUBBg3EvMdtuXOkStJkTlrF7p
	 AZp1UDWUKGRb25ZrkiN6XwcvWl2D2H39lbFzdqF315MATP3i33St98u/5TdtufUabZ
	 Bz+BR7YC52HWPkGJvDuYdAfjdUYJgP0pFHyOImgg13BUNgBzO4tdNG1lVRFEva03G/
	 nY1cKBXgBXIew==
Subject: Re: [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA and
 ARCH_STRATIX10
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
 <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <5f7b49e2-db29-cc19-9dc1-09bcded43e28@kernel.org>
Date: Fri, 12 Mar 2021 06:47:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 12e46b12e587..1e29e5ad107a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -104,10 +104,9 @@ obj-y					+= renesas/
>   obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>   obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> -obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
> +obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
>   obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
>   obj-$(CONFIG_ARCH_N5X)			+= socfpga/
> -obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
>   obj-$(CONFIG_ARCH_STI)			+= st/
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
