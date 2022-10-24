Return-Path: <SRS0=Qv0O=2Z=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4529C38A2D
	for <soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E4C0C433D6; Mon, 24 Oct 2022 14:16:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D69EEC433C1;
	Mon, 24 Oct 2022 14:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D69EEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C431474;
	Mon, 24 Oct 2022 07:16:54 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91F0C3F792;
	Mon, 24 Oct 2022 07:16:46 -0700 (PDT)
Date: Mon, 24 Oct 2022 15:16:43 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <uwu@icenowy.me>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 06/10] ARM: suniv: add USB-related device nodes
Message-ID: <20221024151643.23217a25@donnerap.cambridge.arm.com>
In-Reply-To: <20221012055602.1544944-7-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me>
	<20221012055602.1544944-7-uwu@icenowy.me>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Oct 2022 13:55:58 +0800
Icenowy Zheng <uwu@icenowy.me> wrote:

Hi,

> The suniv SoC has a USB OTG controller and a USB PHY like other
> Allwinner SoCs.
> 
> Add their device tree node.

Looks alright to me, checked against the manual, also compared against
some other Allwinner USB DT nodes. Also passes the binding and DTB checks.

Just one small question below, but nevertheless:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes since v1.
> 
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> index 0edc1724407b..a01541ba42c5 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -133,6 +133,32 @@ mmc1: mmc@1c10000 {
>  			#size-cells = <0>;
>  		};
>  
> +		usb_otg: usb@1c13000 {
> +			compatible = "allwinner,suniv-f1c100s-musb";
> +			reg = <0x01c13000 0x0400>;
> +			clocks = <&ccu CLK_BUS_OTG>;
> +			resets = <&ccu RST_BUS_OTG>;
> +			interrupts = <26>;
> +			interrupt-names = "mc";
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			extcon = <&usbphy 0>;
> +			allwinner,sram = <&otg_sram 1>;

What is this "1" for? I see it all over the other Allwinner SRAM
properties, but can't find any documentation about that number, nor can I
see that it would be used in the code.

Does anyone know?

Cheers,
Andre

> +			status = "disabled";
> +		};
> +
> +		usbphy: phy@1c13400 {
> +			compatible = "allwinner,suniv-f1c100s-usb-phy";
> +			reg = <0x01c13400 0x10>;
> +			reg-names = "phy_ctrl";
> +			clocks = <&ccu CLK_USB_PHY0>;
> +			clock-names = "usb0_phy";
> +			resets = <&ccu RST_USB_PHY0>;
> +			reset-names = "usb0_reset";
> +			#phy-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		ccu: clock@1c20000 {
>  			compatible = "allwinner,suniv-f1c100s-ccu";
>  			reg = <0x01c20000 0x400>;

