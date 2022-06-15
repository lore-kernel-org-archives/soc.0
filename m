Return-Path: <SRS0=i4M+=WW=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B8C43334
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 12:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FBD5C3411F; Wed, 15 Jun 2022 12:30:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 201EFC34115;
	Wed, 15 Jun 2022 12:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 201EFC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CD98153B;
	Wed, 15 Jun 2022 05:30:39 -0700 (PDT)
Received: from bogus (unknown [10.57.11.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B37543F73B;
	Wed, 15 Jun 2022 05:30:37 -0700 (PDT)
Date: Wed, 15 Jun 2022 13:29:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.19
Message-ID: <20220615122927.exgqgcpzfmcuq5ic@bogus>
References: <20220614100007.1029881-1-sudeep.holla@arm.com>
 <de40d63e-b01d-d25b-e7a2-e54d5b5bcddb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de40d63e-b01d-d25b-e7a2-e54d5b5bcddb@gmail.com>

Hi Florian,

On Wed, Jun 15, 2022 at 05:42:10AM +0200, Florian Fainelli wrote:
> Hello,
> 
> On 6/14/2022 12:00 PM, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> > 
> > Please pull !
> > 
> > Regards,
> > Sudeep
> > 
> > -->8
> > 
> > The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> > 
> >    Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.19
> > 
> > for you to fetch changes up to 44dbdf3bb3f44bf08897ed5f22eb262edcf3d926:
> > 
> >    firmware: arm_scmi: Fix incorrect error propagation in scmi_voltage_descriptors_get (2022-06-12 19:59:55 +0100)
> 
> Looks like "firmware: arm_scmi: Add SCMI v3.1 protocol extended names
> support" introduces the following splat which is not fixed by the commits in
> this pull request:

Thanks for the report, we weren't even aware of the issue. We can discussed
in the original patch thread as you have also reported the issue there.
Cristian is unable to reproduce it yet, it would be great if you can provide
more info to help us figure out the issue and the fix 🤞.

-- 
Regards,
Sudeep
