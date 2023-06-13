Return-Path: <SRS0=ZqyG=CB=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A050BC7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 02:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81A62C4339B; Tue, 13 Jun 2023 02:20:00 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78BD9C433D2;
	Tue, 13 Jun 2023 02:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78BD9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-55ab0f777acso2938271eaf.1;
        Mon, 12 Jun 2023 19:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686622798; x=1689214798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Rc8puRsMNB1FwhvbPkjunTvdFQSMdNIDd9z2KyEZcY=;
        b=UkAIuPO4nfCvYOa1VJ1tK7XVbWnl1M1hYkZ6FaKYumVSAbsNQGAw4XzRXcAK2edeou
         5IAoEdSkabS7OOhcu+8RuwI5UVBzOgyveX6ek7QdbyJZsitqtqYsLk+tEwXiqJsUWgkv
         6hSJo/I0yJDTN+M0MxG7XUeZcP3sAE1RKNF6ZuWwz1P4YwLL2U7RFL8l+k144VshgBgo
         FcW2rd0s8Z7nl9JaEXKEdxzZFIuS/oBoDcgyrncNUuepa3er1cqe1n4dofeCv3yOnCt1
         emRx9Qzdm/IcLOyRKv0ufSW2wQgJJU3ZUtc3CLUMTSXFQlWTmic58/vDe3ycN0i8uYhO
         NXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686622798; x=1689214798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rc8puRsMNB1FwhvbPkjunTvdFQSMdNIDd9z2KyEZcY=;
        b=UWXe0MacQ+7WR/KkdxjG5cyVZgh85trhdJvbXAZLXEbdU4JfipjhACw14UW6tomLYw
         TChYo98RwYpCt56AvRjpqRYKHezhm8VPF0VKHJdZOCcSKgdzXKznWR2Dfv/JSeXt+5le
         tDJ8ZBnrSg+xWCN2yyzYXBKzBBtTY+GKbU6a5jCwJkwOT0eo0TGqeV5E8dTbSvBiXwL7
         MRh0p79QBN1Ru7CiDRKXfdKyPWunNHmVlDKvzd7UmH8FELFy+CVZfy4NuZXdCsgLZVli
         ISheRP9XnsMDUirn6MeE6H0J1g1h2N4ujnFgr024TJe9ZsAdjv8L41/1zU+PfVLzUqU+
         I7Qw==
X-Gm-Message-State: AC+VfDzddjKRx7FrldzL37urdg5+lR9lFaJlvSH9XTFmYDHtimB4FPpE
	KiJbuusXb+DFtrvtll92KP0zH9mIMQc=
X-Google-Smtp-Source: ACHHUZ4NUAZrRFfEixwJIufjYq1nC+yN5/3MPpGckOQqgAHxA7p/K+Zp1j/d7YD4R3hfhoAUKcWi/w==
X-Received: by 2002:a05:6358:cb1c:b0:129:c25e:1caf with SMTP id gr28-20020a056358cb1c00b00129c25e1cafmr4848634rwb.3.1686622797910;
        Mon, 12 Jun 2023 19:19:57 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 2-20020a630b02000000b0051b7d83ff22sm8127529pgl.80.2023.06.12.19.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 19:19:57 -0700 (PDT)
Message-ID: <8b0376be-fbee-f4ad-c0d8-f12471fab7ae@gmail.com>
Date: Tue, 13 Jun 2023 10:19:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 08/10] clk: nuvoton: Add clock driver for ma35d1 clock
 controller
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, catalin.marinas@arm.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, tmaimon77@gmail.com,
 will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
 schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
 <20230605040749.67964-9-ychuang570808@gmail.com>
 <bda5f640831a8080a83eca8c8e37c30d.sboyd@kernel.org>
 <233f4e83-e872-5499-2ca7-a1c277425fb0@gmail.com>
 <b4a20267862f6cd20d50016cb130ba95.sboyd@kernel.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <b4a20267862f6cd20d50016cb130ba95.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/6/13 上午 10:16, Stephen Boyd wrote:
> Quoting Jacky Huang (2023-06-12 18:37:31)
>> On 2023/6/13 上午 09:02, Stephen Boyd wrote:
>>> Quoting Jacky Huang (2023-06-04 21:07:47)
>>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> +                                           int num_pdata)
>>>> +{
>>>> +       return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
>>>> +                                              CLK_SET_RATE_NO_REPARENT, reg, shift,
>>>> +                                              width, 0, &ma35d1_lock);
>>>> +}
>>>> +
>>>> +static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
>>>> +                                    void __iomem *reg, u8 shift, u8 width,
>>>> +                                    const char *const *parents, int num_parents)
>>> Please don't use string arrays for parent descriptions. Everything
>>> should use clk_parent_data or direct clk_hw pointers.
>> I will use clk_parent_data instead of strings.
>>
> When you use clk_parent_data, just don't set anything for the "dummy"
> clks besides a -1 .index to indicate there isn't a parent for that
> entry.


Okay, thank you for the reminder.

Best Regards,
Jacky Huang




