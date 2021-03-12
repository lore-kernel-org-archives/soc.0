Return-Path: <SRS0=zZF4=IK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2004C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:53:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF91264F89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF91264F89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKbBv+u9L3Ynzxev9KqNt1hUhT2T5p4KhMuoBmjRY0c=; b=L3ttM/VmDwUVNhtoLoO2RkL06
	BYyWSjzRdBGdnL9v48lrVorsMjx/u5hvErmoMI/1qZ9Wgm7asmLwzlvn3Q7xPkzcTEaHDjGbm0GFv
	YgMgunbqMm213LG07zmAcTrNJ5yCO/0XaCpt6NBWD9QnhWaBOS0NC544PTmkYWpYpRvoTgPsT6pTR
	iPhzfpOujojSqQoYbL7LtNcOx7h1ke+HG2iu6EevOIMypoEc+JUnZgK/HDiPEd7iPKb57jixr6vYU
	WMLxtgXCmh9yml/aL2049S/5XWBTMlofmP6vTBO8xsCKGs3HfIjNMUUwjUAm8B061dJYWwpqJo1lL
	DiyRAFqHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhGC-00BShd-Kh; Fri, 12 Mar 2021 12:51:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhE9-00BSQ9-OZ
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Mar 2021 12:51:17 +0000
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_125116_129763_F5F097A4 
X-CRM114-Status: GOOD (  21.77  )
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
Message-ID: <20210312124832.tyr3aYN4JKBYjyOefERBeMTG90n5dR_ol_5Cc9vFTwo@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
