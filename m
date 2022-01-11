Return-Path: <SRS0=X96t=R3=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83188C433FE
	for <soc@archiver.kernel.org>; Tue, 11 Jan 2022 00:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 403FDC36AE5; Tue, 11 Jan 2022 00:19:04 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57667C36AE9;
	Tue, 11 Jan 2022 00:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57667C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id 131so17382044qkk.2;
        Mon, 10 Jan 2022 16:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RUJ7uJMEeEhsJoqBp40ayA1X7yhjrJAzeMDsVRChGZU=;
        b=S6pPOW4QL+gADjyZhSQ9f0IUmKgK/8rGcICxVWY1hIAGpa9wuBatdW6lYt1nEa0UlE
         mDzKqhzoatwOPQwaPvreH7iQp9mB2vEeDnF6pXl7puDwL/xce+DDcFsms2WRLYOas/TD
         z5h2BTDCmUp2v05SCtkfsbRUG9lktvgSfu1Lb5LCWxHvRohz6t7ZZ3dPDgfgwa76c5n0
         Fasnpn8H5S8L3AIu+Zn/B+ZDCqccxHbtlNyVwJ3WdjyILO9wp2+55cnmP25l9T5IIWPg
         rwbqOazU/Am/6t184ernOkHTgmCVWVzyCmr9XGSWVlLWmnbuBIA9b+ibXunj77DMUeoc
         RYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RUJ7uJMEeEhsJoqBp40ayA1X7yhjrJAzeMDsVRChGZU=;
        b=DNDGZc3HNGdNEyBZdWGChBDrx4prW/ZOfMvExfqptS/eVSaTWyOSHEVP3nH92KlVJ/
         /+IJ3NLE+N7bUaqvooWx2EQ6B3er3vWrV9oeeJrSfikKxzDaLVnAcPtJcL2tqeyNCo16
         djOxiT++LEOhUFBfdShPpiaychFP+Mrec0k7hgKfdOwnBkG6BXwWiyTK11kkqWT4qEYy
         kHoYTKNjA8QnI/iPtctwV8BZvFmBV7ysWe6uHY5cXgZhkIFsOESAcar1wOIbY4W7fJuM
         RpPRXOO1ON5K6FU9kmjnoMA2SBBBGsIZqGTZF6WTRocT/lhJpzBlzSLcGWcyTel44Vuq
         18mg==
X-Gm-Message-State: AOAM532df24u8zdE0SnhDUuTLqZOy4EFda81AHeRRggRmwkaQoKkbLMs
	x7G0CZYjFxTqsO9AXcdOnxI=
X-Google-Smtp-Source: ABdhPJwa41EczwvAQUKQdQ5jTpSkuQyZia7x61pNiOQzsbpG8FVGVnyZLnHaVs6mR7StpIpb0pY1mQ==
X-Received: by 2002:a05:620a:2942:: with SMTP id n2mr1665704qkp.340.1641860342256;
        Mon, 10 Jan 2022 16:19:02 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a3sm5784796qtx.66.2022.01.10.16.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 16:19:01 -0800 (PST)
Message-ID: <baa991a5-31d8-80fb-faf0-b443626030d4@gmail.com>
Date: Mon, 10 Jan 2022 19:18:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 5/7] clk: imx: Add initial support for i.MXRT1050 clock
 driver
Content-Language: en-US
To: Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
 <20220103233948.198119-6-Mr.Bossman075@gmail.com>
 <20220105235157.8ED80C36AEB@smtp.kernel.org>
 <89046151-e44e-6828-ad76-8574fba4fca8@gmail.com>
 <20220110201201.C1E37C36AE9@smtp.kernel.org> <Ydy3qvT5w6IWnR7s@abelvesa>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <Ydy3qvT5w6IWnR7s@abelvesa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/22 17:48, Abel Vesa wrote:
> On 22-01-10 12:12:00, Stephen Boyd wrote:
>> Quoting Jesse Taube (2022-01-09 11:07:42)
>>>>> +
>>>>> +       clk_hw_data->num = IMXRT1050_CLK_END;
>>>>> +       hws = clk_hw_data->hws;
>>>>> +
>>>>> +       hws[IMXRT1050_CLK_OSC] = __clk_get_hw(of_clk_get_by_name(np, "osc"));
>>>>
>>>> Use clk_parent_data instead and reference the binding name with .fw_name
>>>
>>> Hi Stephen, sorry to bother you again.
>>> I'm wondering if adding `clk_parent_data` is necessary as it seems like
>>> it wold be a big change and the other IMX boards haven't implemented
>>> this yet would it be okay if I don't do this, or if it is necessary
>>> could you link to a patch set to change it.
>>>
>>
>> Is it a big change because the imx_clk_hw*() APIs aren't prepared for
>> non-string parents? Can you make some clk_parent_data based APIs and
>> migrate things over gradually? This is really a question for i.MX folks
>> to see if anyone is working on moving away from the string names.
> 
> I'm currently looking into it. I would suggest we take this patch as is
> and I'll switch it later on to clk_parent_data.
Thanks so much that would be great!

Should I sent the other changes requested I have them ready? Or should i 
wait.

Best regards
	Jesse Taube
