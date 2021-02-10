Return-Path: <SRS0=G/+E=HM=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A89EC433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 11:43:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4180E64E45; Wed, 10 Feb 2021 11:43:45 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE3D64DF5;
	Wed, 10 Feb 2021 11:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE3D64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1385141EE3;
	Wed, 10 Feb 2021 11:43:38 +0000 (UTC)
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
Date: Wed, 10 Feb 2021 20:43:37 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCPE2lPpBlhCi7TH@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 10/02/2021 20.34, Tony Lindgren wrote:
> * Hector Martin <marcan@marcan.st> [210210 11:14]:
>> That means it'll end up like this (so that we can have more than one
>> fixed-clock):
>>
>> clocks {
>>      #address-cells = <1>;
>>      #size-cells = <0>;
>>
>>      clk123: clock@0 {
>>          ...
>>          reg = <0>
>>      }
>>
>>      clk456: clock@1 {
>>          ...
>>          reg = <1>
>>      }
>> }
>>
>> Correct?
> 
> Yeah, just don't use an imaginary dummy index for the reg. Use a real
> register offset from a clock controller instance base, and a register
> bit offset too if needed.

I mean for fixed input clocks without any particular numbering, or for 
temporary fake clocks while we figure out the clock controller. Once a 
real clock controller is involved, if there are hardware indexes 
involved that are consistent then of course I'll use those in some way 
that makes sense.

The purpose of the clock in this particular case is just to make the 
uart driver work, since it wants to know its reference clock; there is 
work to be done here to figure out the real clock tree (e.g. we don't 
even know yet if the uart supports alternate clocks, that's tricky to 
test until we have some form of I/O other than uart!).

> Doing it right will save you tons of time later on ;)

Absolutely, I'm just pointing out that instances of it being done right 
are in short supply right now :-) (which makes it tricky for people like 
me, trying to put this together for a new soc, to guess what the right 
approach is by looking at existing examples)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
