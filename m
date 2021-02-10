Return-Path: <SRS0=G/+E=HM=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E962C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 12:56:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5820F64E65; Wed, 10 Feb 2021 12:56:17 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A372C64E32;
	Wed, 10 Feb 2021 12:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A372C64E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id B7B3541FA3;
	Wed, 10 Feb 2021 12:56:10 +0000 (UTC)
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
 <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Message-ID: <3d61ca6d-98a1-b78a-07da-cd20834de5a1@marcan.st>
Date: Wed, 10 Feb 2021 21:56:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 10/02/2021 21.24, Daniel Palmer wrote:
> This exact problem exists for MStar/SigmaStar too.
> As it stands there is no documentation to show what the actual clock
> tree looks like so everything is guess and I need to come up with numbers.
> I'm interested to see what the solution to this is as it will come up again
> when mainlining chips without documentation.

So far the answer seems to be to take the best guess available, and then 
we get to fix it until we have real users and breaking DT compatibility 
is no longer an option... :-)

>> The purpose of the clock in this particular case is just to make the
>> uart driver work, since it wants to know its reference clock; there is
>> work to be done here to figure out the real clock tree
> 
> FWIW arm/boot/dts/mstar-v7.dtsi has the same issue: Needs uart,
> has no uart clock. In that instance the uart clock setup by u-boot
> is passed to the uart driver as a property instead of creating a fake
> clock.

In our case it's an existing driver (with patches) that is already 
integrated with the clock infrastructure, so it makes sense to use a 
fixed-clock instead of just an ad-hoc property.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
