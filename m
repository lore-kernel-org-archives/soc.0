Return-Path: <SRS0=2XoW=VS=arm.com=liviu.dudau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B28C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 16:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BACD6C385CB; Tue, 10 May 2022 16:19:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 69E00C385C2
	for <soc@kernel.org>; Tue, 10 May 2022 16:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69E00C385C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2E4D12FC
	for <soc@kernel.org>; Tue, 10 May 2022 09:19:09 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D42B3F73D
	for <soc@kernel.org>; Tue, 10 May 2022 09:19:09 -0700 (PDT)
Date: Tue, 10 May 2022 17:19:04 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Carsten Haitzler <carsten.haitzler@foss.arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	carsten.haitzler@arm.com, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
 <YnpjKMQnbCr8pD/j@sirena.org.uk>
 <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>

On Tue, May 10, 2022 at 03:05:21PM +0100, Carsten Haitzler wrote:
> 
> 
> On 5/10/22 14:05, Mark Brown wrote:
> > On Tue, May 10, 2022 at 01:55:13PM +0100, Liviu Dudau wrote:
> > > On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> > 
> > > > While at it, can we get these too enabled which are needed on JUNO IIUC.
> > > > CONFIG_DRM_I2C_NXP_TDA998X
> > > > CONFIG_DRM_I2C_NXP_TDA9950
> > 
> > > I would not enable by default TDA9950 as that one is for CEC, which Juno doesn't
> > > implement so you get warnings everytime time tda998x probes.
> > 
> > If it's generating a warning due to the config option being enabled
> > that doesn't sound good - kernels are supposed to be multiplatform.
> 
> is it the:
> 
> [    7.471809] tda9950 0-0034: driver requires an interrupt
> 
> that you're talking about Liviu?

Yes, that is the warning.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
