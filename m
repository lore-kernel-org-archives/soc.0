Return-Path: <SRS0=ZqyG=CB=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68016C7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 10:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32A16C433EF; Tue, 13 Jun 2023 10:58:40 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 029D3C433D2;
	Tue, 13 Jun 2023 10:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 029D3C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-665a18f5643so1199987b3a.0;
        Tue, 13 Jun 2023 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686653918; x=1689245918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g816wKmTzjGrsMqAUO96nczc9ajLi9Tce0NGl/fCFGM=;
        b=Nu8qTTKGvJQqvV1LFAeRfPJhXuBfvDyjaBCqv6/J8ihQx4ErFwpT+047weYG2+iFYa
         lHUm9xjeseq1+ysAJl/Y8C0Vl11j3LrsdANbT9H4oHxCpUhBNggO2orPCLMQgy9/VuKg
         6+gt+nIuugGRZjCmr+fJNT+UmzsOk0YQ2ZpRWZE/ZtbM+6SnH82QRO81oaSRSKXkNzYC
         7Wc0u4omCGYmr12liRAxIqVvNpV9Fm53sn1hSUpaYV/t25MPsE2SqZj1bruTYodjVou+
         l/hINNGMkv6ba6ui+DaBcZXCYlXHJPzfON9UDqdSZ2nBjnS+4dAGuh+61my3+yK6QBN/
         mPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686653918; x=1689245918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g816wKmTzjGrsMqAUO96nczc9ajLi9Tce0NGl/fCFGM=;
        b=Um+bBwGC8hH9GxJhVa7yRMuacqd0S8AqIMwDAQr8CbPl+RN94uqxGcEiubhHIIeETa
         sKYv7koY+sg5nyskGvHTYpqbCjrEZljoPmq7lcw3yy1DZwcuXFUentEYntvQ52jbR73s
         NZqxR0UoYvTz9xCaOZepMiNpjMu/IlFpQV9uKMSrD14YSkKGXe4Yo6KHQGRlOUyvljNH
         rRYdfBjcAx9V5hqTHOMB4O8a87cBs10E4i77eUmu/VmO5DDUWuaOLNCu79pNa7hz6v1M
         RjiVLLpW7NAp+gq0ObfdbghJ1jWu1EpyqtE/nYfpz81poJqjy1yd9GSCCWyb+3Bhaptj
         jQXQ==
X-Gm-Message-State: AC+VfDyR0LmR2JRSU3b/aWtXIQkXZ8I+BUPaxT0tmEo1cfKSf/gB/k9Z
	PHwD/qBZJH5hQMolnhTZgi4=
X-Google-Smtp-Source: ACHHUZ7I0b/NZGw98SSO8yJUQN29EI2VL52PVwFx8ph3ohep3LgKkFRLoYXYQg4146/Vf2KJ3gceJQ==
X-Received: by 2002:a05:6a20:3c8d:b0:101:1e75:78e with SMTP id b13-20020a056a203c8d00b001011e75078emr17197706pzj.14.1686653918142;
        Tue, 13 Jun 2023 03:58:38 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s15-20020a65644f000000b00543bfe33fedsm8349191pgv.20.2023.06.13.03.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:58:37 -0700 (PDT)
Message-ID: <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>
Date: Tue, 13 Jun 2023 18:58:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
 schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061338-lunchbox-snorkel-e6a9@gregkh>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <2023061338-lunchbox-snorkel-e6a9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Greg,


On 2023/6/13 下午 06:28, Greg KH wrote:
> On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> This adds UART and console driver for Nuvoton ma35d1 Soc.
>> It supports full-duplex communication, FIFO control, and
>> hardware flow control.
> You get a full 72 columns for your changelog :)
>
>> --- a/include/uapi/linux/serial_core.h
>> +++ b/include/uapi/linux/serial_core.h
>> @@ -279,4 +279,7 @@
>>   /* Sunplus UART */
>>   #define PORT_SUNPLUS	123
>>   
>> +/* Nuvoton MA35 SoC */
>> +#define PORT_MA35	124
>> +
> Why is this change needed?  What userspace code is going to rely on it?
>
> thanks,
>
> greg k-h

Because the serial driver requires a port->type, and almost all serial
drivers defined their port type here. We follow the practice of most serial
drivers here.
If we don't do it this way, we would have to directly assign a value to
port->type. However, such modifications were questioned in the past,
which is why we changed it back to defining the port type in serial_core.h.


Best regards,
Jacky Huang




