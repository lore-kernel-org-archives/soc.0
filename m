Return-Path: <SRS0=2XoW=VS=arm.com=liviu.dudau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC6DC433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BBA7C385C2; Tue, 10 May 2022 12:55:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D15C2C385C6
	for <soc@kernel.org>; Tue, 10 May 2022 12:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D15C2C385C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6039212FC
	for <soc@kernel.org>; Tue, 10 May 2022 05:55:17 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B4FC3F73D
	for <soc@kernel.org>; Tue, 10 May 2022 05:55:17 -0700 (PDT)
Date: Tue, 10 May 2022 13:55:13 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: carsten.haitzler@foss.arm.com, carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510111545.uqatdfthc6lv5p7i@bogus>

On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> + Liviu, Robin
> 
> On Mon, May 09, 2022 at 01:55:10PM +0100, carsten.haitzler@foss.arm.com wrote:
> > Key devices that support displays on SoCs like the Komeda DRM driver, the
> > older HDLCD were not enabled by default and should be so displays can work
> > out of the box on defconfig. Also Candence I2C support should be enabled so
> > the PHY and thus displays can work too.
> > 
> 
> While at it, can we get these too enabled which are needed on JUNO IIUC.
> CONFIG_DRM_I2C_NXP_TDA998X
> CONFIG_DRM_I2C_NXP_TDA9950

I would not enable by default TDA9950 as that one is for CEC, which Juno doesn't
implement so you get warnings everytime time tda998x probes.

Best regards,
Liviu

> 
> Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
> needed or not. I seem to have these for some HDLCD clock testing using SCMI.
> 
> -- 
> Regards,
> Sudeep

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
