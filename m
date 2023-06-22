Return-Path: <SRS0=0Aq4=CK=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB87EB64DC
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 01:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57338C433C8; Thu, 22 Jun 2023 01:42:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5234DC433C0;
	Thu, 22 Jun 2023 01:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5234DC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b505665e2fso1064585ad.0;
        Wed, 21 Jun 2023 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687398150; x=1689990150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPACPjybs01Q+xtyqR1I7Lb0wmi+vfdHQMuD/c6ZGUE=;
        b=bngSy2EBWoU3OeFsbDA+eyJ5e2IYxEDNg12uoa7PlUI0k8k6aI5VRD3Pjad75jQBfB
         N6bZC+GjRkhJs8OllpcuGGEJdPgdg8FHLnVVOAhmoua4nCRnmPBtC67AwLMr80VOwiW3
         miAqh5Yajefq+VI0WW7l6jpVV3fN3vCn7OPgcq6CiqkwxhoiMygvoOKrHMbnVwhTpIZO
         Z9KCFWS2oh6ts+4twaRTWE/n9zYvRRmqp4BWQiD+XtQynCaXhcbHtvJEV3fWEBkhM2zb
         u48adqL89CNvtY5RXq+mADj0zpsWYqgXwvQpVecOOwvw/c5KBfS18FRVmkQhJafCT/dy
         m8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687398150; x=1689990150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPACPjybs01Q+xtyqR1I7Lb0wmi+vfdHQMuD/c6ZGUE=;
        b=Dk6vdtfuk5166gF6/ozWCdYJVRq6xuqo0EiDNkE2OX/RvtAAhnBH0BJQFkqsFoSkMb
         0xvOkLtn5q8kU6f3YbLWyrhPfpUXSe827/JX5DzwGjoZ7sppW08m6I0kDn8ksJmv2Z00
         d6ddH5+MOoECSGhXuhVBNDow4bWNCRu2nit7FIYJij7RUpxA0kNQxXPfbjeVtgXdaj+n
         +ihwG/YG3RInr1AgrtAUsFwXwXLPL5dB20n69rO6F06yI2jKGaVYMPZmi+U+0NhzBDwu
         FFZzgSDx/goAiO1+7sAKV0zcJFGIyxBPH4zeBSqNO/hx4cHw8Z6QfxNeWkFCHwoMnoKA
         2j3A==
X-Gm-Message-State: AC+VfDzT+MBmfnZEmRjmnCnlIyXfD5Sg8l7asQX7iz+5VgbfH36FqZPq
	nWm9XvBKBGXLhMorspZo5KgBaTyQ3Bg=
X-Google-Smtp-Source: ACHHUZ5Ff+IphUW2rYFGb2whpUNS3ECx0FQJgwQ/+Sw++jToh5zX/zQLKACFbnhzounRrYJv0N6QpA==
X-Received: by 2002:a17:902:bc43:b0:1b6:8233:6f5c with SMTP id t3-20020a170902bc4300b001b682336f5cmr6683859plz.19.1687398150365;
        Wed, 21 Jun 2023 18:42:30 -0700 (PDT)
Received: from [192.168.1.101] (1-160-168-200.dynamic-ip.hinet.net. [1.160.168.200])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001b3d6088993sm4118057plf.24.2023.06.21.18.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 18:42:29 -0700 (PDT)
Message-ID: <19e93057-46e4-1578-9e3e-138bd09cccfc@gmail.com>
Date: Thu, 22 Jun 2023 09:42:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] clk: nuvoton: Add clk-ma35d1.h for driver extern
 functions
To: Arnd Bergmann <arnd@arndb.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230621031605.234149-1-ychuang570808@gmail.com>
 <20230621031605.234149-2-ychuang570808@gmail.com>
 <69c742e5-3270-4b1c-be31-1552d877677e@app.fastmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <69c742e5-3270-4b1c-be31-1552d877677e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/6/21 下午 10:22, Arnd Bergmann wrote:
> On Wed, Jun 21, 2023, at 05:16, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> Moved the declaration of extern functions ma35d1_reg_clk_pll() and
>> ma35d1_reg_adc_clkdiv() from the .c files to the newly created header
>> file clk-ma35d1.h.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>
>>   #define PLL_MAX_NUM		5
>> @@ -20,19 +22,19 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>>   #define REG_CLK_PWRCTL		0x00
>>   #define REG_CLK_SYSCLK0		0x04
>>   #define REG_CLK_SYSCLK1		0x08
>> -#define REG_CLK_APBCLK0		0x0C
>> +#define REG_CLK_APBCLK0		0x0c
>>   #define REG_CLK_APBCLK1		0x10
>>   #define REG_CLK_APBCLK2		0x14
>>   #define REG_CLK_CLKSEL0		0x18
>> -#define REG_CLK_CLKSEL1		0x1C
>> +#define REG_CLK_CLKSEL1		0x1c
>>   #define REG_CLK_CLKSEL2		0x20
>>   #define REG_CLK_CLKSEL3		0x24
>>   #define REG_CLK_CLKSEL4		0x28
>> -#define REG_CLK_CLKDIV0		0x2C
>> +#define REG_CLK_CLKDIV0		0x2c
>>   #define REG_CLK_CLKDIV1		0x30
>>   #define REG_CLK_CLKDIV2		0x34
>>   #define REG_CLK_CLKDIV3		0x38
>> -#define REG_CLK_CLKDIV4		0x3C
>> +#define REG_CLK_CLKDIV4		0x3c
>>   #define REG_CLK_CLKOCTL		0x40
>>   #define REG_CLK_STATUS		0x50
>>   #define REG_CLK_PLL0CTL0	0x60
> This part of the patch does not relate to the decription, it
> looks like a minor cleanup that should be a separate patch.
>
> The actual change looks good and required, but I can't apply it
> if it's mixed with unrelated changes like this.
>
>      Arnd

Dear Arnd,


Thanks for the advice.

I will extract the unrelated parts from this patch and create another 
patch for them.


Best Regards,

Jacky Huang


