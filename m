Return-Path: <SRS0=fsuH=GY=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60F6C433DB
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 15:14:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72F7A239EB; Thu, 21 Jan 2021 15:14:59 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55C3239D4;
	Thu, 21 Jan 2021 15:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55C3239D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id AD5FD22F99;
	Thu, 21 Jan 2021 16:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611242092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCqhHiLG+HIy/KpgWMep43uHSdTreIHEy2UEo+8BPmQ=;
	b=HNjygoJezksRVrvq/4vj1sKQDQb5mPiv2rc55WUhpe3aopQ7M2LIyyuEPBUtf9o03Zl113
	ma8PB8ark1Pj8VS9ssD5D8gx0rIK3rVUkV83Aqzl/lPBfBF8KGHwKC+ZlgMxM6GkFwpo+/
	IOYx1Od4kLHNbdITzw+8WcWLZ9lTJNU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Jan 2021 16:14:52 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <cbfc4899-eb92-938a-95f2-23ca9485beaf@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
 <bd86194a13882ce472764d0c91029e33@walle.cc>
 <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
 <df072e37bb6f3500d713be565cfa1328@walle.cc>
 <cbfc4899-eb92-938a-95f2-23ca9485beaf@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a346e761397a14d2effd4806e53395e5@walle.cc>
X-Sender: michael@walle.cc

Am 2021-01-21 14:16, schrieb Michal Simek:
> On 1/21/21 11:41 AM, Michael Walle wrote:
>> Am 2021-01-21 11:23, schrieb Michal Simek:
>>>>> Back to your case. Board is cheap which is not all the time case 
>>>>> for
>>>>> any
>>>>> xilinx board but you have only uart, sd and partially described
>>>>> ethernet
>>>>> which doesn't work without PL. Is it worth to have this described?
>>>> 
>>>> I got your point. But it is at least a jump start for the users if 
>>>> that
>>>> board boots out of the box. And yes, its unfortunate, that ethernet
>>>> just works if the PL is configured. This is already done by the
>>>> bootloader, because there I do have the same problem.
>>> 
>>> Zynq/ZynqMP boards can use U-Boot SPL. "Advantage" of this solution
>>> especially for Zynq is that in u-boot there is open a way for adding
>>> ps7_init file which is determined by device tree name.
>>> I think it would make sense to add these DTs and also ps7_init to 
>>> U-Boot
>>> project and wire it up with zynq_virt platform and then you can boot
>>> Linux with using U-Boot's DT pointed by $fdtcontroladdr.
>>> Then you will get support from scratch to be able to boot.
>> 
>> I already have patches for u-boot (using SPL). But my impression was
>> that linux is the master for the device trees. Esp. if there are some
>> problems with the board its often useful to have an in-tree device
>> tree.
>> 
>> What is the difference between this board and the other zynq boards
>> in the kernel?
>> 
>> In any case, please make this decision now: will you accept this
>> device tree or not?
> 
> If you promise to regularly test it I am fine with it.

I might even integrate it into our lava lab.

-michael
