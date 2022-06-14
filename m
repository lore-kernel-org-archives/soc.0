Return-Path: <SRS0=o6Gk=WV=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3224CCA47A
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 14:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0F09C341C4; Tue, 14 Jun 2022 14:51:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EDA3C3411B;
	Tue, 14 Jun 2022 14:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EDA3C3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=D3NOT4tpYtv2HMaFujNLkUDSr1AXyXNIkEbr424oYcs=; b=f51FEOUJbj03rZqo34HGJaUFE7
	0QcBBHNgi8bfhxJRhiN4R9ozNNFz4oJWSxa9y1aMISaspWK8NjHwf5ncUKnTbWFQvyndRzXGbwuge
	iYNkyyV4ZIIocTWrbL3AKKx6RltBORGZBdW+tKr3gYnR6k3ITTGV3aO1I0t4a865Frm+gZPLKA13p
	xhwSQuRRbJj6z2mu3aN7/1vbd6dJwfL0uGhtIjfhuLXU2aaOIn+n6gaAqOdvTo/qD900ShEQh+BAx
	I7Zfq5ahw2yzbpBBj0yDcAlugZ9E3i3mRe1MtLH8EBgi9OWeDBbH6+ATvlYPm9PbkxYJq+JmHbOB+
	spa//gIQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o17tS-000Fsw-7e; Tue, 14 Jun 2022 14:51:46 +0000
Message-ID: <09aec36b-f1c2-938d-5e9b-535c5b6315f3@infradead.org>
Date: Tue, 14 Jun 2022 07:51:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v18 08/10] ARM: sunplus: Add initial support for Sunplus
 SP7021 SoC
Content-Language: en-US
To: Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <932bd48e7d17748a308ee487785243b141dafda1.1655194858.git.qinjian@cqplus1.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <932bd48e7d17748a308ee487785243b141dafda1.1655194858.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 6/14/22 01:31, Qin Jian wrote:
> diff --git a/arch/arm/mach-sunplus/Kconfig b/arch/arm/mach-sunplus/Kconfig
> new file mode 100644
> index 000000000..be20425c2
> --- /dev/null
> +++ b/arch/arm/mach-sunplus/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +menuconfig ARCH_SUNPLUS
> +	bool "Sunplus SoCs"
> +	depends on ARCH_MULTI_V7
> +	help
> +	  Support for Sunplus SoC family: SP7021 and succeeding SoC-based systems,
> +	  such as the Banana Pi BPI-F2S development board (and derivatives).
> +	  (<http://www.sinovoip.com.cn/ecp_view.asp?id=586>)
> +	  (<https://tibbo.com/store/plus1.html>)
> +
> +config SOC_SP7021
> +	bool "Sunplus SP7021 SoC support"
> +	depends on ARCH_SUNPLUS
> +	default ARCH_SUNPLUS
> +	select HAVE_ARM_ARCH_TIMER
> +	select ARM_GIC
> +	select ARM_PSCI
> +	select PINCTRL
> +	select PINCTRL_SPPCTL
> +	select SERIAL_SUNPLUS
> +	select SERIAL_SUNPLUS_CONSOLE
> +	help
> +	  Support for Sunplus SP7021 SoC. It is based on ARM 4-core
> +	  Cortex-A7 with various peripherals (ex: I2C, SPI, SDIO,

	                                     (e.g.: I2C, SPI, SDIO,

> +	  Ethernet and etc.), FPGA interface,  chip-to-chip bus.

	  Ethernet, etc.), FPGA interface, chip-to-chip bus.

> +	  It is designed for industrial control.

-- 
~Randy
