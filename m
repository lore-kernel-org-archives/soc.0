Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8FBC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 14:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF5D64E2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 14:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF5D64E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lilQG7KaHOeIchGCXvabJ4sQEBi4UuphIWVbnPIu860=; b=OJ3bGMnQ3izmFV6feLmkkUrBS
	JcfAAKDTggKZocznJQiaEOM2wb60L8vQKKIGdw/TFKDqQvOmxjfvyY1v5iffOs260oh4mxDSxJuaD
	anTpUlqNN5zsGRN5mUb0aK89U+zAT6FA+ja/y4sLN60N0W1v+P6hfkNczC1U41uYWMZOIVExZuwPp
	ywWcNh94UVTXYJyyqd623WSU0wq6dOMNCc+k4rI5xQ4pLShMUIi3ctU8MfofaMK1lT6iz7VLUp5QA
	c8Ii/Zjyq+tpN9rt/NA17tOywUjUBLjC5sFZw84jG+9ss3/Uu3X2kOJl7Cmo4deK72Rli3y0iKc6b
	CQ1UCTnDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l97QV-0003xQ-H8; Mon, 08 Feb 2021 14:22:07 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l97Hh-0007bN-Jy
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 14:13:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 45F7141F47;
 Mon,  8 Feb 2021 14:12:55 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_091301_982577_05602C73 
X-CRM114-Status: GOOD (  17.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208141252.8cObSzudXAMajMHlmZfHJbncQGTpLyo39xJnpImvjac@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
