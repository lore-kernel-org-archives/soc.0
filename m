Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3613C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 21:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55A7611CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 21:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55A7611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NOrhZ4hjtmildlT6aGd8/9MhK+yT6Pl85gtjEr+UHA=; b=qfwe9zgooedBY9
	ZiOytGae0GtCu+hQjHL+W9+LkdVrbOho3mM8JQU4UnNSROhMnLxXxeuAE0T97625Sv3yEpWzNZjEZ
	TfopUVwQEcrgTkzAiDAWD66vdJ3zeUCNmUYD+dGgHB9DWvXQlq3am/PbOIl1Sh0ClfIuayvDF22Cl
	woH0YqnXcBl/AzPK+bevSqTV23MMP+QlyRobct/QeGTsDKTrYrbWKPptcZHDWKGuQkPJ66GNuHYma
	1FdRYic+bflsduyeqpS9ZsJHD+IOhxI/NvGUU3FVWzVZB87cU++uj39Zdre0r4NTds97qLcSNVrcg
	rhDqnVsrWeSiVmK6ED2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lroHP-0076S1-Ku; Fri, 11 Jun 2021 21:01:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrnnW-006uhS-KJ
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 20:30:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t3so38526295edc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qkN0AO/46OjWRT9PADiybil1jeYRgRfOTZb/+oZbXks=;
 b=pSsSHInu6XM//mfEujgy+dDYDIxO8g4iJ9E8Q3jKKmCnyF+79S4vuAkRhunEN/+cJg
 K/r0SY/VeX5w7/isFdpGncBNrMSv9f40E7xC/1sf4bQ9VZuWJjEjtd12CB44ysTJH74l
 SuKkVbPRhY0IsypL79Cgozv1PF8XSeeRwJyB/1w45ydojDRUcxGpsKlJYCMEI6SIKtI6
 X2yqgfjWHfNG4PINOdlI/2wDNZCGlrTBJcQtt8Wm3c0YPat72NB13WKSV/ZRqi/p6IAq
 o2Bm4m6erZUlYVX50wfTNmeeYfxyCScJqc3ZdLy9SE4HFpBii2W1jUvAXRAbqUz6d4ua
 1bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qkN0AO/46OjWRT9PADiybil1jeYRgRfOTZb/+oZbXks=;
 b=b3YaQA1ATb1o2JgAKgaKRSR4yV5rjOooCduendFCHCW//Lk1F4t8yR40hGyw9+TAyX
 X1bJy9q7LQa7fRxRFErWl/ZZ/Ey2fr03NTS04vejQn/ssY0RzmKrFovnC+Hk08u2ydpi
 +nVJKVK0nqBEVq0HL8rQVDzFOaHImphiUR0HbSrsic+gLVuN7H2RUyyOZF6UVip/n48P
 PRPtIasPt41jsAbhCPhBHvaRDZyFZVWhkzANENz5wqG/Ta9BG4Gtxq1Z0utWpgvYFuas
 Ufhc7WcMZJSbacXEaiwlOvUHu4uWb4edNZfyuBFWGAr5LUyHULI3aYjKpN8fkZztVeh7
 Jr+A==
X-Gm-Message-State: AOAM532STD5zsHD+tFO6AUsSk8O9M8roGjLlCpE2eRUiQqZ4iAQC/Z59
 LsAZ9mbaKyxTM+scoHvClWU=
X-Google-Smtp-Source: ABdhPJyHl8voOpFgIlUqxxEy8/h8evFb+gmOEvLOPk278Vz2pxh81jcD5TYnggJ7g+hIVpH31rsVmA==
X-Received: by 2002:aa7:d648:: with SMTP id v8mr5286241edr.203.1623443433222; 
 Fri, 11 Jun 2021 13:30:33 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id c13sm3022543edv.27.2021.06.11.13.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:30:32 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:30:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Message-ID: <20210611203031.fj3g32o7kgupgzjy@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-4-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-4-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_133034_746121_47BFB0A4 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611203031.hoF_FsNWKfO2Acu7QCIyHovYZuhgmbYfb93uCbXyTOA@z>

On Fri, Jun 11, 2021 at 12:27:15AM +0100, Matthew Hagan wrote:
> These bindings are required for all Meraki MX64/MX65 devices.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  .../dts/bcm958625-meraki-mx6x-common.dtsi     | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> 
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> new file mode 100644
> index 000000000000..47a30dedf7b3
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +#include "bcm-nsp.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x60000000 0x80000000>;
> +	};
> +
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		red {
> +			label = "red:led";
> +			pwms = <&pwm 1 50000>;
> +		};
> +
> +		green {
> +			label = "green:led";
> +			pwms = <&pwm 2 50000>;
> +		};
> +
> +		blue {
> +			label = "blue:led";
> +			pwms = <&pwm 3 50000>;
> +		};
> +	};
> +};
> +
> +&L2 {
> +	arm,io-coherent;
> +	prefetch-data = <1>;
> +	prefetch-instr = <1>;
> +};

It is common practice to sort labels alphabetically and nodes by unit address.

> +
> +&uart0 {
> +	clock-frequency = <62500000>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	at24@50 {
> +		compatible = "atmel,24c64";
> +		pagesize = <32>;
> +		reg = <0x50>;
> +	};
> +};
> +
> +&amac2 {
> +	status = "okay";
> +};
> +
> +&nand {
> +	nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-on-flash-bbt;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		nand-ecc-strength = <24>;
> +		nand-ecc-step-size = <1024>;
> +
> +		brcm,nand-oob-sector-size = <27>;
> +
> +		partition@0 {
> +			label = "u-boot";
> +			reg = <0x0 0x80000>;
> +			read-only;
> +		};
> +
> +		partition@80000 {
> +			label = "shmoo";
> +			reg = <0x80000 0x80000>;
> +			read-only;
> +		};
> +
> +		partition@100000 {
> +			label = "bootkernel1";
> +			reg = <0x100000 0x300000>;
> +		};
> +
> +		partition@400000 {
> +			label = "senao_nvram";
> +			reg = <0x400000 0x100000>;
> +		};
> +
> +		partition@500000 {
> +			label = "bootkernel2";
> +			reg = <0x500000 0x300000>;
> +		};
> +
> +		partition@800000 {
> +			label = "ubi";
> +			reg = <0x800000 0x3f700000>;
> +		};
> +	};
> +};
> +
> +&qspi {
> +	status = "disabled";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&pwm {
> +	status = "okay";
> +	#pwm-cells = <2>;

What is the reason for overriding this to 2?

> +	chan0 {
> +		channel = <1>;
> +		active_low = <1>;
> +		};

Bad indentation for this bracket.

> +	chan1 {
> +		channel = <2>;
> +		active_low = <1>;
> +	};
> +	chan2 {
> +		channel = <3>;
> +		active_low = <1>;
> +	};
> +};
> +
> +&ccbtimer1 {
> +	status = "disabled";
> +};
> +
> +&sata_phy {
> +	status = "disabled";
> +};

It is common practice to disable these in the common SoC dtsi and let
individual boards enable them as necessary, instead of the opposite.

> -- 
> 2.26.3
> 


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
