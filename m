Return-Path: <SRS0=o6Gk=WV=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998B1C43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 14:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5792EC3411C; Tue, 14 Jun 2022 14:50:59 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33066C3411B;
	Tue, 14 Jun 2022 14:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33066C3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=q5HpLYaReIXbh/47owslMY0HZWewYfHiN1JFwdElSbc=; b=E6aSOb5oyExvAXaBpjFuwkB4yU
	WeyGRYpcbJvTnv316iGCT3IiC5BlUkGAIG4xZ5ocvX9qmzqaTv8m76L7XmPd/Uy0fexAuX1lDVi4o
	nzm3K2B27z17K2rTO4yYicz3Mh5AIO7nbuA9IkVpSi7T1EThdcnDJyZiDqsZsTtwHScKgpc/Q1skY
	QkzjOQfKbO9F4Ge+Zi2spk66hYzzvEbNk6V1JpsHVrjhjZzHGziHQ1O/bAkstRuinFRWjm659e0PK
	R1SetlBx8YfXqhmYAwZj2i6YzVSFti68OBMqovoqKTaaKDoOALutGtzpjPXAqBa4za63KqagLcq4S
	sFwN1R6A==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o17sY-000Fqv-Fo; Tue, 14 Jun 2022 14:50:50 +0000
Message-ID: <ecfa5816-1ada-5d8a-7189-c70e45a311ac@infradead.org>
Date: Tue, 14 Jun 2022 07:50:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v18 03/10] reset: Add Sunplus SP7021 reset driver
Content-Language: en-US
To: Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <06ac69143ce8c98b4f95e38238e1880953dc9040.1655194858.git.qinjian@cqplus1.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <06ac69143ce8c98b4f95e38238e1880953dc9040.1655194858.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/14/22 01:31, Qin Jian wrote:
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index b496028b6..e6540036b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -231,6 +231,15 @@ config RESET_STARFIVE_JH7100
>  	help
>  	  This enables the reset controller driver for the StarFive JH7100 SoC.
>  
> +config RESET_SUNPLUS
> +	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
> +	default ARCH_SUNPLUS
> +	help
> +	  This enables the reset driver support for Sunplus SoCs.
> +	  The reset lines that can be asserted and deasserted by toggling bits
> +	  in a contiguous, exclusive register space. The register is HIWORD_MASKED,
> +	  which means each register hold 16 reset lines.

	                            holds

-- 
~Randy
