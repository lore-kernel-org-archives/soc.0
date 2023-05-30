Return-Path: <SRS0=ckCh=BT=gmail.com=jirislaby@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578E4C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 05:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F420BC4339C; Tue, 30 May 2023 05:35:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6983C433D2;
	Tue, 30 May 2023 05:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6983C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-96fb45a5258so749846166b.2;
        Mon, 29 May 2023 22:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685424950; x=1688016950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cV4g2QqFAx0Qg2GEdFeROXzdUlE1iPO7BwJG8HSPHco=;
        b=Bbx+yCTGf1x/jhTa5Sgh+fYtLZskuBbmXZ9ltU+JRCbRVoOqpIcTBzrBSdNo73Splg
         aEi7DWx1P15mJK3UC4Wm6GvvltXP6cRsVf95J5ugLnr6HAtTs44xlmvFgCOTFaWiOTz/
         vyFMgw1/rSuqJJbzgtUSMhD+ywwzGiQsG0fxKM3UvloDPDvTmheUSBrRfTKsUp14d+ly
         kmnmBH8Pn4d/p36qPCZi+N/3/so4U/Y8ZpvoD6WHaKol0ZreHMWtZzox13CMY7dd5Mu1
         W3fY2Y9XS6Nv+vwdWi78HCnRlsbFgQ0MTXWGRBQ5RsiNfrSiyE50aE7bedBoeNvwBOob
         KjjA==
X-Gm-Message-State: AC+VfDyImnHPEpszmPJwnYYLIW0Ra5AKJI9FKL+VTjtAaEUCpDV5q1DP
	0a1BqOuDiQklmnlD+weRZmI=
X-Google-Smtp-Source: ACHHUZ7d//vbJPuMcuuguqHEIhsa256pT0itLFARVDscaeij15+LBFgsDcQeytTG/QPiy2HgYWfrWQ==
X-Received: by 2002:a17:907:3f1c:b0:970:d85:59e9 with SMTP id hq28-20020a1709073f1c00b009700d8559e9mr1267463ejc.5.1685424949500;
        Mon, 29 May 2023 22:35:49 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id j23-20020a17090643d700b0095850aef138sm6829336ejn.6.2023.05.29.22.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 22:35:49 -0700 (PDT)
Message-ID: <75747efd-2bfd-d1db-42d9-7a6c90240475@kernel.org>
Date: Tue, 30 May 2023 07:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v11 10/10] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 tmaimon77@gmail.com, catalin.marinas@arm.com, will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
 schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230516075217.205401-1-ychuang570808@gmail.com>
 <20230516075217.205401-11-ychuang570808@gmail.com>
 <3d4acb20-c80e-fd39-c0d0-e9b1e0309d81@kernel.org>
 <aaef529f-69dc-8bec-0ae1-959a1ede87e0@gmail.com>
 <c9493f4d-8056-20a0-6ed2-161fbcc3d34e@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <c9493f4d-8056-20a0-6ed2-161fbcc3d34e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 30. 05. 23, 3:09, Jacky Huang wrote:
>>>> +
>>>> +    if (options)
>>>> +        uart_parse_options(options, &baud, &parity, &bits, &flow);
>>>> +
>>>> +    return uart_set_options(port, co, baud, parity, bits, flow);
>>>> +}
>>>> +
>>>> +static struct console ma35d1serial_console = {
>>>> +    .name    = "ttyNVT",
>>>> +    .write   = ma35d1serial_console_write,
>>>> +    .device  = uart_console_device,
>>>> +    .setup   = ma35d1serial_console_setup,
>>>> +    .flags   = CON_PRINTBUFFER | CON_ENABLED,
>>>> +    .index   = -1,
>>>> +    .data    = &ma35d1serial_reg,
>>>
>>> I don't see console->data used anywhere in the driver?
>>>
>>
>> I will remove it.
>>
> 
> I removed the " .data    = &ma35d1serial_reg", but kernel crashed in 
> 'drivers/tty/serial/serial_core.c'.
> 
> The variable 'p' of  uart_console_device() refer to a NULL, because 
> co->data is NULL.
> As a result, kernel crashed at 'p->tty_driver'.
> 
> struct tty_driver *uart_console_device(struct console *co, int *index)
> {
>      struct uart_driver *p = co->data;
>      *index = co->index;
>      return p->tty_driver;
> }
> 
> We seem to be unable to remove it.
> If there are no other considerations, I will keep it in the next version.

Ah, yeah. Sorry, my bad.

-- 
js
suse labs

