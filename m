Return-Path: <SRS0=0poK=LF=gmail.com=olteanv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7ECC48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 20:48:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41967613C6; Fri, 11 Jun 2021 20:48:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D691611B0;
	Fri, 11 Jun 2021 20:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D691611B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=olteanv@gmail.com
Received: by mail-ej1-f49.google.com with SMTP id g8so6419168ejx.1;
        Fri, 11 Jun 2021 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YyrXNBhPnlWtgRvL1fSeCwot1NLFqCcTWBSbo3w5iHY=;
        b=vSyfBkhxydSAl19TTFxnwWXlPayZop/VtNYd6AO9paP8/Yk2SDHo9O9utiYie+LtRD
         w0WsjqdTBURyFMCxVNzdgm3FE/pjjouJyLcgekyE2VFZaqom/PwZ8LOuSE5albfj/sfW
         O3Dv9/YVvncd3tw4MdM9n6f+K7FvDnW9Q2DZgUtaeRzehXekuQ34JyLjev4ioLUvtPgt
         UNomMQ1sOuKE+ZHGBpCbaLNzZOJa8JQngHgHYNT/lUcYGqq7CCowGmMy8btL6Ag11XBU
         NO/bNQx73d8gus8M4YiGMuolkNYy/hobkGuSPnEovB9PFCwLqQuG+Cai617dPWYT4Sfb
         Qy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YyrXNBhPnlWtgRvL1fSeCwot1NLFqCcTWBSbo3w5iHY=;
        b=E1ck7IVFnRlzgSh+4HBlLRbDRhhDY0SKzRvCCiaJnev49stCNLu5GpcXcNyBx/KqLx
         5tUna04MXlHjSURHPVWOiJcJt0LCt/200UDr/x7Oy1aahdnOBk5lDYK1kGktk2kpnkD5
         mRp8tl8DTHOMEgsGeTo3fXPdP59UZRYlXFEUllCCIQkUh9fHGmyDMaylWKwtOx9p7EQ/
         7WhvjRekGmXh4XbCXL5QEXBBPBKuGKBJj53zd044w1vfGCyjEoGU6MnrN/EK9tbBoS79
         ZwToPwcUjQupT/98aIoi1ZQ+3hE0QaF3NdDnIYlosrLR5Dx2DjSNc0yRVvKz1E62G6qK
         XSrA==
X-Gm-Message-State: AOAM533FH5F6YjovRVBksX8mEjWleDdmxSvue483k1ORu6bQMh0bG0KL
	zQ+fonCnH85sfMOnJPEiYL4=
X-Google-Smtp-Source: ABdhPJwNErYxpmiURzhP2SjdJb3SF77QCdAyffTEkjR5HEBg5NrlEQ1kVo2bIfFQnpqDEQxIPBnXDg==
X-Received: by 2002:a17:907:20dc:: with SMTP id qq28mr5292296ejb.440.1623444484654;
        Fri, 11 Jun 2021 13:48:04 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
        by smtp.gmail.com with ESMTPSA id gw7sm2437478ejb.5.2021.06.11.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:48:04 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:48:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Ravnborg <sam@ravnborg.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
Message-ID: <20210611204802.bg2xoyttj5lbs6zq@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-6-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-6-mnhagan88@gmail.com>

On Fri, Jun 11, 2021 at 12:27:17AM +0100, Matthew Hagan wrote:
> MX65 Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 switch (2x 1GbE ports, used for WAN ports 1 & 2)
>     2x Qualcomm QCA8337 switches (10x 1GbE ports, used for LAN ports 3-12)
>   - PSE: Broadcom BCM59111KMLG connected to LAN ports 11 & 12
>   - USB: 1x USB2.0
>   - Serial: Internal header
> 
> As with the MX64, the MX65 has 2x Broadcom BCM43520KMLG on the PCI bus.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 298 ++++++++++++++++++
>  arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
>  arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
>  3 files changed, 336 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> 
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
> new file mode 100644
> index 000000000000..0ff78fb89b6d
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX65 series (Alamo).
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +#include "bcm958625-meraki-mx6x-common.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	aliases {
> +		mdio-mux-mmio = &mdiomux0;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		orange_power {
> +			label = "orange:power";
> +			gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		wan1_right {
> +			label = "green:wan1-right";
> +			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		wan1_left {
> +			label = "green:wan1-left";
> +			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		wan2_right {
> +			label = "green:wan2-right";
> +			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		wan2_left {
> +			label = "green:wan2-left";
> +			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		white_status {
> +			label = "white:status";
> +			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys-polled";
> +		autorepeat;
> +		poll-interval = <20>;
> +
> +		reset {
> +			label = "reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&gpioa 8 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	mdio: mdio@18032000 {
> +		compatible = "brcm,iproc-mdio";
> +		reg = <0x18032000 0x8>;
> +		#size-cells = <0>;
> +		#address-cells = <1>;
> +	};

Odd that mdio@18032000 is under the / node and not under /soc? I don't
think you can combine nodes with a unit address with nodes without in
the same level of the hierarchy.

Also, it is odd that you define something SoC-specific like this in a
board file. Isn't this actually stray and not used?

> +
> +	mdiomux0: mdio-mux {
> +		compatible = "mdio-mux-mmioreg";
> +		reg = <0x18032000 0x4>;
> +		mux-mask = <0x200>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		mdio-parent-bus = <&mdio>;
> +
> +		mdio_ext: mdio@200 {
> +			reg = <0x200>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	mdio-mii-mux {
> +		compatible = "mdio-mux-mmioreg";
> +		reg = <0x1803f1c0 0x4>;
> +		mux-mask = <0x2000>;
> +		mdio-parent-bus = <&mdio_ext>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mdio@0 {
> +			reg = <0x0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			phy_port6: phy@0 {
> +				reg = <0>;
> +			};
> +
> +			phy_port7: phy@1 {
> +				reg = <1>;
> +			};
> +
> +			phy_port8: phy@2 {
> +				reg = <2>;
> +			};
> +
> +			phy_port9: phy@3 {
> +				reg = <3>;
> +			};
> +
> +			phy_port10: phy@4 {
> +				reg = <4>;
> +			};
> +
> +			switch@10 {
> +				compatible = "qca,qca8337";
> +				#address-cells = <1>;
> +				#size-cells = <0>;

The "ports" node is adimensional, so address-cells and size-cells are
not needed.

> +				reg = <0x10>;
> +				dsa,member = <1 0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						label = "cpu";

'label' property for the CPU port is not needed/used. We know it is a
CPU port because it has the 'ethernet' property.

> +						ethernet = <&sgmii1>;
> +						phy-mode = "sgmii";
> +						fixed-link {
> +							speed = <1000>;
> +							full-duplex;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						label = "lan8";
> +						phy-handle = <&phy_port6>;
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +						label = "lan9";
> +						phy-handle = <&phy_port7>;
> +					};
> +
> +					port@3 {
> +						reg = <3>;
> +						label = "lan10";
> +						phy-handle = <&phy_port8>;
> +					};
> +
> +					port@4 {
> +						reg = <4>;
> +						label = "lan11";
> +						phy-handle = <&phy_port9>;
> +					};
> +
> +					port@5 {
> +						reg = <5>;
> +						label = "lan12";
> +						phy-handle = <&phy_port10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mdio-mii@2000 {
> +			reg = <0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			phy_port1: phy@0 {
> +				reg = <0>;
> +			};
> +
> +			phy_port2: phy@1 {
> +				reg = <1>;
> +			};
> +
> +			phy_port3: phy@2 {
> +				reg = <2>;
> +			};
> +
> +			phy_port4: phy@3 {
> +				reg = <3>;
> +			};
> +
> +			phy_port5: phy@4 {
> +				reg = <4>;
> +			};
> +
> +			switch@10 {
> +				compatible = "qca,qca8337";
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Similar comment.

> +				reg = <0x10>;
> +				dsa,member = <2 0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						label = "cpu";
> +						ethernet = <&sgmii0>;
> +						phy-mode = "sgmii";
> +						fixed-link {
> +							speed = <1000>;
> +							full-duplex;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						label = "lan3";
> +						phy-handle = <&phy_port1>;
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +						label = "lan4";
> +						phy-handle = <&phy_port2>;
> +					};
> +
> +					port@3 {
> +						reg = <3>;
> +						label = "lan5";
> +						phy-handle = <&phy_port3>;
> +					};
> +
> +					port@4 {
> +						reg = <4>;
> +						label = "lan6";
> +						phy-handle = <&phy_port4>;
> +					};
> +
> +					port@5 {
> +						reg = <5>;
> +						label = "lan7";
> +						phy-handle = <&phy_port5>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&srab {
> +	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
> +	status = "okay";
> +	dsa,member = <0 0>;
> +
> +	ports {
> +		port@0 {
> +			label = "wan1";
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			label = "wan2";
> +			reg = <1>;
> +		};
> +
> +		sgmii0: port@4 {
> +			label = "sw0";
> +			reg = <4>;
> +			fixed-link {
> +				speed = <1000>;
> +				full-duplex;
> +			};
> +		};
> +
> +		sgmii1: port@5 {
> +			label = "sw1";
> +			reg = <5>;
> +			fixed-link {
> +				speed = <1000>;
> +				full-duplex;
> +			};
> +		};
> +
> +		port@8 {
> +			ethernet = <&amac2>;
> +			label = "cpu";
> +			reg = <8>;
> +			fixed-link {
> +				speed = <1000>;
> +				full-duplex;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
> new file mode 100644
> index 000000000000..aec86c3a4d05
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX65.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm958625-meraki-alamo.dtsi"
> +
> +/ {
> +	model = "Cisco Meraki MX65";
> +	compatible = "meraki,mx65", "brcm,bcm58625", "brcm,nsp";
> +};
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> new file mode 100644
> index 000000000000..0045a33055c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX65W.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm958625-meraki-mx65x.dtsi"
> +
> +/ {
> +	model = "Cisco Meraki MX65W";
> +	compatible = "meraki,mx65w", "brcm,bcm58625", "brcm,nsp";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> -- 
> 2.26.3
> 

