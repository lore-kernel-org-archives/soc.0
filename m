Return-Path: <SRS0=FdqQ=3I=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C6C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BDD9C4347C; Tue,  8 Nov 2022 13:38:23 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D68DDC433D6
	for <soc@kernel.org>; Tue,  8 Nov 2022 13:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D68DDC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667914701; x=1699450701;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=cXYGbsvnzEJ7aWBlV3PzyHHAXqr9UjDIQ0Dd7uq71bA=;
  b=CXd43oOik7SbqEZQwaeL1OvZJl/h94dN7WGYFb9PyKjVuLT/07vQAMVx
   RKp6wCa12x9v+A/diSoGY3ojGpNjGd+DYmT0IglDTzEX3SJJaHF9dQM9s
   owu95WSxM6oGP7rvEIy6RGUrndwRiuzmzMR01g6so8rHaL8uFoWuCbRjN
   pNkt6O2Uhn6hqobqyzMXxnxZjNsdUy8ERjl814jB2etSLZGkcTrsIWFOr
   ln4uc+s5OwF8RYiv6znF6uJJ8LYWEzN5Nu2G2cOGcHUbFEwTCkXPuqL5X
   4H/q3Xwqj1iR7QxgEeoyVxzPS2/ObkVubFap6ZHze8zt//Z+zlcIGRdZ1
   A==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="182470119"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 06:38:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 06:38:11 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 06:38:08 -0700
Message-ID: <ae1744a5-c042-7549-10ad-6185c0d007ec@microchip.com>
Date: Tue, 8 Nov 2022 14:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCHv1 3/8] ARM: dts: at91: sam9x60: Add flexcom definitions
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <claudiu.beznea@microchip.com>,
	<Hari.PrasathGE@microchip.com>, <davem@davemloft.net>,
	<krzysztof.kozlowski+dt@linaro.org>, <alexandre.belloni@bootlin.com>,
	<arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <manikandan.m@microchip.com>,
	<kavyasree.kotagiri@microchip.com>, <horatiu.vultur@microchip.com>
References: <20221031033653.43269-1-durai.manickamkr@microchip.com>
 <20221031033653.43269-4-durai.manickamkr@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20221031033653.43269-4-durai.manickamkr@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2022 at 04:36, Durai Manickam KR wrote:
> Add the flexcom definitions to the SoC specifc DTSI file.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Hari Prasath <Hari.PrasathGE@microchip.com>
> Signed-off-by: Manikandan M <manikandan.m@microchip.com>
> ---
>   arch/arm/boot/dts/sam9x60.dtsi | 52 ++++++++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
> index ef07d281a3db..fd4f5d43f7bb 100644
> --- a/arch/arm/boot/dts/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/sam9x60.dtsi

[..]

> @@ -180,6 +190,26 @@ flx5: flexcom@f0004000 {
>   				#size-cells = <1>;
>   				ranges = <0x0 0xf0004000 0x800>;
>   				status = "disabled";
> +
> +				uart5: serial@200 {
> +					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
> +					reg = <0x200 0x200>;
> +					interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
> +					dmas = <&dma0
> +						(AT91_XDMAC_DT_MEM_IF(0) |
> +						 AT91_XDMAC_DT_PER_IF(1) |
> +						 AT91_XDMAC_DT_PERID(10))>,
> +						<&dma0
> +						(AT91_XDMAC_DT_MEM_IF(0) |
> +						 AT91_XDMAC_DT_PER_IF(1) |
> +						 AT91_XDMAC_DT_PERID(11))>;
> +					dma-names = "tx", "rx";
> +					clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
> +					clock-names = "usart";
> +					atmel,use-dma-rx;
> +					atmel,use-dma-tx;

Isn't "atmel,fifo-size = <16>;" missing in this added definition?

> +					status = "disabled";
> +				};
>   			};
>   
>   			dma0: dma-controller@f0008000 {

[..]

Regards,
   Nicolas

-- 
Nicolas Ferre

