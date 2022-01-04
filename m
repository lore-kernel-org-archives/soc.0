Return-Path: <SRS0=72Bi=RU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04126C433EF
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 21:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C66CBC36AED; Tue,  4 Jan 2022 21:58:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2646DC36AEB;
	Tue,  4 Jan 2022 21:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2646DC36AEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id v11so33404665pfu.2;
        Tue, 04 Jan 2022 13:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SvvGIAAMMC9ckU70W4Ce20Dg5mENqSpztq6aOwwnONM=;
        b=gN0wx9+UQnTGVEWTwATlyJVK6Lc7qD92T4t4H+mqku28DmIVnCUkH2NlqpKU/F0PlX
         8PKuqMtvd4andGx78Dq1ydyp3ocGf6avE+kclTRIKYQCntC38iCUkXR+GD2jI1HjJapP
         unmcv0vpWbq06NqVE+2ZJqP9TWJKOhnEDCtHlkzvior2oOQXyiFAqMYWIqEer92R6uEG
         dOn9Hzz6wZzmaCMYAKKUpNRu68w5vD2uhRHPZLt4J2EvBvBDeoKuBsRE2CbZd6jKYLCd
         hjkb+Kula+RV5rlNApNNC9jzB3v1zZvByV2DSEZj+9+gxCNEK/7LE4O1eECZ4Brnyl5S
         AAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SvvGIAAMMC9ckU70W4Ce20Dg5mENqSpztq6aOwwnONM=;
        b=1k13tTaOqnNJrTx7XBwDbt5/m00J17vj5crbxwZlEEZ0UHM6ryjJN54DmKSCfRqVjc
         MaNKrnTJ9VCvaGFzXNrk15CJKAaIfNau/A9JRdzaSW4QfT6uqQnhFUdwJTnyJrUQK4gm
         DYCwSEGH+DjBsIBLp+ysFzaCErdoZ/CEcrfm/pCQSu/f4Xr4gC+E2SlSpHE9Dz6XKMhJ
         hvqyPbVWUyESZPrcrlusH9e6iH9hrL1YcmIOCTmuZpBjBf2byicWc7WET6Rd9pG2eLef
         10LUQEnRy/Ne0cSM+YjtcwfPi0CJlbTVuQLCJbOSHdlQcTdTP/LcDAL/tzxr+nj/VQKY
         kagg==
X-Gm-Message-State: AOAM531l46xfXFnH+hsKpyrZdz/1CXL9XoRqKHtVIroAO8tlt8NFZRxv
	+B/eA9UFjIgxb/FZNljV+PU=
X-Google-Smtp-Source: ABdhPJzA2TQlMHUW2exBYZuzPP9QsJTEf6wQU7NQ/BciivIvgsHyfURZFbh5JOwf73cli6UAIq9UoQ==
X-Received: by 2002:a63:8042:: with SMTP id j63mr46712579pgd.292.1641333491667;
        Tue, 04 Jan 2022 13:58:11 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h19sm41321798pfh.112.2022.01.04.13.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 13:58:11 -0800 (PST)
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
From: Florian Fainelli <f.fainelli@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
 <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com>
Message-ID: <ee2c92da-030c-b92f-0f41-1fdbbeed47c7@gmail.com>
Date: Tue, 4 Jan 2022 13:58:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/24/21 9:11 AM, Florian Fainelli wrote:
> Hi Arnd, Olof,
> 
> On 12/23/2021 13:31, Arnd Bergmann wrote:
>> I'm sending out the pull requests for 5.17 early, as I won't have
>> access to
>> my workstation for the next two weeks. With only 760 non-merge commits,
>> this again feels quieter than the massive previous merge window, but the
>> number of changed lines was actually slightly higher.
>>
>> There are very few changes aside from devicetree patches, most of
>> which are for the i.MX, Tegra, Qualcomm, Apple, K3 and Aspeed
>> platforms.
>>
>> We have a couple of new SoCs in existing families:
>>
>>   - Qualcomm Snapdragon 8 Gen1
>>   - Qualcomm Snapdragon SDX65
>>   - NXP i.MX8ULP
>>   - Texas Instruments j721s2
>>   - Renesas R-Car S4-8
>>
>> The time between product announcement and kernel support is fairly short
>> for all of these, which is nice. In particular the two Snapdragons
>> were only
>> announced this month and are the current high end of Qualcomm's products.
>> On the other end of the spectrum, we also add support for ST SPEAr320s,
>> which was launched 10 years ago.
>>
>> Aside from the Arm chips, there is also a pull request for a new
>> RISC-V SoC,
>> the Starfive JH7100, including some of the basic drivers to make it boot.
> 
> There seems to half of the submitted Broadcom SoCs pull request missing
> in this one, was there issues with those below:
> 
> defconfigs:
> 
> https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-1-f.fainelli@gmail.com/
> 
> https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-2-f.fainelli@gmail.com/
> 
> 
> drivers:
> 
> https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-5-f.fainelli@gmail.com/
> 
> 
> Should I resend or fix something in those? Thanks!


Arnd, Olof, do I need to resend the 3 pull requests mentioned above?
Thanks and happy new year.
-- 
Florian
