Return-Path: <SRS0=ojGJ=I6=arm.com=james.morse@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FA6C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 16:15:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D691461361; Thu,  1 Apr 2021 16:15:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 4C0A961184;
	Thu,  1 Apr 2021 16:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0A961184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=james.morse@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92FAE1570;
	Thu,  1 Apr 2021 09:15:12 -0700 (PDT)
Received: from [192.168.0.14] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A0B3F792;
	Thu,  1 Apr 2021 09:15:11 -0700 (PDT)
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
 <OSAPR01MB21463C735D4A07344F35E7CC8B7C9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
From: James Morse <james.morse@arm.com>
Message-ID: <edaea436-d94e-d862-1136-66e9f881e0cc@arm.com>
Date: Thu, 1 Apr 2021 17:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <OSAPR01MB21463C735D4A07344F35E7CC8B7C9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Tan Shaopeng,

On 31/03/2021 09:52, tan.shaopeng@fujitsu.com wrote:
>>> Given that all of this is outside of the scope of the architecture, I
>>> don't think that arch/arm64/ is the right place for it. Perhaps this
>>> would fit into the resctrl rework that James has been doing for MPAM?
>>
>> Indeed, that sounds like a good starting point. I don't understand enough about
>> either of the two to be sure, but it sounds like there is some overlap in
>> functionality, and ideally we would have one user interface that can deal with
>> all the hardware implementations (intel, arm, fujitsu and any future ones).

> According to my study, it seems possible to add A64FX's sector cache function
> to resctrl.

I think this depends on whether it maps to one of Intel RDT's existing schema.
While adding new ones looks easy, it is bad for user-space as they are not portable
between machines that support resctrl.


> I heard you are working on resctrl rework for MPAM , 
> but I cannot find related patches on ML archive. Therefore, 
> I would like to know the status about MPAM support. 

Its about five or six series that refactor resctrl inside arch/x86 to have a clear
boundary between arch-specific code and the resctrl code that implements the filesystem,
then pull it out to /fs/ and build the MPAM driver to make it work for arm64.

Unfortunately, its rather large (>100 patches), so will take some time to be reviewed.


> (1) I think the first step is to support resctrl for ARM arch. 
>    Have you finished the work of arm support and when will you release it? 

No-one wants a second copy of the code to implement resctrl, as this will introduce subtle
bugs that user-space would have to work around, and make it harder to merge later.

The first step is to refactor the arch/x86 implementation of resctrl so that the parts
that are visible to user-space can be moved somewhere that is common to multiple
architectures.

I've posted the next chunk of that work here:
https://lore.kernel.org/lkml/20210312175849.8327-1-james.morse@arm.com/

> (2) When will you release MPAM patch?

The latest complete version of the tree is here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot/feb

It is over a year old, and has plenty of bugs.

I hope to push a newer version of the branch once I have a complete copy of the tree that
has been tested, and is based on the current version of the ACPI table.



Thanks,

James
