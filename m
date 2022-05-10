Return-Path: <SRS0=ekum=VS=arm.com=robin.murphy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C1EC433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81C7FC385A6; Tue, 10 May 2022 11:56:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 1EA07C385C2;
	Tue, 10 May 2022 11:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EA07C385C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDAA11FB;
	Tue, 10 May 2022 04:56:22 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13F513F66F;
	Tue, 10 May 2022 04:56:20 -0700 (PDT)
Message-ID: <5e214892-8038-35bc-c05d-c467bb51399c@arm.com>
Date: Tue, 10 May 2022 12:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Content-Language: en-GB
To: Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: carsten.haitzler@foss.arm.com, carsten.haitzler@arm.com, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu.dudau@arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus> <YnpMNmNIy1f2/dmc@sirena.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YnpMNmNIy1f2/dmc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-05-10 12:27, Mark Brown wrote:
> On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> 
>> While at it, can we get these too enabled which are needed on JUNO IIUC.
>> CONFIG_DRM_I2C_NXP_TDA998X
>> CONFIG_DRM_I2C_NXP_TDA9950
> 
>> Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
>> needed or not. I seem to have these for some HDLCD clock testing using SCMI.
> 
> Those two, especially TDA998x, are very widely used so should probably
> just be enabled anyway regardless of what's on Juno.

Yeah, DRM_I2C_NXP_TDA998X and I2C_DESIGNWARE_PLATFORM are what's needed 
for Juno, and they've been enabled already for a long time now, so we're 
good.

Thanks,
Robin.
