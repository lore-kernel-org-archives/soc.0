Return-Path: <SRS0=1moK=X3=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C85C43334
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 12:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 264EBC341C7; Fri, 22 Jul 2022 12:42:18 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 813C8C341C6;
	Fri, 22 Jul 2022 12:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 813C8C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658493736; x=1690029736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=khPSA7SdeZvexVlLJVFq2jEQ1fN3eCp5D1jxG3kOEnY=;
  b=maZxbnYE3oZrd/JdAEIFEY65R69ooM4aUnt8ibtp2BaDsxyQgY4wuqoy
   Is4JmGce8tp8Uvz+ghskdnMV0C9IgR420RZ6eWcdn9FFHMevoBTTG972P
   QcI0SjqvPqA/Ts3y6p/bjAN7vijafDFZvOf0Kzr7Gw+prHPqneijySIFH
   Ly5rQzC7euVW4lghYUN9HI5y/SWpNR3lGEsJU1p/0gc6Q4tSxqygtOkU8
   n1MuSSISwZ6J1bF+5USVsSYxI7mH8zQtAiyQxtM2OVp82q/EnH34aVLOn
   qMCctrQPegttDBGoTuWJLLuTe7dXOKhm4jJcSFMC0pH+X5Ln22SdA4PQ/
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="169063672"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 05:42:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 05:42:12 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 22 Jul 2022 05:42:12 -0700
Date: Fri, 22 Jul 2022 14:46:20 +0200
From: Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
To: Kavyasree Kotagiri - I30978 <Kavyasree.Kotagiri@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "Claudiu
 Beznea - M18063" <Claudiu.Beznea@microchip.com>, "arnd@arndb.de"
	<arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, "soc@kernel.org"
	<soc@kernel.org>, UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: lan966x: add support for pcb8309
Message-ID: <20220722124620.khueuxinijmwgot5@soft-dev3-1.localhost>
References: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
 <20220720194904.2025384-3-horatiu.vultur@microchip.com>
 <CO1PR11MB4865A1118ACB74B06408BBC792919@CO1PR11MB4865.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4865A1118ACB74B06408BBC792919@CO1PR11MB4865.namprd11.prod.outlook.com>

The 07/21/2022 06:08, Kavyasree Kotagiri - I30978 wrote:
> > +	i2c-mux {
> > +		compatible = "i2c-mux";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		mux-controls = <&mux>;
> > +		i2c-parent = <&i2c4>;
> > +
> > +		i2c102: i2c-sfp@1 {
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> Why do you need #address-cells and #size-cells here?
> > +		};
> > +
> > +		i2c103: i2c-sfp@2 {
> > +			reg = <2>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> Same here
> > +		};
> > +	};

They are not needed. I will remove them in the next version.
> > +
> > +	mux: mux-controller {
> > +		compatible = "gpio-mux";
> > +		#mux-control-cells = <0>;
> > +
> > +		mux-gpios = <&sgpio_out 11 0 GPIO_ACTIVE_HIGH>, /*
> > p11b0 */
> > +			    <&sgpio_out 11 1 GPIO_ACTIVE_HIGH>; /* p11b1
> > */
> > +	};

...

> > +&i2c4 {
> > +	compatible = "microchip,sam9x60-i2c";
> > +	reg = <0x600 0x200>;
> > +	interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> Same here 
> 

Also here.

-- 
/Horatiu
