Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64958C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 17:06:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9F960F4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 17:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F9F960F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/TxxuHKlSk4H6NPxQlxE7xGKC4PWRhx18UB4t88tkFE=; b=i6pk82aJO5yRtDamUC/V15QHMq
	uBWT2VMlvqZI+QT5CbZnwEXrcxqkBFcVXuCmmD0p8s85vkFlEHGW0cx/oJlKFvxBKFOKZcQPIDs0t
	fdFuVqInBfxQNZwCzfjd+CBWZIxP89Z1sX+siOU4oMAn00415H1mcgFwdoPPvvYnUnLOLlfYuGMCt
	cUk2Z57OYyA1yDBWG9XppXkhX92Qt8OmTjSBIP1/uuWkzCMx3fKcQgPR3skHX504P35ZHy26Y3w47
	V2cs5GzAqtlD5TtY6sdRFsLPVZH6AuJGzU9h2CK9PfQhtyIrlbgRQMKH1mCfTJNjRNZ7uDEvJH5eW
	hzsGxS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLTfA-006gUy-1u; Wed, 01 Sep 2021 17:04:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLTf6-006gU4-BS
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 17:04:33 +0000
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
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_100432_531342_32DD208B 
X-CRM114-Status: GOOD (  13.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210901170420.65KFdDatm7mKlrWIB5eDJIuh9nXnVk_MIyBoAWWLMxs@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
