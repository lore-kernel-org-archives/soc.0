Return-Path: <SRS0=QxDa=VS=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C25C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45359C385C2; Tue, 10 May 2022 12:08:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C600DC385A6;
	Tue, 10 May 2022 12:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C600DC385A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2672011FB;
	Tue, 10 May 2022 05:08:04 -0700 (PDT)
Received: from bogus (unknown [10.57.0.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F8A13F66F;
	Tue, 10 May 2022 05:08:02 -0700 (PDT)
Date: Tue, 10 May 2022 13:07:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: carsten.haitzler@foss.arm.com, carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <20220510120756.gcosdydmccbytmrn@bogus>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpMNmNIy1f2/dmc@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnpMNmNIy1f2/dmc@sirena.org.uk>

On Tue, May 10, 2022 at 12:27:50PM +0100, Mark Brown wrote:
> On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> 
> > While at it, can we get these too enabled which are needed on JUNO IIUC.
> > CONFIG_DRM_I2C_NXP_TDA998X
> > CONFIG_DRM_I2C_NXP_TDA9950
> 
> > Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
> > needed or not. I seem to have these for some HDLCD clock testing using SCMI.
> 
> Those two, especially TDA998x, are very widely used so should probably
> just be enabled anyway regardless of what's on Juno.

Indeed, Robin mentioned the same. I am just adding it blindly every time
I need to test HDLCD without noticing any warnings.

-- 
Regards,
Sudeep
