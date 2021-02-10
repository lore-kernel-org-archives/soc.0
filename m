Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C02CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 11:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06DD64DF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 11:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06DD64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hcp66NA34JQQhBUsiWNLLhb9qsP3eKSlP9EHHQUl96g=; b=LAYBC7yi2d5WreUHjnTFx5d2v
	0PzFrt/Bbk4g0vAD/Wl1M+JPa0hsWP3ZlyIHHU2Mrb3iFHkFVWHbiKxlNDtsnjL7iejfohlIzX0tw
	LvARGDolN6yL2C6mt+XAESePK4xrgGmR1vBFQRHmtT/BMLJO2Fr9Rjlo/uQ5a47eGphTUH9spQhTm
	dVdpGsCC9CYZIJ6LLrMBtFwrNly2hmc3Ow9oRbAJ2CusKO4COhwF5BgmKHid+94d1BulR4t6BpGG+
	xYUJU+oYy0zgRZe9GFmvG1mdYnju3vVlLpkdvHg+Fjm0Y6yw2Spe/6VgBbDRatVFR2VxBGRwrCxTL
	3M4KnJUuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nuP-0000sa-MK; Wed, 10 Feb 2021 11:43:49 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nuL-0000rl-V2
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 11:43:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 1385141EE3;
 Wed, 10 Feb 2021 11:43:38 +0000 (UTC)
To: Tony Lindgren <tony@atomide.com>
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_064346_155715_4A315447 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210114337.Me1YQT3q2jUWELh1_1NWmu4nVTgXpCdu8VR6yrdqmhs@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
