Return-Path: <SRS0=VmVe=HL=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4140C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 00:49:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AE3C564EB1; Tue,  9 Feb 2021 00:49:38 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3D164E7A;
	Tue,  9 Feb 2021 00:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3D164E7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BCB7D4207F;
	Tue,  9 Feb 2021 00:49:31 +0000 (UTC)
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Olof Johansson
 <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208191447.GA1677483@robh.at.kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <d8454963-3242-699b-4c20-e85d26b19796@marcan.st>
Date: Tue, 9 Feb 2021 09:49:29 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208191447.GA1677483@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 09/02/2021 04.14, Rob Herring wrote:
> Does there need to be a legal entity behind 'The Asahi Linux
> Contributors' to be valid?

I don't think so, this seems to be common practice in other open source 
projects, and recommended these days.

Some recent discussion on the subject from the Linux Foundation:

https://www.linuxfoundation.org/en/blog/copyright-notices-in-open-source-software-projects/

>  From a more practical standpoint, if we want to relicense something in
> say 5 years from now, who do we ask for an okay?

I thought that's what Git history was for; certainly we aren't keeping 
file headers up to date every time someone touches a file (which for 
anything other than trivial changes gives them a copyright interest in a 
portion of the file).

Asahi Linux's policy for bespoke projects is to use "The Asahi Linux 
Contributors" for this reason, acknowledging that the copyright headers 
aren't up to date anyway (also the years...), and implicitly directing 
people to the orignal project (which is where Git history is kept and 
contains the true record of copyright owneship).

I'm not trying to shake up how we handle copyright lines in the kernel 
here, of course; if you prefer some nominal copyright line from "whoever 
first wrote the file or most of it" I can do that. But it certainly 
won't be the only person you have to ask if you want to relicense, if 
anyone else touched the file in a nontrivial way :)

There are a few examples of this style in the tree, mostly pulled from 
other projects:

arch/arm/oprofile/common.c
drivers/gpu/drm/vgem/vgem_drv.[ch]
drivers/md/dm-verity-target.c
drivers/md/dm-verity.h

>>> I guess Rob will comment on the dt-bindings more... but for me a generic
>>> "arm-platform" is too generic. What's the point of it? I didn't see any
>>> of such generic compatibles in other platforms.
>>
>> This is a hack for patches #11/#12 to use, and I expect it will go away once
>> we figure out how to properly handle that problem (which needs further
>> discussion). Sorry for the noise, this should not be there in the final
>> version.
> 
> I was going to ask on this. If you have a user of it, I'm okay with it.
> Generally though, 3 or 4 levels of compatible don't really have users.

The pattern here was board, soc, "arm-platform"; the first two seem to 
be a common (and useful) pattern, and I hope I can get rid of the third 
once we solve #11/#12 in a saner way.

> It's a WIP to be more consistent around node names. For actual
> clock controllers we have 'clock-controller(@.*)?'. There's not really
> something established for 'fixed-clock'. We probably should define
> something, but that goes in the schema first.

What do you suggest for this series?

> 
>>>> +		compatible = "fixed-clock";
>>>> +		#clock-cells = <0>;
>>>> +		clock-frequency = <24000000>;
>>>> +		clock-output-names = "clk24";
>>>
>>> What clock is it? Part of board or SoC? Isn't it a work-around for
>>> missing clock drivers?
>>
>> The clock topology isn't entirely known yet; I'm submitting this as an
>> initial bring-up patchset and indeed there should be a clockchip driver in
>> the future. The UART driver wants a clock to be able to calculate baud
>> rates. I figured we can get away with a fixed-clock for now while that part
>> of the SoC gets figured out.
> 
> That is normal. It does break compatibility between an old kernel
> and new DT. There's not really a good way to avoid that.

Ack. I hope we can basically acknowledge breaking DT changes without too 
much fuss at this early stage of bring-up, until things calm down a bit 
and we have real users who would complain :) (not that I won't try to 
avoid it).

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
