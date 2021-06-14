Return-Path: <SRS0=s6gb=LI=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6407EC4743C
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 17:09:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4426661242; Mon, 14 Jun 2021 17:09:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id E6AA661185;
	Mon, 14 Jun 2021 17:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6AA661185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789181FB;
	Mon, 14 Jun 2021 10:09:17 -0700 (PDT)
Received: from bogus (unknown [10.57.42.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974BC3F70D;
	Mon, 14 Jun 2021 10:09:15 -0700 (PDT)
Date: Mon, 14 Jun 2021 18:08:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210614170856.rs7jrke3gvpmu4km@bogus>
References: <20210601095838.GA838783@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601095838.GA838783@bogus>

Hi Olof,

On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> This is a new driver pull request. One of the arm64 patch is being
> pulled from a stable arm64 branch for-next/ffa as the other patches
> are dependent of the same.
> 
> Background
> ----------
> This has been on the list for almost a year now with changing requirements.
> Initially Arm KVM wanted to use this via userspace interface in VMM to
> communicate with VMs. But it was later dropped in favour of arch-agnostic
> interface[1].
> 
> Also there was some discussion on the dt-bindings which was dropped
> completely. Though we need to workaround the lack of full discoveribility
> in v1.0 spec, it is now being fixed for the next version of the spec.
> 

I see that you have pulled quite a lot of drivers and other SoC code
including my scmi and juno ones that were sent more recently than this
one. Just thought of checking if this is still in queue ? Sorry for the
nag but this has been on a list almost a year. We missed v5.13 due to
DT binding controveries(for good reasons) and we really don't want to
miss v5.14

-- 
Regards,
Sudeep
