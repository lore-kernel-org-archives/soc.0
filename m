Return-Path: <SRS0=caHC=ZZ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C0ECAAD8
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 21:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD518C433B5; Thu, 22 Sep 2022 21:23:15 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0F63C433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 21:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0F63C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id g23so7275363qtu.2
        for <soc@kernel.org>; Thu, 22 Sep 2022 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vkd4Qbhm4ZXwQdYWHHcV9mklNDv7qaBi1y2HH/tV66k=;
        b=UELa90QMadie28GFK8XQYRTT0ziE+XfBwRlBlIUS3nUmsa/q0/5Sz5aLwNCsbxn7Ga
         HiAH8BeN5bpBXmKgNEz+HKAa0V6OQmvkbsK/X8YxqCqlli5K9ZmpLrWtEUxK+8fQz1m9
         AMPLM114vM/05W2fqze0a+yFW2WHARxLr74uvtkcwrFHvlKmxExGnmPctglPJF/jrb8m
         vsCy8keiLs31wD2s6+dQcn1u2aHKZegP9OUPrUTIvBCYss8dB1TxMimMtv/o+L7hH0Y0
         vXfbpLmIeqWa7ZuZWqsukpqogKqPWtinXKfk98V6iJN20oQVbSJxMOsDIx/6SPI2tdnQ
         Pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vkd4Qbhm4ZXwQdYWHHcV9mklNDv7qaBi1y2HH/tV66k=;
        b=OFp+96q3zKXN3YZVyhz6x9OOFYtzCtQ54jgWeT896VawuZui4Hwtl8EZP7hBybkwF0
         6QZDG+Yf6Jnq6/4/8Sx1J3NWE2x0PolMGxtzxNhZJoE0YsgKOW8MQNfwbre7Dqe8hKDD
         y7pNx5jrd4eoHZb1n4mBpRGsq6+u6CUsrD/6Uno48wrOJeK//AOpkOWwiFwOYFDDd5ih
         AtfxU+dl0p4Ff/xq0djVJf/XhBK4zKRN+hSVMT0Ciu9VzmjKdPvCt4WY2Qm5P0KKXbb3
         5py4w0Xl6c038+/pfjr0Hx1g7k26YMxMlzV1etMAgw30vWYyG2NbpuFcDPDzpsSG8uho
         WNbg==
X-Gm-Message-State: ACrzQf2CWPLaj+4fGdXNYg/zIzEFsduM1RDpwV+YxJzdDMc+/mddxRui
	PM4Rz+5w6GLqrIIRs2KnmQI=
X-Google-Smtp-Source: AMsMyM7HiqU9iDUQKGpEXv2gvgJO6oPCdNI0hck679wGiCpEIDC5HIxVgtVJTuQEhIvJETRURpwQKg==
X-Received: by 2002:a05:622a:3c7:b0:35c:fc6d:7abb with SMTP id k7-20020a05622a03c700b0035cfc6d7abbmr4594116qtx.581.1663881793591;
        Thu, 22 Sep 2022 14:23:13 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id bs13-20020a05620a470d00b006b5d9a1d326sm4767637qkb.83.2022.09.22.14.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 14:23:13 -0700 (PDT)
Message-ID: <438db2a8-0b41-23b4-a369-4475bea90795@gmail.com>
Date: Thu, 22 Sep 2022 14:23:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
 <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
 <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
 <8c1c4506-bd21-a35e-d6e5-3c7897715c18@gmail.com>
 <79fed88c-7dae-4131-a005-b8374b5fe660@www.fastmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <79fed88c-7dae-4131-a005-b8374b5fe660@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/22 14:22, Arnd Bergmann wrote:
> On Thu, Sep 22, 2022, at 8:17 PM, Florian Fainelli wrote:
>> On 9/22/22 11:13, Linus Torvalds wrote:
>>> I could pull your Broadcom fixes directly on top if you/Arnd would
>>> prefer that as a solution?
>>
>> Thanks for the offer, no real urgency on my side, if there is a -rc7,
>> maybe Arnd can submit a follow up for ARM SoC fixes, as there is a good
>> chance we will accumulate more of those between -rc6 and then. If not,
>> and Arnd is fine with it, yes please pull mine directly, thanks!
> 
> Yes, that was my plan already, sorry for not making that clearer already:
> 
> I still have a couple of fixes pull requests in a backlog, including
> yours. Since the fixes branch was already large and the rest has
> not been in my tree yet, I decided to send whatever I had already,
> but planned to pick the rest up tomorrow morning to send early next
> week after I get a successful test result from the build bots.

Works for me, thanks!
-- 
Florian
