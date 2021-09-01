Return-Path: <SRS0=k76B=NX=arm.com=james.morse@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F97C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 17:04:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 75CD361053; Wed,  1 Sep 2021 17:04:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 14EA561058;
	Wed,  1 Sep 2021 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14EA561058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A0B71042;
	Wed,  1 Sep 2021 10:04:23 -0700 (PDT)
Received: from [192.168.0.14] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 087883F694;
	Wed,  1 Sep 2021 10:04:21 -0700 (PDT)
Subject: Re: About resctrl code rebase
To: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>, "'soc@kernel.org'" <soc@kernel.org>,
 "'tony.luck@intel.com'" <tony.luck@intel.com>,
 "'arnd@arndb.de'" <arnd@arndb.de>, "'will@kernel.org'" <will@kernel.org>,
 "'catalin.marinas@arm.com'" <catalin.marinas@arm.com>,
 "'olof@lixom.net'" <olof@lixom.net>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
References: <TYAPR01MB6330CE3CB67CF8F602D44D098BCD9@TYAPR01MB6330.jpnprd01.prod.outlook.com>
From: James Morse <james.morse@arm.com>
Message-ID: <97164928-e2d7-fd3f-e063-9174b028ed65@arm.com>
Date: Wed, 1 Sep 2021 18:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB6330CE3CB67CF8F602D44D098BCD9@TYAPR01MB6330.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Tan Shaopeng,

On 01/09/2021 09:35, tan.shaopeng@fujitsu.com wrote:
>> As you known, Fujitsu is implementing a feature that add A64FX's cache 
>> control function into resctrl.

>> Fujitsu will implement this feature base
>> on your rebased code. I think the commit of refactoring arch/x86 
>> implementation of resctrl has been merged into the x86/cache branch. 
>> https://lore.kernel.org/lkml/162871088112.395.12879267279872673224.tip-bot2@tip-bot2/ 

I'm afraid this was only a small part of it.

I've also posted the next series here:
https://lore.kernel.org/lkml/20210729223610.29373-1-james.morse@arm.com/

and there are a couple more after that.


>> I would like to know whether you have rebased these codes that move 
>> the common parts of multiple architectures to somewhere. 
>> And where is the rebase code? 
>> In addition, when will you release the latest MPAM patch?

I will keep posting 'the next part' of the x86 changes once the earlier part is reviewed.
(please help!)

I can't push the latest branch until the ACPI spec is published, but I hope that will
happen this month.


> I'm afraid that my message may not have reached you.

Yes, I'm horribly behind with email!


Thanks,

James
