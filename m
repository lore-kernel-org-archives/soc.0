Return-Path: <SRS0=zZF4=IK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA2DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 14:06:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BAAA64FFB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 14:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BAAA64FFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBNuBzsad3v57g/lGr4HyS6/KY15RNyaevuSZHGlCXM=; b=n7nAIo3fE8IG9+4zsKyVMzRSk
	bv/cWtq4FggNb+il/KjqVMVv9MFGZr7u4Q28GDAtRY/oanmgyIwzxsL7pLpPKR2gcs1AMKZGiPTAL
	MYwevVk/Sz3NGycbmu/ZddriN9CZ5bkJ8OHHio4G58wfsZnrlh+b7fjN0gPVccRU/KbWUVjOe3Wfs
	0qdOAtF02ec7WXHxUfNtPAv+P4W9MZcCmF8jfr6WfeTH/imU9wOl2kN1TKOvBPQAPfH42EKhU/k48
	qNA7Nl4GuzkVmNXuClKiRdPrarPWVWqib62GGh1FUeXJVRRg6WOfOyWaF0ACUyGfgFYS4jbSU5u80
	5+XFa68eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKiPw-00BaDS-1N; Fri, 12 Mar 2021 14:05:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhDC-00BSLE-Te
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Mar 2021 12:50:21 +0000
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_125018_989325_7C20B56B 
X-CRM114-Status: GOOD (  19.66  )
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
Message-ID: <20210312124810.wYGArtW3Fd-KerCUVGuMu09BBmh-SNRa6jYb4jXm9eg@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
