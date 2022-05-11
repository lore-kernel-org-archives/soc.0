Return-Path: <SRS0=tyzE=VT=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1273EC433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 11:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6B95C340F3; Wed, 11 May 2022 11:00:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id F03BCC340ED;
	Wed, 11 May 2022 11:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F03BCC340ED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73080ED1;
	Wed, 11 May 2022 04:00:49 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F3773F73D;
	Wed, 11 May 2022 04:00:48 -0700 (PDT)
Message-ID: <6d368f6a-6105-e1e8-2b71-38c3d153092a@foss.arm.com>
Date: Wed, 11 May 2022 12:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
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
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <YnqTTy7P5IEC6no/@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/10/22 17:31, Mark Brown wrote:
> On Tue, May 10, 2022 at 05:19:04PM +0100, Liviu Dudau wrote:
>> On Tue, May 10, 2022 at 03:05:21PM +0100, Carsten Haitzler wrote:
> 
>>> is it the:
> 
>>> [    7.471809] tda9950 0-0034: driver requires an interrupt
> 
>>> that you're talking about Liviu?
> 
>> Yes, that is the warning.
> 
> That doesn't look too worrying TBH, if it's causing confusion we should

Looks un-worrying to me. It (to my eyes) looks like an overzealous 
driver that should silently fail to load if no interrupt can be found as 
obviously the hardware can't exist, or the DT is misconfigured badly 
enough so it can never be driven until it's fixed. At best this is some 
info or so level printk to turn on in debugging your DT or something.

> just either fix the tda998x driver to not instantiate the tda9950 unless
> it has an interrupt or lower the severity of the log message in the
> tda9950 code.  It's certanly not something that should block use in a
> defconfig.

I agree.

> Ideally we'd not be using the wildcard compatible in the tda998x and
> would know if the CEC functionality was there but I think that ship has
> disappeared over the horizon at this point, and in any case someone
> might just not want to support CEC for some reason.

Right now the best "bang for buck" change would be to lower than 
complaint to an info level so s/dev_err/dev_info/ or maybe dev_notice 
there in tda9950.c for that specific complaint. Any preferences?
