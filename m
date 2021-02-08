Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0B7C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 14:13:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BE7F64E84; Mon,  8 Feb 2021 14:13:02 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E01B64E60;
	Mon,  8 Feb 2021 14:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E01B64E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 45F7141F47;
	Mon,  8 Feb 2021 14:12:55 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
 <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
Date: Mon, 8 Feb 2021 23:12:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 08/02/2021 21.40, Arnd Bergmann wrote:
> On Mon, Feb 8, 2021 at 1:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
>>> On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
>>>> apple
>>>>
>>>> Don't make things different for this one platform (comparing to all
>>>> other platforms). Apple is not that special. :)
>>>
>>> AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
>>> `apple`, as long as we're OK with having two different prefixes for the same
>>> vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
>>> this one :)
>>
>> Thanks for explanation. I propose to choose just "apple". Sticking to
>> old vendor name is not a requirement - we have few vendor prefixes which
>> were marked as deprecated because we switched to a better one.
> 
> We've gone back and forth on this a few times already. My current
> preference would also be to go with "apple", not because it's somehow
> nicer or clearer but because it avoids the namespace conflict with
> what the Apple firmware uses:

Ack, I'll use 'apple' for v2.

Amusingly, Apple actually use 'apple,firestorm' and 'apple,icestorm' for 
the CPUs in their devicetrees for these machines, so those will end up 
identical :) (they don't use apple-related prefixes for any other 
compatible strings at all, it's a mess). But we don't care about what 
their ADTs (Apple DTs) do in Linux anyway, the bootloader abstracts all 
that out and we'll be dealing with mantaining proper DTs ourselves.

>> Makes sense. In such case it's indeed your work. Since you introduce it,
>> the DTSes are usually licensed with (GPL-2.0+ OR MIT).
> 
> Indeed, we do want other OSs to use our dts files, so the general
> preference is to have a permissive license, unless you have a strong
> reason yourself to require GPL-only.

Thanks for pointing this out; this was actually unintentional. I based 
it off of an old dts I'd written ages ago and forgot to revisit the 
license. I even have it marked GPL-2.0+ in the copy in our bootloader 
repo, which is otherwise supposed to be MIT for original code...

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
