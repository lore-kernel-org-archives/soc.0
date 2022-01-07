Return-Path: <SRS0=y2Xw=RX=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3FC433EF
	for <soc@archiver.kernel.org>; Fri,  7 Jan 2022 11:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2E4DC36AE9; Fri,  7 Jan 2022 11:37:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C32D9C36AED;
	Fri,  7 Jan 2022 11:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C32D9C36AED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3362D13D5;
	Fri,  7 Jan 2022 03:37:56 -0800 (PST)
Received: from bogus (unknown [10.57.38.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0B73F66F;
	Fri,  7 Jan 2022 03:37:54 -0800 (PST)
Date: Fri, 7 Jan 2022 11:37:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
Message-ID: <20220107113740.f4zlz25largdjcfd@bogus>
References: <20211222141342.56395-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222141342.56395-1-sudeep.holla@arm.com>


Hi again,

On Wed, Dec 22, 2021 at 02:13:42PM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
>
> Please pull !
>

I am aware I sent this pull request just around the same time Arnd finalised
the initial set. I have seen emails suggesting that Olof might be planning
to merge additional PR, so it would be great if this gets included in
that cut. All the changes are in -next since 21st December, so there should
be no surprises.

Thanks again and sorry for nagging.

--
Regards,
Sudeep
