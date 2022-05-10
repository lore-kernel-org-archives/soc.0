Return-Path: <SRS0=QxDa=VS=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503B2C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 119DBC385A6; Tue, 10 May 2022 12:01:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id B5496C385C2;
	Tue, 10 May 2022 12:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5496C385C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A33A11FB;
	Tue, 10 May 2022 05:01:28 -0700 (PDT)
Received: from bogus (unknown [10.57.0.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5597B3F66F;
	Tue, 10 May 2022 05:01:26 -0700 (PDT)
Date: Tue, 10 May 2022 13:01:20 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Brown <broonie@kernel.org>, carsten.haitzler@foss.arm.com,
	carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <20220510120120.sg72sbi4vsun5wqb@bogus>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpMNmNIy1f2/dmc@sirena.org.uk>
 <5e214892-8038-35bc-c05d-c467bb51399c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e214892-8038-35bc-c05d-c467bb51399c@arm.com>

On Tue, May 10, 2022 at 12:56:15PM +0100, Robin Murphy wrote:
> On 2022-05-10 12:27, Mark Brown wrote:
> > On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> > 
> > > While at it, can we get these too enabled which are needed on JUNO IIUC.
> > > CONFIG_DRM_I2C_NXP_TDA998X
> > > CONFIG_DRM_I2C_NXP_TDA9950
> > 
> > > Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
> > > needed or not. I seem to have these for some HDLCD clock testing using SCMI.
> > 
> > Those two, especially TDA998x, are very widely used so should probably
> > just be enabled anyway regardless of what's on Juno.
> 
> Yeah, DRM_I2C_NXP_TDA998X and I2C_DESIGNWARE_PLATFORM are what's needed for
> Juno, and they've been enabled already for a long time now, so we're good.
> 

Ah my bad, so I haven't refreshed my listed then. I just append to defconfig,
which must have complained for duplicates and I am ignoring 🙁. Thanks
for the info and sorry for the noise then.

-- 
Regards,
Sudeep
