Return-Path: <SRS0=jtHp=MI=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2805C636CA
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 19:19:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97FE860551; Fri, 16 Jul 2021 19:19:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C68960720;
	Fri, 16 Jul 2021 19:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C68960720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1626463165; x=1657999165;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1iYOq1rG77eTG0FIfUsTqlPL5ITihfDVgzH0zMvxaQk=;
  b=DvYT6uLwwsRTC6mB49WWl2p4qOV92pZynNu6rZyCINmd6gSx7IqCi58b
   I49jmWKAM/UbMQmW5YZaoD/RIAC7JWjr5cxaEhhMW9XBV/dRMW2Ch/OCt
   ueOcU+GBOabgsEI80RFXd3QzSw5FmtF8lLyTQDOZwWAFeG+MqF6jHeAkp
   fL0+ggXRjbI+awqOejaFbN61WQH3O7Dn2E1MWuw+bFdQDs1UXid0+VMec
   FJ+PtJh68nKpHCD64n5liHER4y78C/xIbMOfHAfolIw66RUmRp5g2wR8k
   9pkTQrf2czVTkwMCXh3z/mWdfNR2Yp5shGR1GJ8C9BmcO5al9LpAB3l5G
   Q==;
IronPort-SDR: RXKTwfb5DY6KWaN+0z7Bjt+rDnSGVfzfEJznoDUxEzzGZbhVRQLulUOj9/s5uR3S5k95BQkweY
 aQWAy+j/GgS82UvZyrOZBJyH5xWEHonjaHFcIRwEMGrsNaHZN6gGY4fpdauqObUgbwFA7kQKSw
 DuMrMGevnUSJ64KSzddvTgtysDr2luIub9yMw1bvuGOC7mZqMNJ+M/us0IKfSrmRrg5kwxgjBm
 gKSo7fMWaGPNsUJbYxH9Thg/0EyoWWshERj+stkh3scswYwtd90Bv1VsQ/xkPEmOGmFRvBBHon
 hpoq8y3vfG6c1yBgMW7oQ/6v
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="129156491"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2021 12:19:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 12:19:24 -0700
Received: from [10.12.72.255] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 16 Jul 2021 12:19:22 -0700
Subject: Re: [PATCH v5 1/4] dt-bindings: ARM: at91: document sama7g5ek board
To: Eugen Hristev <eugen.hristev@microchip.com>, <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ludovic.desroches@microchip.com>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Rob
 Herring" <robh@kernel.org>
References: <20210628120452.74408-1-eugen.hristev@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <e6f704c2-bc96-7c3c-5100-e16303d5193e@microchip.com>
Date: Fri, 16 Jul 2021 21:19:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628120452.74408-1-eugen.hristev@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/06/2021 at 14:04, Eugen Hristev wrote:
> Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Series look good to me. I queue 1-2 in at91-dt and 2-3 in at91-defconfig 
for 5.15.
It'll be in at91-next for a few days for 0-day robot consumption.

Best regards,
   Nicolas

> ---
>   Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 6fc5a22ad962..fba071b9af1d 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -145,6 +145,11 @@ properties:
>             - const: atmel,sama5d4
>             - const: atmel,sama5
>   
> +      - items:
> +          - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
> +          - const: microchip,sama7g5
> +          - const: microchip,sama7
> +
>         - items:
>             - enum:
>                 - atmel,sams70j19
> 


-- 
Nicolas Ferre
