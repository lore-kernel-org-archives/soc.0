Return-Path: <SRS0=1moK=X3=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223CBC43334
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 12:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08020C341CB; Fri, 22 Jul 2022 12:48:13 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C141C341C6;
	Fri, 22 Jul 2022 12:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C141C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658494091; x=1690030091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SlbI3YoffkAc0xkVCuanBN99ne2tbCxFNSGgTOw0Jqg=;
  b=KrqDx4soT8E16CXdwZzGvjoQnmdNwtOLfF5QsTVGSbRlq6msICFRgJpr
   MCP/XMeK376OAGGiXiIhCT4uuo9Gddo74C0neCfJBExqNr+Qf9vjJJSgM
   30j6oqqUCpL94EfH4drUKrYoptzRtPKoWmOYGq71DFsIxu5fRG50oePqO
   Tw6BM1i1Go9hN6u/pZlIhhyDcB68bgEk+45Ew9SLh3NW5qVmwlu6Q6yLN
   GZgk/FYAO8weAgkBNPq0CIP6uDeIiEXtSqKu4yTUwwx9EM8vd8RRZ53kk
   FQMiO1HarlpzN9L+5kGQEn5H6sxMqgoW5KwLiGBaKCyZpnbKGnYrbONSB
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="183324445"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 05:48:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 05:48:04 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 22 Jul 2022 05:48:04 -0700
Date: Fri, 22 Jul 2022 14:52:13 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<UNGLinuxDriver@microchip.com>, <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: at91: add lan966 pcb8309 board
Message-ID: <20220722125213.ihz3sccjddikqyq6@soft-dev3-1.localhost>
References: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
 <20220720194904.2025384-2-horatiu.vultur@microchip.com>
 <d66aae55-1615-1bbc-4f56-2b4806635db4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d66aae55-1615-1bbc-4f56-2b4806635db4@linaro.org>

The 07/21/2022 08:46, Krzysztof Kozlowski wrote:
> 
> On 20/07/2022 21:49, Horatiu Vultur wrote:
> > Add documentation for Microchip LAN9662 PCB8309.
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > index 4e495e03264b..9dc9ad81193a 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > @@ -169,6 +169,12 @@ properties:
> >            - const: microchip,lan9662
> >            - const: microchip,lan966
> >
> > +      - description: Microchip LAN9662 PCB8309 Evaluation Board.
> > +        items:
> > +          - const: microchip,lan9662-pcb8309
> 
> This and other lan9662 boards should be just an enum. You grow the file
> needlessly... Unless it is clear preference of maintainer. Other boards
> follow normal enum approach, so it seems there is no such preference.

I can see your point. I will change it in the next version.

> 
> 
> Best regards,
> Krzysztof

-- 
/Horatiu
