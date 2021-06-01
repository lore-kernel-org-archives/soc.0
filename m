Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2EDC4708F
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 10:03:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A08356139A; Tue,  1 Jun 2021 10:03:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 274BD6136E;
	Tue,  1 Jun 2021 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622541792;
	bh=0jRus9vAu2IKxyB4L0YFCgNgnJE8tYA0twVfow3cZLY=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=dYutvFXC05lIVPcV9fZpe5SSyzFnai6xlfSVoeuplbYGGIAqdpRdCHJliDUWLF6wB
	 LW/f8mB2MaW5Frq7hqtYDVceXU6cuGiCnF+B0a+wIbbhcCeQnCiDbOpCkRFbUwCzBH
	 OIilzuUt31V291ewa7jwBh0R02PRPlHhRr8oAUPvIlb73aD+k6udif9lAYl7HYJeay
	 p9A83sKyHQWWP+tAByYhNbx7fm4jEXKQBOJa7j8OB91eB0oJQ3OeHRenCHvOYCgag/
	 1tMYgQl5ZshPAZjP8covbxntLDjIDt7g8T90zp4fyRuV0bQ2OTJpxOR8laFyN/jpqy
	 dhx5ehvo24zug==
Message-ID: <86a7cded6e3e17b0ab347e55b38a44e10bc4e46a.camel@kernel.org>
Subject: Re: [PATCH 3/6] ARM: dts: Move BCM2711 RPi specific into separate
 dtsi
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 01 Jun 2021 12:03:07 +0200
In-Reply-To: <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
	 <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Stefan,
Thanks for having a go at this.

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> There is a lot of Raspberry Pi specific stuff (neither SoC or board
> specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
> to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
> into a separate dtsi.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 62 +----------------------------
>  arch/arm/boot/dts/bcm2711-rpi.dtsi    | 75 +++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 61 deletions(-)
>  create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
> 
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index 3b4ab94..78142a0 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -1,11 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /dts-v1/;
>  #include "bcm2711.dtsi"
> -#include "bcm2835-rpi.dtsi"
> +#include "bcm2711-rpi.dtsi"
>  #include "bcm283x-rpi-usb-peripheral.dtsi"
>  
> 
> -#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
> -
>  / {
>  	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
>  	model = "Raspberry Pi 4 Model B";
> @@ -22,10 +20,7 @@
>  	};
>  
> 
>  	aliases {
> -		emmc2bus = &emmc2bus;
>  		ethernet0 = &genet;

Why not picking this one? nor the relevant DT nodes? I belive it's available on
all the bcm2711 based boards.

> -		pcie0 = &pcie0;
> -		blconfig = &blconfig;
>  	};
>  
> 
>  	leds {
> @@ -80,11 +75,6 @@
>  };
>  
> 
>  &firmware {
> -	firmware_clocks: clocks {
> -		compatible = "raspberrypi,firmware-clocks";
> -		#clock-cells = <1>;
> -	};
> -
>  	expgpio: gpio {

Why not taking this one too and letting each dts file define its own
'gpio-line-names'?

>  		compatible = "raspberrypi,firmware-gpio";
>  		gpio-controller;
> @@ -99,11 +89,6 @@
>  				  "";
>  		status = "okay";
>  	};
> -
> -	reset: reset {
> -		compatible = "raspberrypi,firmware-reset";
> -		#reset-cells = <1>;
> -	};
>  };
>  
> 
>  &gpio {
> @@ -180,23 +165,13 @@
>  };
>  
> 
>  &hdmi0 {
> -	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
> -	clock-names = "hdmi", "bvb", "audio", "cec";
> -	wifi-2.4ghz-coexistence;
>  	status = "okay";
>  };
>  
> 
>  &hdmi1 {
> -	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
> -	clock-names = "hdmi", "bvb", "audio", "cec";
> -	wifi-2.4ghz-coexistence;
>  	status = "okay";
>  };
>  
> 
> -&hvs {
> -	clocks = <&firmware_clocks 4>;
> -};
> -
>  &pixelvalve0 {
>  	status = "okay";
>  };
> @@ -219,22 +194,6 @@
>  	status = "okay";
>  };
>  
> 
> -&rmem {
> -	/*
> -	 * RPi4's co-processor will copy the board's bootloader configuration
> -	 * into memory for the OS to consume. It'll also update this node with
> -	 * its placement information.
> -	 */
> -	blconfig: nvram@0 {
> -		compatible = "raspberrypi,bootloader-config", "nvmem-rmem";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		reg = <0x0 0x0 0x0>;
> -		no-map;
> -		status = "disabled";
> -	};
> -};
> -
>  /* SDHCI is used to control the SDIO for wireless */
>  &sdhci {
>  	#address-cells = <1>;
> @@ -273,21 +232,6 @@
>  	};
>  };
>  
> 
> -&pcie0 {
> -	pci@1,0 {
> -		#address-cells = <3>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		reg = <0 0 0 0 0>;
> -
> -		usb@1,0 {
> -			reg = <0x10000 0 0 0 0>;
> -			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> -		};
> -	};
> -};
> -

This is not relevant to CM4, maybe we should leave it in the .dts

>  /* uart0 communicates with the BT module */
>  &uart0 {

What about 'uart1'? I belive the configuration is the same for all boards. pwm1
also comes to mind.

Regards,
Nicolas


