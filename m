Return-Path: <SRS0=G/+E=HM=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5009C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 11:08:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A939F64E25; Wed, 10 Feb 2021 11:08:00 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E6264E2F;
	Wed, 10 Feb 2021 11:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E6264E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3B9FC41FA3;
	Wed, 10 Feb 2021 11:07:52 +0000 (UTC)
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
Date: Wed, 10 Feb 2021 20:07:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCOzLSqdsr83xf0b@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 10/02/2021 19.19, Tony Lindgren wrote:
> * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
>> On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> ...
> 
>>>> +	clk24: clk24 {
>>>
>>> Just "clock". Node names should be generic.
>>
>> Really? Almost every other device device tree uses unique clock node names.
> 
> Yeah please just use generic node name "clock". FYI, we're still hurting
> because of this for the TI clock node names years after because the drivers
> got a chance to rely on the clock node name..
> 
> Using "clock" means your clock driver code won't get a chance to wrongly
> use the node name and you avoid similar issues.

That means it'll end up like this (so that we can have more than one 
fixed-clock):

clocks {
     #address-cells = <1>;
     #size-cells = <0>;

     clk123: clock@0 {
         ...
         reg = <0>
     }

     clk456: clock@1 {
         ...
         reg = <1>
     }
}

Correct?

Incidentally, there is just one example in the kernel tree of doing this 
right (in arch/arm/boot/dts/imx6qdl-tx6.dtsi). All the others that use 
non-mmio clocks called `clock`, including the various tegra devicetrees, 
violate the DT spec by not including a dummy reg property matching the 
unit-address.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
