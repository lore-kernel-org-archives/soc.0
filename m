Return-Path: <SRS0=zZF4=IK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44745C28E88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:51:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD3E364FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD3E364FFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxzuBwtFp6qy43jTkgIfJBl9ItLoCki9uFDz/5H2ssA=; b=hUIBq1DMyTFsk+mnyhAFSAoXs
	MptL9E6pfbgr/BXirMDOX+jPLosDQMDRGo3QwQ22kR/Y0Yf/rM+V/mcCoGTeudtHQItd73vwP3N/q
	4ZbGsUj51IibuGBAN269A+tbpr5gLGtpK4+YIpicxZpsUBgNkquwmbxzJghQu7qjGE4IYKTl0WcR5
	eQE14HW9xsJtPoh2iXBDJQGNcFjfgzRl9X8XbQMDcA2VWToCJsZhHLCwWD4t34jBH0qHuW9gGIWkt
	l/WYKigWGxExgBDuM770s4JXytfuGhXStzl+jilqeu2+MNXz5A5WuwxCukuXcn6poZ6gqwlLj0IeF
	pknCHasJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhET-00BSSI-3U; Fri, 12 Mar 2021 12:49:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhCM-00BSEX-Rr
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Mar 2021 12:49:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C544464FE2;
 Fri, 12 Mar 2021 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553241;
 bh=1fZ0FKRtf2Xjxe7KBivClSQ500entp+/bdQG6G0FdCI=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=ihWeTdUGbazqxWDdbNzqRN7VL/zLQEf7cNKat01w2F2x2XD85hhgdm8/SQ07m9nCO
 54JekYLAVN8f8Uwug4hCtVIJZFZZ/T/CxISGzWJkJnAMfV2HT8g2tuiys+YtrP9o8/
 MPDSg073KZJi/aFuXNAejWtsMUiqza1isRH9tJDF5UDs5AV72OmA8VqtgvtNli6eQg
 vJle/NeJ4FpP8alK+L2U5peWUVnMJYef+VKfSa2rorh1OEdoolOr0IFTPybwQEKBDo
 /4FO84rP7nXsYderehBJXvG5Uo30RcKOU8+sjE2dPZ/oQcQNl7c+3J5XdUd7N7l8TA
 oZHizWhfVkToQ==
Subject: Re: [PATCH v3 02/15] ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
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
 <20210311152545.1317581-3-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <3d5bac4c-ea41-02d5-071b-17e23421d14b@kernel.org>
Date: Fri, 12 Mar 2021 06:47:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-3-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_124924_373047_23216C9B 
X-CRM114-Status: GOOD (  21.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210312124717.eN-DLr03VU_VcPSkXazfN4m5wNrqIMGuBWK6w0Kx6r4@z>



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/arm/Kconfig                    | 2 +-
>   arch/arm/Kconfig.debug              | 6 +++---
>   arch/arm/Makefile                   | 2 +-
>   arch/arm/boot/dts/Makefile          | 2 +-
>   arch/arm/mach-socfpga/Kconfig       | 4 ++++
>   arch/arm64/Kconfig.platforms        | 4 ++++
>   arch/arm64/boot/dts/altera/Makefile | 2 +-
>   7 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 853aab5ab327..37f94cf0cfdb 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1320,7 +1320,7 @@ config ARM_PSCI
>   # selected platforms.
>   config ARCH_NR_GPIO
>   	int
> -	default 2048 if ARCH_SOCFPGA
> +	default 2048 if ARCH_INTEL_SOCFPGA
>   	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
>   		ARCH_ZYNQ || ARCH_ASPEED
>   	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 9e0b5e7f12af..36016497b1b3 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1087,7 +1087,7 @@ choice
>   		  on SD5203 UART.
>   
>   	config DEBUG_SOCFPGA_UART0
> -		depends on ARCH_SOCFPGA
> +		depends on ARCH_INTEL_SOCFPGA
>   		bool "Use SOCFPGA UART0 for low-level debug"
>   		select DEBUG_UART_8250
>   		help
> @@ -1095,7 +1095,7 @@ choice
>   		  on SOCFPGA(Cyclone 5 and Arria 5) based platforms.
>   
>   	config DEBUG_SOCFPGA_ARRIA10_UART1
> -		depends on ARCH_SOCFPGA
> +		depends on ARCH_INTEL_SOCFPGA
>   		bool "Use SOCFPGA Arria10 UART1 for low-level debug"
>   		select DEBUG_UART_8250
>   		help
> @@ -1103,7 +1103,7 @@ choice
>   		  on SOCFPGA(Arria 10) based platforms.
>   
>   	config DEBUG_SOCFPGA_CYCLONE5_UART1
> -		depends on ARCH_SOCFPGA
> +		depends on ARCH_INTEL_SOCFPGA
>   		bool "Use SOCFPGA Cyclone 5 UART1 for low-level debug"
>   		select DEBUG_UART_8250
>   		help
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index dad5502ecc28..415c3514573a 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -209,7 +209,7 @@ machine-$(CONFIG_PLAT_SAMSUNG)		+= s3c
>   machine-$(CONFIG_ARCH_S5PV210)		+= s5pv210
>   machine-$(CONFIG_ARCH_SA1100)		+= sa1100
>   machine-$(CONFIG_ARCH_RENESAS)	 	+= shmobile
> -machine-$(CONFIG_ARCH_SOCFPGA)		+= socfpga
> +machine-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga
>   machine-$(CONFIG_ARCH_STI)		+= sti
>   machine-$(CONFIG_ARCH_STM32)		+= stm32
>   machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 53b6e06bf19a..fe8f7c349f1d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1033,7 +1033,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
>   	s5pv210-smdkc110.dtb \
>   	s5pv210-smdkv210.dtb \
>   	s5pv210-torbreck.dtb
> -dtb-$(CONFIG_ARCH_SOCFPGA) += \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
>   	socfpga_arria5_socdk.dtb \
>   	socfpga_arria10_socdk_nand.dtb \
>   	socfpga_arria10_socdk_qspi.dtb \
> diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
> index c3bb68d57cea..e43ed0ca6860 100644
> --- a/arch/arm/mach-socfpga/Kconfig
> +++ b/arch/arm/mach-socfpga/Kconfig
> @@ -2,6 +2,7 @@
>   menuconfig ARCH_SOCFPGA
>   	bool "Altera SOCFPGA family"
>   	depends on ARCH_MULTI_V7
> +	select ARCH_INTEL_SOCFPGA
>   	select ARCH_SUPPORTS_BIG_ENDIAN
>   	select ARM_AMBA
>   	select ARM_GIC
> @@ -20,6 +21,9 @@ menuconfig ARCH_SOCFPGA
>   	select PL310_ERRATA_769419
>   
>   if ARCH_SOCFPGA
> +config ARCH_INTEL_SOCFPGA
> +	bool
> +
>   config SOCFPGA_SUSPEND
>   	bool "Suspend to RAM on SOCFPGA"
>   	help
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cdfd5fed457f..ecab67a1afb8 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -256,9 +256,13 @@ config ARCH_SEATTLE
>   
>   config ARCH_STRATIX10
>   	bool "Altera's Stratix 10 SoCFPGA Family"
> +	select ARCH_INTEL_SOCFPGA
>   	help
>   	  This enables support for Altera's Stratix 10 SoCFPGA Family.
>   
> +config ARCH_INTEL_SOCFPGA
> +	bool
> +
>   config ARCH_SYNQUACER
>   	bool "Socionext SynQuacer SoC Family"
>   
> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
> index 10119c7ab437..4db83fbeb115 100644
> --- a/arch/arm64/boot/dts/altera/Makefile
> +++ b/arch/arm64/boot/dts/altera/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_STRATIX10) += socfpga_stratix10_socdk.dtb \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
>   				socfpga_stratix10_socdk_nand.dtb
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
