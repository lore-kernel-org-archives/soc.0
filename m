Return-Path: <SRS0=2H7l=B2=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D9C77B73
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 00:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2336C4339B; Tue,  6 Jun 2023 00:22:36 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DAC6C433EF;
	Tue,  6 Jun 2023 00:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DAC6C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64d24136685so3975143b3a.1;
        Mon, 05 Jun 2023 17:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686010955; x=1688602955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xsgi8h0/gWbwF/9vxde8zYt2yWPTotfNJ3hd15YXYw=;
        b=fuyd1QkftQjaqBgJCR7pHQRV/4mS4JsaAK4dIpl+5VpJhDUVO1HOudY2aIOZ0A1i1w
         9NU3tkUtk3xluoT9FCveO/2tKXzBZT5Q6muks0cczHutINSj9X/j4n0YAriBqHvc90kO
         XHg/94rTB1tmxyuVxlQ8i1Jkxp2rSGBtdo4UBBbKeoxj0pwZKl0zCL6/JH6nN5lBvzQ6
         4to+8MHTaR82zAr8fs+0aUdB+yZ/i/9NUJThQgwSMGAOD8q84UtRFp3h+8/qFAL0ENka
         zYMt0zBGOqH0mIjTlp/FO18RLHYbbGHwmVWSPrDfn/Z6Br/QKp+aZ8Vo1Pifh6Psr1ld
         KEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686010955; x=1688602955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xsgi8h0/gWbwF/9vxde8zYt2yWPTotfNJ3hd15YXYw=;
        b=ipjRI9dVZNkHCtRVFnkP1jYzFjU9ofwdOd5XfLxDVXmI1Sri7EEzuqGKYuuyDsEq3c
         jIuv9cXF2z5a6BmzCKL084bFfUWZteJTMCwKAI5Sb91RalbkwK9UoNLxD4zXAgR2v8xT
         FyPx/FvXkVvfO/9FJYDwM8tjRTBELQ8yTAJejxc7CbeLwvIDwnGxYBkSQMiP/g6NO8BZ
         Ds+I4wIIbxFo5Jc9YbP2x6qA+OvDMz151cB4iFKmD0PL5NBWQbP1LGsYPMV9TIRKN6Le
         Bdtb/XLvEpNOBump9HJvvjSRkrB7xuvcG0OOe9OS8t6PnN52DaRf9YcAHIyge77DfoB2
         gcNA==
X-Gm-Message-State: AC+VfDzkINS8aii24sURSheAw1kMMRsC3GyHEHwC0CgzFwQMTAkNF1Rf
	ezCYe4KDZprhjGHY1gRhA+c=
X-Google-Smtp-Source: ACHHUZ6+u5JzbxQeAVeBqh6J0AJPG7UMhOouIcY6ORewRrgw1dtexSbLmRI8wYvz7xH+jnmPS7rbOA==
X-Received: by 2002:a05:6a00:1c92:b0:64d:42b9:6895 with SMTP id y18-20020a056a001c9200b0064d42b96895mr1158644pfw.5.1686010954559;
        Mon, 05 Jun 2023 17:22:34 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0064389eab4c8sm5664113pfo.126.2023.06.05.17.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 17:22:34 -0700 (PDT)
Message-ID: <c57453ce-341c-ef89-5e71-58ad63466b11@gmail.com>
Date: Tue, 6 Jun 2023 08:22:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 00/10] Introduce Nuvoton ma35d1 SoC
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Lee Jones <lee@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, soc@kernel.org, schung@nuvoton.com,
 mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
 <9dc45c49-02aa-4e63-a176-97e3536f14f4@app.fastmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <9dc45c49-02aa-4e63-a176-97e3536f14f4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/6/5 下午 08:00, Arnd Bergmann wrote:
> On Mon, Jun 5, 2023, at 06:07, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> This patchset adds initial support for the Nuvoton ma35d1 SoC, including
>> initial device tree, clock driver, reset driver, and serial driver.
>>
>> This patchset cover letter is based from the initial support for Nuvoton
>> ma35d1 to keep tracking the version history.
>>
>> This patchset had been applied to Linux kernel 6.4.0-rc5
>> and tested on the Nuvoton ma35d1 SOM evaluation board.
>>
>> (ma35d1 information:
>> https://www.nuvoton.com/products/microprocessors/arm-cortex-a35-mpus/)
>> MA35D1 porting on linux-5.10.y can be found at:
>> https://github.com/OpenNuvoton/MPU-Family
>>
>> v13:
>>    - Modify serial driver
>>      - Added a check for oops_in_progress in ma35d1serial_console_write to
>>        determine whether to perform the spin_lock.
>>      - Rebased drivers/tty/serial/Kconfig and recreate the patch
>>      - Rebased MAINTAINERS and recreate the patch
> Hi Jacky,
>
> This is looking good to me, thanks for getting it this far.
> I see all patches aside from the last one have been reviewed by
> at least one person. The clock driver is still missing an Ack
> from the clk maintainers, but I see that you have addressed
> Stephen's concerns from an earlier review round, so I expect
> this to be fine.
> Stephen, let me know if you have any final concerns about this driver.
>
> The serial port driver was still getting some last changes, so
> I only picked up the binding but not the driver here. If Greg
> and Jiri are happy with this version, I'd prefer to just add
> this with their Ack as well, otherwise please send only that
> patch for any follow-up revisions. If you can finish this
> before the linux-6.5 merge window, I'd add it on top of the
> other patches, otherwise it should just go through Greg's
> tree.
>
> If anything else should come up, let's handle this as patches on
> top of the branch I have now pushed in [1], no need to resend
> these.
>
>        Arnd
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=nuvoton/ma35d1

Dear Arnd,

I'm glad to see that these patches have finally been accepted.
Thank you very much for all the assistance you have provided.
Once the device tree is merged, we will start submitting drivers
such as pinctrl, gpio, rtc, and so on.


Best Regards,
Jacky Huang





