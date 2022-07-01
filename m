Return-Path: <SRS0=HrRx=XG=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DF3C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDB29C341C6; Fri,  1 Jul 2022 08:16:14 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 830F1C3411E;
	Fri,  1 Jul 2022 08:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 830F1C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656663374; x=1688199374;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OJ9GWkLVaAs1Fsv4I7CHxNkbdrvjBd0hQHJ/FoewQ1k=;
  b=geGgtg2x/qfyj4iIO9KsKggh5BqYchQS/0XsTOBIv91yz9mFOXJuHGhI
   o0a8Ht+nlnzQnmK2WAmhcTgvdz6bc39jHhKyKByjEiVStK9+orfNBDmdl
   Zj4ar1HHCYMtCH4P451Nxx5dOB7GN9uiQ5SfTF4DEuZBOwJxh1P+BODNh
   PJcLpw9pwkyLbX6cNBJH8iWykgesEE8xl7RrAVlLAhYEWhEjzCtPphaJU
   0wnM0o5Vm+xoBWHZueREJVTJagC3rhkqXF5YCptqnG5V5FRhuVqL36ijE
   ZOP4khp9Lecw5fneLhVwW1Zu34DbIZFL/lqBnZO1vg41txJGsg2eqa6Er
   A==;
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="162901313"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 01:16:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 01:16:10 -0700
Received: from [10.12.72.20] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 01:16:08 -0700
Message-ID: <91e03ee2-a11c-7c71-73f6-d76e07c10cd0@microchip.com>
Date: Fri, 1 Jul 2022 10:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARM: dts: lan966x: Add mcan1 node.
Content-Language: en-US
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	<alexandre.belloni@bootlin.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, Claudiu Beznea <Claudiu.Beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <arnd@arndb.de>, <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>
References: <20220627110552.26315-1-kavyasree.kotagiri@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220627110552.26315-1-kavyasree.kotagiri@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2022 at 13:05, Kavyasree Kotagiri wrote:
> Add the mcan1 node. By default, keep it disabled.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

We'll queue in the next dt branch soon, for integration through arm-soc 
tree.

Thanks, regards,
   Nicolas

> ---
>   arch/arm/boot/dts/lan966x.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
> index 3cb02fffe716..25cfa89dde7b 100644
> --- a/arch/arm/boot/dts/lan966x.dtsi
> +++ b/arch/arm/boot/dts/lan966x.dtsi
> @@ -473,6 +473,21 @@
>   			status = "disabled";
>   		};
>   
> +		can1: can@e0820000 {
> +			compatible = "bosch,m_can";
> +			reg = <0xe0820000 0xfc>, <0x00100000 0x8000>;
> +			reg-names = "m_can", "message_ram";
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "int0", "int1";
> +			clocks = <&clks GCK_ID_MCAN1>, <&clks GCK_ID_MCAN1>;
> +			clock-names = "hclk", "cclk";
> +			assigned-clocks = <&clks GCK_ID_MCAN1>;
> +			assigned-clock-rates = <40000000>;
> +			bosch,mram-cfg = <0x4000 0 0 64 0 0 32 32>;
> +			status = "disabled";
> +		};
> +
>   		reset: reset-controller@e200400c {
>   			compatible = "microchip,lan966x-switch-reset";
>   			reg = <0xe200400c 0x4>;


-- 
Nicolas Ferre
