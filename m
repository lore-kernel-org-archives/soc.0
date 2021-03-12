Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58910C433E0
	for <soc@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E047C64FE0; Fri, 12 Mar 2021 12:47:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43AFC64FA8;
	Fri, 12 Mar 2021 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615553225;
	bh=tKxo7sljt+pkSDWh1mUmM5NEnGtDl1u9sBRuSQ9gqRc=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=B3Wff/4KDmmI4bxbuLnCVv/MwYiNVGTqwGqUPpD8YXC6MroBQPb8N+EnosWeJCJ2y
	 Rkp7GdjehEX1HMV3fPxNO7aKArRqwH6TrHVpzL4ryxEl70Lzbax1YbTihd7p+v3wLi
	 F/vgUsvYwllSpTtiN3jZhkOFVNUz2QLObR9b7zLUrx98RXMWrgmD7MB7rebtqDmvOM
	 FVXb6gGhhc78VVIZZlmPvJJqjIh1an/WBxQHhzuE0Q1unaoDjymZt7zaDFiFzoYUbq
	 yaZP/LSuHch01stzO64G9IeE+HgpEIjCVxMIZDa/Xm3msx8lukkNSFJOIykNnOw3TT
	 kYlzkQX5Dj6Nw==
Subject: Re: [PATCH v3 01/15] clk: socfpga: allow building N5X clocks with
 ARCH_N5X
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
 <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <658d380b-c043-06be-a7b9-f96e73aa03f9@kernel.org>
Date: Fri, 12 Mar 2021 06:47:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
> (ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
> changes.  Also the clock drivers are the same.
> 
> However the clock drivers won't be build without ARCH_AGILEX.  One could
> assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
> modeled in Kconfig.  In current stage the ARCH_N5X is simply
> unbootable.
> 
> Add a separate Kconfig entry for clocks used by both ARCH_N5X and
> ARCH_AGILEX so the necessary objects will be built if either of them is
> selected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/Kconfig          | 1 +
>   drivers/clk/Makefile         | 1 +
>   drivers/clk/socfpga/Kconfig  | 6 ++++++
>   drivers/clk/socfpga/Makefile | 4 ++--
>   4 files changed, 10 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/clk/socfpga/Kconfig
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index a588d56502d4..1d1891b9cad2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -394,6 +394,7 @@ source "drivers/clk/renesas/Kconfig"
>   source "drivers/clk/rockchip/Kconfig"
>   source "drivers/clk/samsung/Kconfig"
>   source "drivers/clk/sifive/Kconfig"
> +source "drivers/clk/socfpga/Kconfig"
>   source "drivers/clk/sprd/Kconfig"
>   source "drivers/clk/sunxi/Kconfig"
>   source "drivers/clk/sunxi-ng/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b22ae4f81e0b..12e46b12e587 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -106,6 +106,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>   obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
>   obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
> +obj-$(CONFIG_ARCH_N5X)			+= socfpga/
>   obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> new file mode 100644
> index 000000000000..3c30617169bf
> --- /dev/null
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config CLK_INTEL_SOCFPGA64
> +	bool
> +	# Intel Agilex / N5X clock controller support
> +	default (ARCH_AGILEX || ARCH_N5X)
> +	depends on ARCH_AGILEX || ARCH_N5X
> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
> index bf736f8d201a..c6db8dd4ab35 100644
> --- a/drivers/clk/socfpga/Makefile
> +++ b/drivers/clk/socfpga/Makefile
> @@ -3,5 +3,5 @@ obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
>   obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>   obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
>   obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> -obj-$(CONFIG_ARCH_AGILEX) += clk-agilex.o
> -obj-$(CONFIG_ARCH_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-agilex.o
> +obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
