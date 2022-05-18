Return-Path: <SRS0=Zd8H=V2=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D13EC433EF
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 16:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E75C385A9; Wed, 18 May 2022 16:05:57 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED05DC385A5
	for <soc@kernel.org>; Wed, 18 May 2022 16:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED05DC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652889954; x=1684425954;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3euCKGvKwyKLln5ErCYPgdSqPR/sbrIxcH0pwTWC3p0=;
  b=jDcObtfeNNlA4n3XV+oR4U2xOPCS9kN9jj/IAJ6BmjfWOERuulvYODfj
   C8hHrVfp/+7/coEyWFQ5K50C+7F6iuZOzX7qv32w4ftZjJXFlOtVlvyer
   tHlRBI47a+iaezxnyGTVQpm4Z8Cs/QaKjWzeP15SnenGcJUBYdN2QrvF7
   Mtj5ThTqP1Y1cpluBRZ/358Jp2Ru+EZSvFh5V8tQlaxkASeulCxAG0RkG
   XLr/plxUtL6ECQcp6nLcQDzWrfYVkvSidtw0yIhf5vbe9NVOdaF07rtNn
   /0FcK7HO9P2btADSs5g9zM5VpSdZbXRkNE77QJqR7hJnzMVWXVfEe2Vop
   g==;
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="96333410"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2022 09:00:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 18 May 2022 09:00:53 -0700
Received: from [10.12.73.39] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 18 May 2022 09:00:51 -0700
Message-ID: <b97221e1-dd43-e2e0-5c37-f86162768f00@microchip.com>
Date: Wed, 18 May 2022 18:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ARM: configs: enable support for Kontron KSwitch D10
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Horatiu Vultur - M31836
	<Horatiu.Vultur@microchip.com>
References: <20220518141542.531148-1-michael@walle.cc>
 <CAK8P3a01B2uEP7=AkVBG5FYdfMHyReFP=120Ay3+s2EV9kO5Uw@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAK8P3a01B2uEP7=AkVBG5FYdfMHyReFP=120Ay3+s2EV9kO5Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Arnd, Michael,

On 18/05/2022 at 16:52, Arnd Bergmann wrote:
> On Wed, May 18, 2022 at 3:15 PM Michael Walle <michael@walle.cc> wrote:
>>
>> The Kontron KSwitch D10 is based on a Microchip LAN9668 SoC. It is a
>> managed ethernet network switch with either 8 copper ports or 6 copper
>> ports and 2 SFP cages.
>>
>> Enable all required kconfig symbols, either as module where possible or
>> compiled-in where it is not possible.
>>
>> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

>> ---
>> FWIW, there will be a board in our lab in KernelCI using this config.
> 
> The patch looks ok to me, but normally I'd expect it to go through the
> platform maintainer tree unless there is a reason not to. Adding the at91
> maintainers to Cc here.
> 
> It's also a bit late for 5.19, but if everyone agrees, I can add the patch
> to the arm/late branch.

If it's possible for you Arnd, I do agree that you take it in the 
arm/late branch.

Thanks, best regards,
   Nicolas

-- 
Nicolas Ferre
