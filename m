Return-Path: <SRS0=hHPj=IJ=gmail.com=moritz.fischer.private@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE717C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 22:48:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 942A764F94; Thu, 11 Mar 2021 22:48:08 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDFB64F88;
	Thu, 11 Mar 2021 22:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDFB64F88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=moritz.fischer.private@gmail.com
Received: by mail-pg1-f178.google.com with SMTP id v14so7677299pgq.2;
        Thu, 11 Mar 2021 14:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yp/zf/TAjp/DgsBtmkn2h95rlPfAql88KAJ1HBTmgds=;
        b=D7+NXXAUAfVANTxA/9HDSh9sDYi7FMVIKx2Wz+nYLCMBq9NjqTEiSfsj7+FVm42YYA
         v07JOMtAEGNld61bsYepHZhcAoYSqt+qcvZFOM+JPTcfHfKvUb31Z9jAHBuhqA0a4Y2h
         7wT+bafkScqm+wq7RNJJTGl643/twVNJmvz1eYa2/S2Xn9XT0g0Puq8yRbVIRH4jvIk6
         IIX6lXGDm8Nxid5pEmoLAyqWN5FHT79Uxk6Fo7KYRdPf7FNa+sOmVQkw2AMIIccbRZ3v
         pB4kSi6Ds4esyHHcpufwD+vNU1+tfb/Ao6a7kuC2GlxlTyrxsuWOrQiWTWQ909YXaoZ+
         dNgA==
X-Gm-Message-State: AOAM533+ZUxPZfy/FmK5dZuRrdVI8tA8TbF8bXUW4TscLvenUiYk1q1M
	z6N91E0RKfYLV37kli+cMUP1NoctbFbhlg==
X-Google-Smtp-Source: ABdhPJz8cvoO7cjx+Ydi2AzXzvDOKfJqCw7+rk33vFgwXIa9cNT/DNeCu3LAtFW6UsvUmJpd+zx4VQ==
X-Received: by 2002:a63:5c1e:: with SMTP id q30mr8763269pgb.259.1615502887491;
        Thu, 11 Mar 2021 14:48:07 -0800 (PST)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
        by smtp.gmail.com with ESMTPSA id n10sm3227074pgk.91.2021.03.11.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:48:06 -0800 (PST)
Date: Thu, 11 Mar 2021 14:48:05 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Lee Jones <lee.jones@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 12/15] fpga: altera: use ARCH_INTEL_SOCFPGA also for
 32-bit ARM SoCs
Message-ID: <YEqeJSFnQJVV15P1@epycbox.lan>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>

Hi Krzysztof,

On Thu, Mar 11, 2021 at 04:27:35PM +0100, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/fpga/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index fd325e9c5ce6..b1026c6fb119 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -14,13 +14,13 @@ if FPGA
>  
>  config FPGA_MGR_SOCFPGA
>  	tristate "Altera SOCFPGA FPGA Manager"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	help
>  	  FPGA manager driver support for Altera SOCFPGA.
>  
>  config FPGA_MGR_SOCFPGA_A10
>  	tristate "Altera SoCFPGA Arria10"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	select REGMAP_MMIO
>  	help
>  	  FPGA manager driver support for Altera Arria10 SoCFPGA.
> @@ -99,7 +99,7 @@ config FPGA_BRIDGE
>  
>  config SOCFPGA_FPGA_BRIDGE
>  	tristate "Altera SoCFPGA FPGA Bridges"
> -	depends on ARCH_SOCFPGA && FPGA_BRIDGE
> +	depends on ARCH_INTEL_SOCFPGA && FPGA_BRIDGE
>  	help
>  	  Say Y to enable drivers for FPGA bridges for Altera SOCFPGA
>  	  devices.
> -- 
> 2.25.1
> 
Thanks,
Moritz
