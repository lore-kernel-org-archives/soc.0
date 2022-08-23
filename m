Return-Path: <SRS0=BRl/=Y3=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FEDC32772
	for <soc@archiver.kernel.org>; Tue, 23 Aug 2022 19:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60487C433D6; Tue, 23 Aug 2022 19:18:09 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0A4BC433C1;
	Tue, 23 Aug 2022 19:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0A4BC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661282284; x=1692818284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=od9EKCDhRArRaGPV2RxuCjiGWzeVGL06v4Tyo/Ik6Ls=;
  b=Xxf+eBrlAuptI6k8uWDU0IsEgKTwoCancFa7WoxYxBVbvdLJBf8Ge87b
   1axyLiRbl1aKOgCm2l0dmjwUKpOx0N2Nua2TSLCyWMe14Pxz2RRJ5NkFu
   U7f31Ch5FiMY/ND2mdObRZ1O8z1mODABE7Q0oaebRuS0Kp9IDbRGqXach
   v1OSFfVCGui0qnrAtM/qKzsNTdabUSMl8tl70zdLCoAereRLwMr+89ejC
   j7RK1mKJiB4242bRzujQ5KA1Ke/vgw9CWMfBIkJBNrRXYeOK01uNgenUO
   /xJCMShZnAhPaS1CmL0srW4zAYPTMxLvm62rTQFQgkN6PLoXmvGinWI55
   A==;
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="187761601"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Aug 2022 12:17:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 23 Aug 2022 12:17:56 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 23 Aug 2022 12:17:56 -0700
Date: Tue, 23 Aug 2022 21:22:10 +0200
From: Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
To: Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
	"soc@kernel.org" <soc@kernel.org>, Nicolas Ferre - M43238
	<Nicolas.Ferre@microchip.com>, UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH] ARM: dts: lan966x: add support for pcb8290
Message-ID: <20220823192210.cnkxmdb2eryg4hnz@soft-dev3-1.localhost>
References: <20220817190027.1632721-1-horatiu.vultur@microchip.com>
 <8e6c780e-28ee-1f37-c14c-f0ca5f590743@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8e6c780e-28ee-1f37-c14c-f0ca5f590743@microchip.com>

The 08/23/2022 07:11, Claudiu Beznea - M18063 wrote:

Hi Claudiu,

> > +&gpio {
> > +	miim_a_pins: mdio-pins {
> > +		/* MDC, MDIO */
> > +		pins =  "GPIO_28", "GPIO_29";
> > +		function = "miim_a";
> > +	};
> > +
> > +	pps_out_pins: pps-out-pins {
> 
> Can you also document this one as well? I can do it while applying if you
> provide the strings.

Yes, I will do that.
I will send a new version because I have seen that there is also a small
error in the commit message.

> 
> > +		pins = "GPIO_38";
> > +		function = "ptpsync_3";
> > +	};
> > +
> > +	ptp_ext_pins: ptp-ext-pins {
> 
> Ditto
> 
> Thank you,
> Claudiu Beznea
> 
> > +		pins = "GPIO_35";
> > +		function = "ptpsync_0";
> > +	};
> > +
> > +	udc_pins: ucd-pins {
> > +		/* VBUS_DET B */
> > +		pins = "GPIO_8";
> > +		function = "usb_slave_b";
> > +	};
> > +};
> > +
> > +&mdio0 {
> > +	pinctrl-0 = <&miim_a_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	ext_phy0: ethernet-phy@7 {
> > +		reg = <7>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy1: ethernet-phy@8 {
> > +		reg = <8>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy2: ethernet-phy@9 {
> > +		reg = <9>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy3: ethernet-phy@10 {
> > +		reg = <10>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy4: ethernet-phy@15 {
> > +		reg = <15>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy5: ethernet-phy@16 {
> > +		reg = <16>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy6: ethernet-phy@17 {
> > +		reg = <17>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	ext_phy7: ethernet-phy@18 {
> > +		reg = <18>;
> > +		coma-mode-gpios = <&gpio 60 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> > +
> > +&port0 {
> > +	reg = <2>;
> > +	phy-handle = <&ext_phy2>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 0 SERDES6G(1)>;
> > +	status = "okay";
> > +};
> > +
> > +&port1 {
> > +	reg = <3>;
> > +	phy-handle = <&ext_phy3>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 1 SERDES6G(1)>;
> > +	status = "okay";
> > +};
> > +
> > +&port2 {
> > +	reg = <0>;
> > +	phy-handle = <&ext_phy0>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 2 SERDES6G(1)>;
> > +	status = "okay";
> > +};
> > +
> > +&port3 {
> > +	reg = <1>;
> > +	phy-handle = <&ext_phy1>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 3 SERDES6G(1)>;
> > +	status = "okay";
> > +};
> > +
> > +&port4 {
> > +	reg = <6>;
> > +	phy-handle = <&ext_phy6>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 4 SERDES6G(2)>;
> > +	status = "okay";
> > +};
> > +
> > +&port5 {
> > +	reg = <7>;
> > +	phy-handle = <&ext_phy7>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 5 SERDES6G(2)>;
> > +	status = "okay";
> > +};
> > +
> > +&port6 {
> > +	reg = <4>;
> > +	phy-handle = <&ext_phy4>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 6 SERDES6G(2)>;
> > +	status = "okay";
> > +};
> > +
> > +&port7 {
> > +	reg = <5>;
> > +	phy-handle = <&ext_phy5>;
> > +	phy-mode = "qsgmii";
> > +	phys = <&serdes 7 SERDES6G(2)>;
> > +	status = "okay";
> > +};
> > +
> > +&serdes {
> > +	status = "okay";
> > +};
> > +
> > +&switch {
> > +	pinctrl-0 = <&pps_out_pins>, <&ptp_ext_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&udc {
> > +	pinctrl-0 = <&udc_pins>;
> > +	pinctrl-names = "default";
> > +	atmel,vbus-gpio = <&gpio 8 GPIO_ACTIVE_HIGH>;
> > +	status = "okay";
> > +};
> 

-- 
/Horatiu
