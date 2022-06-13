Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B0C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27BD8C3411C; Mon, 13 Jun 2022 17:20:31 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E519C34114;
	Mon, 13 Jun 2022 17:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E519C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id u8so4778337qvj.2;
        Mon, 13 Jun 2022 10:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=5dXpXAMWYea+zUYeNQXJzD8rtjz2yZFaK7kKd5xSQ1U=;
        b=OyEzzTKdjOtMK+/9YyfvlsKD0yjWoL4NfBi6PUId/U9eBq71D7GFoaCLN6Q28cmTfH
         SFLRL2rax204LUxPuBr7HKXco4IyrBeMrc7nbWTCbLychAKsoCT3jrDe2XjvjhGikgpK
         ESUcGsOYDsr/6/jeieum36NnYAy8jHhyW3EA7BSyQpFUmHIm0Q+ZRRf1TFHvDnRA6SdR
         JqUMCfjaZVF9yAtJs++dhUdVW7CU19HHGluSl8HYAxPHip1j/2JrYtOybonZbee3fdOR
         y3fMUcOJobfVQzPCrO5/y3nZ/JcBJ+qOBpeyIZUVV+BGVzKA25CVv7nwOfsvWOb46dPF
         8FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5dXpXAMWYea+zUYeNQXJzD8rtjz2yZFaK7kKd5xSQ1U=;
        b=SOamuwwiay5u5xblHfAhi/luv546WVI9cMwcs5f1ax3lMqbDjjQOcRnQyfoggvsLTg
         xUpfb+WZD3kAbw1lqIIdyvHrKinBNSn1rvFcLuxEaqx6VCzwC3khzkGw9hJhJB9uYJ7M
         rmkwSxJeXOHvAw6F2fxuo40C5umaVovoxJ7GqDHM4gf9oz8jfEl1EoIIeT+26Jla9/bD
         NRyLWmblRdQtX9qeuyE9GLKv8vQUtWjVGy+lBKIeuKDD972YHMM7/SVXgo/8gpZhxOrN
         m+pqwXsStLYRQSBNkZd3Jm1X/0Aki8zMrlW6kMwxPkqYAvJERA//zQ1X+Cg86kCfQKY7
         FkCg==
X-Gm-Message-State: AJIora8zU0TQ1XRYWju7gEfIDiciWdtWR+vaxUgqSBTnkYp+1rjHKYm0
	Mcvk11xDSwlLQu13jnli17Q8obyOYLs=
X-Google-Smtp-Source: AGRyM1u1spdKJ70351HEgbOLr99HN1dge1zKKFnnsltRDPq7ybZsc/V9Vhd3DTejVp4KHX0SLDe/yA==
X-Received: by 2002:a05:6214:2a83:b0:46b:27c2:b44c with SMTP id jr3-20020a0562142a8300b0046b27c2b44cmr24903qvb.26.1655140829103;
        Mon, 13 Jun 2022 10:20:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id f19-20020a05620a409300b006a6278a2b31sm7557236qko.75.2022.06.13.10.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 10:20:28 -0700 (PDT)
Message-ID: <70b33608-f76b-ffcb-9c06-06ee50640158@gmail.com>
Date: Mon, 13 Jun 2022 10:20:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [GIT PULL 2/2] Broadcom maintainers fixes for 5.19
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20220608093132.1465703-1-f.fainelli@gmail.com>
 <20220608093132.1465703-2-f.fainelli@gmail.com>
 <f2336ca6-b4f1-82a5-8b53-07ebadf4fe68@gmail.com>
In-Reply-To: <f2336ca6-b4f1-82a5-8b53-07ebadf4fe68@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/8/22 05:43, Florian Fainelli wrote:
> 
> 
> On 6/8/2022 11:31 AM, Florian Fainelli wrote:
>> The following changes since commit 
>> f2906aa863381afb0015a9eb7fefad885d4e5a56:
>>
>>    Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/Broadcom/stblinux.git 
>> tags/arm-soc/for-5.19/maintainers-fixes
>>
>> for you to fetch changes up to 46d6e11320d21dc40fce229ab3504125847de27e:
>>
>>    MAINTAINERS: Update BCM2711/BCM2835 maintainer (2022-06-08 01:00:47 
>> -0700)
> 
> I am going to submit a v2 where the git tree is also changes such that 
> we do not confuse submitters with a "stale" tree.

Nevermind, there is an appropriate URL change for the git tree, Arnd, 
can you pull both pull requests?
-- 
Florian
