Return-Path: <SRS0=IdmX=XJ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D50ACCA479
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 14:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C448AC385A5; Mon,  4 Jul 2022 14:06:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 297D0C3411E;
	Mon,  4 Jul 2022 14:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 297D0C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656943584; x=1688479584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hj4JeMKfecVEkk0C6r1x72X1C/YDsdok1xjHDXFxBdw=;
  b=XxqXVthwgA3LLBlo3fzQfi1F6g9x8ptMKROkO86hmnPABv8Vb3WTjV71
   YnplQfVmxgRTHjW84F+PqyhkPrKYDnFhHOH/KFW+8PGE6KyrRDuAKSIGj
   no5fi1wIIR1kQADuquKjvI6lilWbNmkQwsfkiAHfmW81FGgpmFFstSsq/
   QngljD100mrZqRzku5xzhP14EXRrd96aANeU/1SJM3S5IiVn+tWd5O1k+
   mj5eQJSdBU8rVUYUL1Ln4sReup3zr16KmmA0nR2xlE27awIeObp9F7/sm
   Fbwyhz6Gc//pPnkvZ4Q5bvM5bjro6wpbntWwKLc7p3gLSdlnHkqaUO83W
   w==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="180667794"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 07:06:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 07:06:22 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 07:06:20 -0700
Message-ID: <29e72784-2c7b-1c31-357c-012cafe57a00@microchip.com>
Date: Mon, 4 Jul 2022 16:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl
 settings.
Content-Language: en-US
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, <arnd@arndb.de>,
	<alexandre.belloni@bootlin.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <robh+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
References: <20220704135809.6952-1-kavyasree.kotagiri@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220704135809.6952-1-kavyasree.kotagiri@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2022 at 15:58, Kavyasree Kotagiri wrote:
> On pcb8291, Flexcom3 usart has only tx and rx pins.
> Cleaningup usart3 pinctrl settings.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>

Fine with me as well:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> v1 -> v2:
> - Keep both tx and rx pins into one node.
> 
>   arch/arm/boot/dts/lan966x-pcb8291.dts | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
> index 3c7e3a7d6f14..d56d2054c38d 100644
> --- a/arch/arm/boot/dts/lan966x-pcb8291.dts
> +++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
> @@ -19,19 +19,9 @@ aliases {
>   };
>   
>   &gpio {
> -	fc_shrd7_pins: fc_shrd7-pins {
> -		pins = "GPIO_49";
> -		function = "fc_shrd7";
> -	};
> -
> -	fc_shrd8_pins: fc_shrd8-pins {
> -		pins = "GPIO_54";
> -		function = "fc_shrd8";
> -	};
> -
> -	fc3_b_pins: fcb3-spi-pins {
> -		/* SCK, RXD, TXD */
> -		pins = "GPIO_51", "GPIO_52", "GPIO_53";
> +	fc3_b_pins: fc3-b-pins {
> +		/* RX, TX */
> +		pins = "GPIO_52", "GPIO_53";
>   		function = "fc3_b";
>   	};
>   
> @@ -53,7 +43,7 @@ &flx3 {
>   	status = "okay";
>   
>   	usart3: serial@200 {
> -		pinctrl-0 = <&fc3_b_pins>, <&fc_shrd7_pins>, <&fc_shrd8_pins>;
> +		pinctrl-0 = <&fc3_b_pins>;
>   		pinctrl-names = "default";
>   		status = "okay";
>   	};


-- 
Nicolas Ferre
