Return-Path: <SRS0=tyzE=VT=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F2C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 13:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5716EC34112; Wed, 11 May 2022 13:15:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 0F835C34110;
	Wed, 11 May 2022 13:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F835C34110
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E40CED1;
	Wed, 11 May 2022 06:15:11 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3842C3F66F;
	Wed, 11 May 2022 06:15:10 -0700 (PDT)
Message-ID: <ef15cca3-61fa-a01a-6050-c687e5328813@foss.arm.com>
Date: Wed, 11 May 2022 14:15:09 +0100
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
 <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
 <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
 <YnqTTy7P5IEC6no/@sirena.org.uk>
 <YnrF3Nc7NbcX6v3b@e110455-lin.cambridge.arm.com>
 <Ynu2X/SwS7XqEEEs@sirena.org.uk>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <Ynu2X/SwS7XqEEEs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/11/22 14:13, Mark Brown wrote:
> On Tue, May 10, 2022 at 09:06:52PM +0100, Liviu Dudau wrote:
> 
>> The quickest way is to harmonise the treatment of IRQs between tda998x and tda9950.
>> The former treats the IRQ as optional, the later as mandatory. Given that (according
>> to comments in the code) TDA998X is actually a TDA9989+TDA9950, it makes sense to
>> treat the lack of IRQ the same way (make it optional, IMHO).
> 
> The check in tda9950 is sensible enough, the device relies on interrupts
> to report the status of CEC operations so we'd need to poll constantly
> which doesn't seem great.  It wouldn't be *so* bad for things initiated
> by the device but given that CEC is a network and we might get messages
> from other devices in the system at any time we'd need to poll
> constantly even when otherwise idle which doesn't seem good.  I sent a
> patch to lower the level of the log message, hopefully that's OK for
> people.

Ah - well either way- job done. :) No need to spin up a patch then :)
