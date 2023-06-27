Return-Path: <SRS0=DfK5=CP=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5FDEB64D9
	for <soc@archiver.kernel.org>; Tue, 27 Jun 2023 05:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 740A4C433C0; Tue, 27 Jun 2023 05:43:10 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83253C433C9;
	Tue, 27 Jun 2023 05:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83253C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3fde00693cfso39006571cf.3;
        Mon, 26 Jun 2023 22:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687844588; x=1690436588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKo4W7yeVNu1/C75Wi6h0MFNDHB4xFJdmLBXdnRsVKo=;
        b=RyRXq14W4/8lRHOCke/kDWvwcUpR/VkJS8e5oOB4Gl5EswXMKT93tcDlED1l+RLIGc
         ZI+ogkEOu33E2WrqVUrBYGo3s1HHjWNEkrhG4aprg1gPhHgSK/uggsYFZCiqWn0vdvIC
         bbCOuGS4VVDwLDexyZO2Jddxwh3u5eB04ixQqkSiOlUyS3FE/ws0OQX9QMH9hMznYcSD
         n+muYefqFKOTgGuTZmVpfVgC6/1XIiaAtUh4bcRy3VXYD00LSAQDXwlheSDYN6CADP2F
         eYnjpom+0IbA9ruXfgfMgcTtrVKSOfciyEJqy2apGSjPYkfxh5YeEDIuzRdxdmhhb0L/
         frig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844588; x=1690436588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKo4W7yeVNu1/C75Wi6h0MFNDHB4xFJdmLBXdnRsVKo=;
        b=ju4B10l+oicRuxWOtK+J2zu1VeRG8F9oaWPlI2sy4JPAQsonVt+j3no8ziUlHP+z8E
         fW5AfyShyOuY56NCDj6cKzE8yE08fqb+sUxGcsV8ZqK+jmYURYlOCBCBbpsP4eylP1yz
         gCcNQQGukRFren7IMp1ZeSZ93xhS4EHGFoq8QSJ2cTSbUPfe/x18SpvXXlmR5H+QlP2m
         r99KKmJIxtogZbaJOspTO/RZDNPYeujY4prtGGGjTJseGN87zsiOfak7/ve6BEFAPZOW
         mJVIpoARzhqz8chXDIly/UO0/b/xlR/l5D3+9wieg7Eu5Q5e/N4el8uiDTwygptkb/OI
         alaA==
X-Gm-Message-State: AC+VfDzB46OjiPjhtrvs3L04NFQ27UjXwz+W7r5dg8mn5GiAwneGUtwc
	J4Z9dBMW0RjQSiu/FjI8TrKR7o1j+jk=
X-Google-Smtp-Source: ACHHUZ5avhtwTCxoBLwAvnHkv2/ud6DupY9bk0Y8ddk25e+Brsx8E//Abj/lVUnxyL/g2ex0hIiGcg==
X-Received: by 2002:a05:622a:4cc:b0:3fd:e9cc:79d1 with SMTP id q12-20020a05622a04cc00b003fde9cc79d1mr29922201qtx.56.1687844587776;
        Mon, 26 Jun 2023 22:43:07 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j3-20020a635943000000b00553b546a638sm4932709pgm.67.2023.06.26.22.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 22:43:07 -0700 (PDT)
Message-ID: <32ae28ae-ef53-092e-6fb4-5f95fc306dde@gmail.com>
Date: Tue, 27 Jun 2023 13:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] clk: nuvoton: Use clk_parent_data instead of
 string for parent clock
To: Stephen Boyd <sboyd@kernel.org>, arnd@arndb.de,
 gregkh@linuxfoundation.org, mturquette@baylibre.com
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230622141343.13595-1-ychuang570808@gmail.com>
 <20230622141343.13595-4-ychuang570808@gmail.com>
 <be147a766979642ac518710e6ff99a11.sboyd@kernel.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <be147a766979642ac518710e6ff99a11.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/6/27 上午 12:09, Stephen Boyd wrote:
> Quoting Jacky Huang (2023-06-22 07:13:43)
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> For the declaration of parent clocks, use struct clk_parent_data instead
>> of a string. Due to the change in the passed arguments, replace the usage
>> of devm_clk_hw_register_mux() with clk_hw_register_mux_parent_data() for
>> all cases.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1.c | 306 ++++++++++++++++++++++---------
>>   1 file changed, 219 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
>> index 733750dda0f4..f1fe7edd21b5 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>> @@ -63,167 +63,298 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>>   #define PLL_MODE_SS             2
>>   
>>   static const struct clk_parent_data ca35clk_sel_clks[] = {
>> -       { .index = 0 },  /* HXT */
>> -       { .index = 1 },  /* CAPLL */
>> -       { .index = 2 }   /* DDRPLL */
>> +       { .fw_name = "hxt", },
>> +       { .fw_name = "capll", },
>> +       { .fw_name = "ddrpll", },
> Is there any reason why this changed from numbers to strings? It is
> faster to directly index vs. access the clock-names property. The
> preference is to use the index field and only use fw_name if we're
> migrating legacy clk drivers to use DT based lookups.

This is simply because I think strings are more readable than numbers.
Since using an index is the preferred method, I will change all occurrences
of ".fw_name" to ".index" and add comments to describe it.
As this patch was applied, I will create another patch relative to this one.


Best Regards,
Jacky Huang


