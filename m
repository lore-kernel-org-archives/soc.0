Return-Path: <SRS0=IFWb=NF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDECBC25B75
	for <soc@archiver.kernel.org>; Mon,  3 Jun 2024 12:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFEA8C4AF0B; Mon,  3 Jun 2024 12:43:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 742EAC2BD10;
	Mon,  3 Jun 2024 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 742EAC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3232E1042;
	Mon,  3 Jun 2024 05:43:58 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A103F792;
	Mon,  3 Jun 2024 05:43:32 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:43:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] ARM: vexpress: Update for v6.10
Message-ID: <Zl26clRRMuJNovza@bogus>
References: <20240515093334.1946888-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515093334.1946888-1-sudeep.holla@arm.com>

On Wed, May 15, 2024 at 10:33:34AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
>
> There is no reason to delay this until v6.11, hence the late pull request
> for v6.10.
>
> Please pull if there is a plan for another late pull request during the
> merge window. Or else it can be deferred for v6.11
>

Please ignore this as it its already -rc2 now. I have now rebased and
will send it as part of v6.11 pull request.

--
Regards,
Sudeep
