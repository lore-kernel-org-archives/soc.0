Return-Path: <SRS0=ec3K=SY=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0BAC433EF
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 09:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 174CFC340E9; Wed,  9 Feb 2022 09:56:28 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A205C340E7;
	Wed,  9 Feb 2022 09:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A205C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644400587; x=1675936587;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MhAPRdsDHJ8uaTiaXrdti0+yuDAFi7HzI4SCxA0SdwE=;
  b=DUZZaqUePw6chcz/Bes2MJFdMOMjhYsO6hjoXktHCu8+5LsgaQT1xoaw
   tLlW4M3JsJEplBW1E/g6PN0/xXTO91or9D9RB0iI6MOTDWdIN5Gu74Pls
   QQV7ouXobnc8TWZmWC5UzRopn29BW4QE/Uo8X8fBZ4yIGOsBfEL00BtLN
   INqTn+IOm9G/+lB14kIgrf/Dme2SR3vLjTHz34MSS5w0O1mXYWe/uQR70
   rSH075I/0hGz4maGvWzv1h/rZVtLJsdTFfZaZ5Y2xDn/xukmvxW9ngABe
   VDRDuXXYI5rkLsjaw+9XLpetCRWIhjr4nw6ukoQ7IzY1JuKPZlDUHqBp7
   w==;
IronPort-SDR: DAFonjqizeKbuF+rjvTc3HLhKHGwG5r1ik+WiwDX6aW3TOztVim+344xEWbXB1UWjb7vP2l1bf
 vst6jHQ9NJuSSPe73oZvyclrZHdAJ/jGDBTsatHSqS7ptmHzblFalSgxoBdSNLQTRCsMV6fVPs
 4y06RfNUlXogXdl1OpIFf/PWfrELUNC+inD6KaS7NumTjAJFbOzUgNt0sqD8/1af1AlpeTevcC
 LPE0EPAza8+5NM3HXoGwz2JtJN5f7F/rTFZ84hfWMQi1Wh7a4GYNt79r2EZEnjeLJCYMfCmly5
 lnZO3lV8B+AKD6niql2Defy7
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="152967185"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2022 02:56:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 02:56:25 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 9 Feb 2022 02:56:23 -0700
Message-ID: <ee9826d1-216e-45b0-e48b-700ec41b3683@microchip.com>
Date: Wed, 9 Feb 2022 10:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] ARM: dts: add DT for lan966x SoC and 2-port board
 pcb8291
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, Olof Johansson
	<olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML
	<devicetree@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Microchip Linux Driver Support
	<UNGLinuxDriver@microchip.com>
References: <20220113080017.30155-1-kavyasree.kotagiri@microchip.com>
 <f8b83cf0-7ebf-1ecd-b544-f0d0079d9dde@microchip.com>
 <CAK8P3a2kRhCOoXnvcMyqS-zK2WDZjtUq4aqOzE5VV=VMg=pVOA@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAK8P3a2kRhCOoXnvcMyqS-zK2WDZjtUq4aqOzE5VV=VMg=pVOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2022 at 17:08, Arnd Bergmann wrote:
> On Thu, Jan 13, 2022 at 9:33 AM Nicolas Ferre
> <nicolas.ferre@microchip.com>  wrote:
>> On 13/01/2022 at 09:00, Kavyasree Kotagiri wrote:
>>> This patch adds basic DT for Microchip lan966x SoC and associated board
>>> pcb8291(2-port EVB). Adds peripherals required to allow booting: IRQs,
>>> clocks, timers, memory, flexcoms, GPIOs. Also adds other peripherals like
>>> crypto(AES,SHA), DMA and watchdog.
>>>
>>> Signed-off-by: Kavyasree Kotagiri<kavyasree.kotagiri@microchip.com>
>> Looks good to me:
>> Reviewed-by: Nicolas Ferre<nicolas.ferre@microchip.com>
> I'm not quite sure what to do with this, as this was sentto:soc@kernel.org,
> which is normally for patches that are already reviewed and should just
> get applied.
> 
> I can apply this, but I would normally expect board files to get picked up
> in the at91 tree first. I'll drop this version from patchwork for now, as I
> also have a couple of comments:

I have the intention to take this patch when it's ready in the at91 tree.

Thanks for your feedback Arnd. Best regards,
   Nicolas

-- 
Nicolas Ferre
