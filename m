Return-Path: <SRS0=HrRx=XG=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CCC43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8895C3411E; Fri,  1 Jul 2022 08:17:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43A1DC341C6;
	Fri,  1 Jul 2022 08:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43A1DC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656663454; x=1688199454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0l6wFiSxP8vwL4tOj+ZAdGnBemlH8RgvrdXw7wsoutY=;
  b=fFIDVTeQGqhhdTfnLn9gthoZlkgsXM63YRu/qV4qcCd69ZAi9v3JiRPC
   hS2u3FJCzd1wHJfDvOmqboOk7EgrHYQcvhm1gMN2hqWIX5qNiKq6h02aa
   eyzUV+soyYq3XnRFtbJLXJC3gwwLzTmhYBqcT+f4q9YYoflnpSBIMH9pl
   So6ClhhXU0pYZ7CG1StubiGSlvB4pnY92kO/3l+yQP8AWAEp6lpT6GOQH
   I4SRjymdJifpekFlLVAWXW05ZuGbRO3SlEV4a4Voa0qYXHeaLVH3skJgj
   I0HaN2sogx3hFMwLQMRKwxxD9N1zoBYWujqFMge+ODv0rRtXV76Jq1Oup
   g==;
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="170658246"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 01:17:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 01:17:32 -0700
Received: from [10.12.72.20] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 01:17:30 -0700
Message-ID: <64cad1af-95e2-323b-ffd6-a7c35262ebcd@microchip.com>
Date: Fri, 1 Jul 2022 10:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl
 settings.
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, <arnd@arndb.de>,
	<alexandre.belloni@bootlin.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<soc@kernel.org>, <robh+dt@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
References: <20220627091217.21701-1-kavyasree.kotagiri@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220627091217.21701-1-kavyasree.kotagiri@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2022 at 11:12, Kavyasree Kotagiri wrote:
> On pcb8291, Flexcom3 usart has only tx and rx pins.
> Cleaningup usart3 pinctrl settings.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>

Okay, looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

We'll integrate it in our next dt branch that we'll build for arm-soc.

Best regards,
   Nicolas

> ---
>   arch/arm/boot/dts/lan966x-pcb8291.dts | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
> index 3c7e3a7d6f14..5dc8ed4cee9a 100644
> --- a/arch/arm/boot/dts/lan966x-pcb8291.dts
> +++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
> @@ -19,19 +19,13 @@
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
> +	fc3_b_rxd_pins: fc3-b-rxd-pins {
> +		pins = "GPIO_52";
> +		function = "fc3_b";
>   	};
>   
> -	fc3_b_pins: fcb3-spi-pins {
> -		/* SCK, RXD, TXD */
> -		pins = "GPIO_51", "GPIO_52", "GPIO_53";
> +	fc3_b_txd_pins: fc3-b-txd-pins {
> +		pins = "GPIO_53";
>   		function = "fc3_b";
>   	};
>   
> @@ -53,7 +47,7 @@
>   	status = "okay";
>   
>   	usart3: serial@200 {
> -		pinctrl-0 = <&fc3_b_pins>, <&fc_shrd7_pins>, <&fc_shrd8_pins>;
> +		pinctrl-0 = <&fc3_b_rxd_pins>, <&fc3_b_txd_pins>;
>   		pinctrl-names = "default";
>   		status = "okay";
>   	};


-- 
Nicolas Ferre
