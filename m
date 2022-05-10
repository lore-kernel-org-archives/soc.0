Return-Path: <SRS0=LAtt=VS=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCED0C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88DAEC385C6; Tue, 10 May 2022 12:34:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 399F5C385C2;
	Tue, 10 May 2022 12:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 399F5C385C2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ED2E11FB;
	Tue, 10 May 2022 05:34:02 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F3C13F66F;
	Tue, 10 May 2022 05:34:01 -0700 (PDT)
Message-ID: <dd43b159-0510-dc78-8ec0-7a52fc3d404a@foss.arm.com>
Date: Tue, 10 May 2022 13:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: carsten.haitzler@arm.com, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu.dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus> <YnpMNmNIy1f2/dmc@sirena.org.uk>
 <20220510120756.gcosdydmccbytmrn@bogus>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20220510120756.gcosdydmccbytmrn@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/10/22 13:07, Sudeep Holla wrote:
> On Tue, May 10, 2022 at 12:27:50PM +0100, Mark Brown wrote:
>> On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
>>
>>> While at it, can we get these too enabled which are needed on JUNO IIUC.
>>> CONFIG_DRM_I2C_NXP_TDA998X
>>> CONFIG_DRM_I2C_NXP_TDA9950
>>
>>> Liviu/Robin who use HDLCD more than me on Juno can confirm if these are
>>> needed or not. I seem to have these for some HDLCD clock testing using SCMI.
>>
>> Those two, especially TDA998x, are very widely used so should probably
>> just be enabled anyway regardless of what's on Juno.
> 
> Indeed, Robin mentioned the same. I am just adding it blindly every time
> I need to test HDLCD without noticing any warnings.
> 

Yup - those were already there. I was just adding these for our new 
Morello board - all it needed was I2C Cadence enabled as a module and 
presto... it "just works". As it's just a module it's not really a bad 
"cost" so defconfig additions seemed the right thing to do. Just chasing 
up this patch as I sent it earlier this year and it was not merged or 
denied... :)
