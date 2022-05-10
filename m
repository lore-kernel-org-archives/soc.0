Return-Path: <SRS0=QxDa=VS=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801CBC433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 11:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BE4CC385C6; Tue, 10 May 2022 11:15:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DE468C385C2
	for <soc@kernel.org>; Tue, 10 May 2022 11:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE468C385C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7009612FC;
	Tue, 10 May 2022 04:15:53 -0700 (PDT)
Received: from bogus (unknown [10.57.0.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 111773F66F;
	Tue, 10 May 2022 04:15:51 -0700 (PDT)
Date: Tue, 10 May 2022 12:15:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: carsten.haitzler@foss.arm.com, carsten.haitzler@arm.com
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <20220510111545.uqatdfthc6lv5p7i@bogus>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>

+ Liviu, Robin

On Mon, May 09, 2022 at 01:55:10PM +0100, carsten.haitzler@foss.arm.com wrote:
> Key devices that support displays on SoCs like the Komeda DRM driver, the
> older HDLCD were not enabled by default and should be so displays can work
> out of the box on defconfig. Also Candence I2C support should be enabled so
> the PHY and thus displays can work too.
> 

While at it, can we get these too enabled which are needed on JUNO IIUC.
CONFIG_DRM_I2C_NXP_TDA998X
CONFIG_DRM_I2C_NXP_TDA9950

Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
needed or not. I seem to have these for some HDLCD clock testing using SCMI.

-- 
Regards,
Sudeep
