Return-Path: <SRS0=LAtt=VS=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB0C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 14:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A30B0C385A6; Tue, 10 May 2022 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 73A2DC385C2;
	Tue, 10 May 2022 14:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73A2DC385C2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FD41042;
	Tue, 10 May 2022 07:05:23 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F4F3F73D;
	Tue, 10 May 2022 07:05:22 -0700 (PDT)
Message-ID: <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
Date: Tue, 10 May 2022 15:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, carsten.haitzler@arm.com,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
 <YnpjKMQnbCr8pD/j@sirena.org.uk>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <YnpjKMQnbCr8pD/j@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/10/22 14:05, Mark Brown wrote:
> On Tue, May 10, 2022 at 01:55:13PM +0100, Liviu Dudau wrote:
>> On Tue, May 10, 2022 at 12:15:45PM +0100, Sudeep Holla wrote:
> 
>>> While at it, can we get these too enabled which are needed on JUNO IIUC.
>>> CONFIG_DRM_I2C_NXP_TDA998X
>>> CONFIG_DRM_I2C_NXP_TDA9950
> 
>> I would not enable by default TDA9950 as that one is for CEC, which Juno doesn't
>> implement so you get warnings everytime time tda998x probes.
> 
> If it's generating a warning due to the config option being enabled
> that doesn't sound good - kernels are supposed to be multiplatform.

is it the:

[    7.471809] tda9950 0-0034: driver requires an interrupt

that you're talking about Liviu?
