Return-Path: <SRS0=zZF4=IK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2701BC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:53:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8590764F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 12:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8590764F09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I7T6vdOWxjuSxp3LHZKzea+hvZzxlBWmBFGG8qXu6VU=; b=gfkCoo5KHVrWddY5pVF41P9Kb
	l865uhpBp40z8c5JtdCgUTe3C9HvmkX3iO/1B7Wv7dxVXprCSYx1723jX7EImBTgPbgaRbLJzSVMq
	ueDsuhgju/ouneqwv2fVhQUw/8/d5przEI7QCZCsPgzUcCkifa+lbNlxMGa+BFMc2tm8R25qmkX3P
	x6U+mE1qpN3V86Jnh0LOviNprtRI9AyshJHENPI3+Lmm5zf2fsyUQVfsbt0mmWarVoAxXiUO6IbA3
	d4VrxOlnBZ8c7RRGgwDd4BHrUFTfUkxgDHu2RYzQRS1vVSRI8EEgsT1zKY43Matd991BIYsqxd5jB
	YcHupvwnQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhGM-00BSj1-F9; Fri, 12 Mar 2021 12:51:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhE9-00BSQA-Oc
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Mar 2021 12:51:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55C2F64F89;
 Fri, 12 Mar 2021 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553334;
 bh=uB3vMcXdC8aACPYGUHyfZ2GzV3nzneo8Q3EOByeTzW0=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=ZmH3jzv//iRYRZfcceEQqb/LV0Ub7ujH+WFIPqjxApAXsK4UwH/Gap7lNJRDUsLaD
 5YzL4kBSXoh6sxORYrp6ohH9Gb/BddpzjQWU3LSDU/aJl0r4htusbgXIvv4E45LYjG
 1X2LcxvB/Sr8HANXumXGzHWSZvZKZYe5gdCZWo5WMc8eoTYPawcIe8KLDLxL/YLfwY
 aJSnm4Hy+K7xydXXlmU+YuIpLRWDknYAH9cF3hhXWlX/+7cXHXF8sUoSM4+EqE9ODw
 oT7j99a0pn8E14Td5LQOgGh86cvb/8cCj5vYh4kRgmDNPZCt6+gHmiAZQZ3X7uIBFZ
 b+iVASrAr6wFg==
Subject: Re: [PATCH v3 15/15] ARM: socfpga: drop ARCH_SOCFPGA
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
 <20210311152744.1318653-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <e15b2fe2-3ce8-6196-1bac-f4d40776eb24@kernel.org>
Date: Fri, 12 Mar 2021 06:48:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152744.1318653-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_125116_240947_F91CE8D1 
X-CRM114-Status: GOOD (  18.71  )
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
Message-ID: <20210312124851.cf4O_KRM34hbkrF28bGTnCn_D0flyHFkD1cTuAPUNXM@z>



On 3/11/21 9:27 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  After conversion of all
> drivers to use the new ARCH_INTEL_SOCFPGA, the remaining ARM option can
> be removed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 2 +-
>   arch/arm/configs/socfpga_defconfig  | 2 +-
>   arch/arm/mach-socfpga/Kconfig       | 8 ++------
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 3823da605430..591b15164e3d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -79,7 +79,7 @@ CONFIG_ARCH_MSM8960=y
>   CONFIG_ARCH_MSM8974=y
>   CONFIG_ARCH_ROCKCHIP=y
>   CONFIG_ARCH_RENESAS=y
> -CONFIG_ARCH_SOCFPGA=y
> +CONFIG_ARCH_INTEL_SOCFPGA=y
>   CONFIG_PLAT_SPEAR=y
>   CONFIG_ARCH_SPEAR13XX=y
>   CONFIG_MACH_SPEAR1310=y
> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index 0c60eb382c80..2d9404ea52c6 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig
> @@ -9,7 +9,7 @@ CONFIG_NAMESPACES=y
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EMBEDDED=y
>   CONFIG_PROFILING=y
> -CONFIG_ARCH_SOCFPGA=y
> +CONFIG_ARCH_INTEL_SOCFPGA=y
>   CONFIG_ARM_THUMBEE=y
>   CONFIG_SMP=y
>   CONFIG_NR_CPUS=2
> diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
> index e43ed0ca6860..43ddec677c0b 100644
> --- a/arch/arm/mach-socfpga/Kconfig
> +++ b/arch/arm/mach-socfpga/Kconfig
> @@ -1,8 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -menuconfig ARCH_SOCFPGA
> +menuconfig ARCH_INTEL_SOCFPGA
>   	bool "Altera SOCFPGA family"
>   	depends on ARCH_MULTI_V7
> -	select ARCH_INTEL_SOCFPGA
>   	select ARCH_SUPPORTS_BIG_ENDIAN
>   	select ARM_AMBA
>   	select ARM_GIC
> @@ -20,10 +19,7 @@ menuconfig ARCH_SOCFPGA
>   	select PL310_ERRATA_753970 if PL310
>   	select PL310_ERRATA_769419
>   
> -if ARCH_SOCFPGA
> -config ARCH_INTEL_SOCFPGA
> -	bool
> -
> +if ARCH_INTEL_SOCFPGA
>   config SOCFPGA_SUSPEND
>   	bool "Suspend to RAM on SOCFPGA"
>   	help
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
