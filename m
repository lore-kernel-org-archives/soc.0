Return-Path: <SRS0=WaVp=MF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0FAC07E95
	for <soc@archiver.kernel.org>; Tue, 13 Jul 2021 10:52:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9E4ED61284; Tue, 13 Jul 2021 10:52:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 4450661260;
	Tue, 13 Jul 2021 10:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4450661260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EA8B6D;
	Tue, 13 Jul 2021 03:52:09 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461303F7D8;
	Tue, 13 Jul 2021 03:52:08 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:51:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v5.14(part 2)
Message-ID: <20210713105056.d6fangye24ru3gyo@bogus>
References: <20210625102807.206112-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625102807.206112-1-sudeep.holla@arm.com>

On Fri, Jun 25, 2021 at 11:28:07AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
>
> Please pull !
>

Please ignore this, will send updated fixes. I will delete the tag to
avoid confusion.

--
Regards,
Sudeep
