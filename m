Return-Path: <SRS0=wYdx=RJ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B292FC433F5
	for <soc@archiver.kernel.org>; Fri, 24 Dec 2021 17:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 678DBC36AEA; Fri, 24 Dec 2021 17:11:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B027BC36AE5;
	Fri, 24 Dec 2021 17:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B027BC36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id 196so8167372pfw.10;
        Fri, 24 Dec 2021 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1AGcBsnzvy5lyVMqgyfzAtPvXS7sOctvHHP5fe6m0Vk=;
        b=gvGi9kDjBlHdfCwbY2/Ul+0imv8s6dTjZpjxEobKK61pD27Xp5W40n8Jg9IeNjzjxR
         8v24Nbq7MF17PpPtu2lXhu3x9sXZ7Vg67L1MjDferOmju9qWwg1tc5Evft++FtrAH1mt
         KUUj/zzoR4GtuF8OHR8W+GtQlYZedvq2ZapZEBtnWF7Vz8txDmVPpvGkVPifDvigHuMJ
         r8NKIUMV7LDzY5bhelLQGKFZ//1QC6Li00hOXmitWDpRtra0vJHUZEYh9N1w1fGU/TJT
         xP1IjIJ3hVE5GCaSBdichn4B+Jn+371z0ffLg0Y09dbT24HPvXh2QuJvw6KtKyfK+sFw
         ICWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1AGcBsnzvy5lyVMqgyfzAtPvXS7sOctvHHP5fe6m0Vk=;
        b=zIQAh3wlw9xROoZuujFqU7VuOAs7mQS02uxPG2hIlUuZ+3f1ZxxpmHAfMVkju/cd2E
         Dv0C9+5sg+jj14oydWbMj+yKLxAxibSxoBoFHwvzZIFSO7Nr+504Wozsd4pKImP6lTZm
         5boOZOmT2eLGbUd7NaoqKmql8cioN6RGfrNATV1bb2l246f2X0OmpyTSu2IT+KKXtk9Y
         1tA7ebvSoDgBYvC8zoSRXeF8fNgB/4n/R8TeSuGPeaK/XMu/tVR8TF0bXPr6UajkbEyr
         8ULeXjfzR4w807McRWAqjFEr6qHtGzry9ZH0dZi0ZztVTGezN4Tl0MG5PGzFJe1F9YBY
         qH4Q==
X-Gm-Message-State: AOAM532JHx2hg3iDOEq+FJ/TYRE6QM6rGXx3PmFr22176I/udiDTGnAV
	21RPxjU+MGuASvPVtWbfDLCJ3LeKQ0o=
X-Google-Smtp-Source: ABdhPJzZ1vyB3OCSJEQ/BQzyEkEkQF25dIlgc8xh3ERnuBsBfZMeJ91Qw3UGMMuEse41Lf4HEj+V6w==
X-Received: by 2002:a62:6dc2:0:b0:4af:98e:1d3b with SMTP id i185-20020a626dc2000000b004af098e1d3bmr7691497pfc.52.1640365901764;
        Fri, 24 Dec 2021 09:11:41 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:4a48:81cd:f5a9:7f89:a39c? ([2600:8802:b00:4a48:81cd:f5a9:7f89:a39c])
        by smtp.gmail.com with ESMTPSA id p13sm1685987pgl.23.2021.12.24.09.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Dec 2021 09:11:41 -0800 (PST)
Message-ID: <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com>
Date: Fri, 24 Dec 2021 09:11:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd, Olof,

On 12/23/2021 13:31, Arnd Bergmann wrote:
> I'm sending out the pull requests for 5.17 early, as I won't have access to
> my workstation for the next two weeks. With only 760 non-merge commits,
> this again feels quieter than the massive previous merge window, but the
> number of changed lines was actually slightly higher.
> 
> There are very few changes aside from devicetree patches, most of
> which are for the i.MX, Tegra, Qualcomm, Apple, K3 and Aspeed
> platforms.
> 
> We have a couple of new SoCs in existing families:
> 
>   - Qualcomm Snapdragon 8 Gen1
>   - Qualcomm Snapdragon SDX65
>   - NXP i.MX8ULP
>   - Texas Instruments j721s2
>   - Renesas R-Car S4-8
> 
> The time between product announcement and kernel support is fairly short
> for all of these, which is nice. In particular the two Snapdragons were only
> announced this month and are the current high end of Qualcomm's products.
> On the other end of the spectrum, we also add support for ST SPEAr320s,
> which was launched 10 years ago.
> 
> Aside from the Arm chips, there is also a pull request for a new RISC-V SoC,
> the Starfive JH7100, including some of the basic drivers to make it boot.

There seems to half of the submitted Broadcom SoCs pull request missing 
in this one, was there issues with those below:

defconfigs:

https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-1-f.fainelli@gmail.com/
https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-2-f.fainelli@gmail.com/

drivers:

https://lore.kernel.org/linux-arm-kernel/20211221220642.2862218-5-f.fainelli@gmail.com/

Should I resend or fix something in those? Thanks!

Happy holidays!
-- 
Florian
