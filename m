Return-Path: <SRS0=7pP/=CC=gmail.com=jirislaby@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61470EB64D8
	for <soc@archiver.kernel.org>; Wed, 14 Jun 2023 04:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E1CEC433CC; Wed, 14 Jun 2023 04:58:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD024C433C0;
	Wed, 14 Jun 2023 04:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD024C433C0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9768fd99c0cso50475566b.0;
        Tue, 13 Jun 2023 21:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686718680; x=1689310680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVqjech6rehqYVc76kP00nVY02sE+W+4Mbw+HMfqJs0=;
        b=KX9x7xXc1aXQ1ApMr2mpYsahzDzRERgROBIh1+u7ZsrbHmBWDdjnwNURLUsF/XN7b3
         iI/IVRGmbyFsE7Hq2A/SdNGxdciw5ag5X1NBbYSnVsnrzdoOQ4Ypc6UjDxEdHdi80xHE
         6EAaAhlMcoz7UxNh/6f6gAJEu9rTRAeX83y6JuXHPRfO7wXuPg3ESGicyWxCVy5gRBel
         /KxgFs6rFY+i1D42DpUdvipxMOwhNFthEOsN0qrIFt/z32SAZcYHjeCYLAMG5qCCCIL2
         iMAzeLEIw77VdWcXsoPUJF2MaqEgGlx8fzeB0N8ZrYeK1srMEegB1yBWojMHfuv8FEMo
         Daeg==
X-Gm-Message-State: AC+VfDyt2cUezxDdBERnRCVaGR1dlYghglJP90s3fGcAb8CzfUmyT0lE
	lrXbwVvbLDEhWqo6t/WZK70=
X-Google-Smtp-Source: ACHHUZ66MPHDLCxi4nWcCRjbBaPXVXW2hh68IAC/e+uTnvNGyZwoL0gPajf4l9a7mqMeV31MsL6ocQ==
X-Received: by 2002:a17:907:7e9a:b0:977:d468:827 with SMTP id qb26-20020a1709077e9a00b00977d4680827mr453941ejc.17.1686718679529;
        Tue, 13 Jun 2023 21:57:59 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id ha19-20020a170906a89300b0097d77a5f033sm5974327ejb.24.2023.06.13.21.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 21:57:58 -0700 (PDT)
Message-ID: <11b0f59e-7cca-1b50-9c34-f38e6b6fc0f9@kernel.org>
Date: Wed, 14 Jun 2023 06:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Tomer Maimon <tmaimon77@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, soc@kernel.org, schung@nuvoton.com,
 mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061338-lunchbox-snorkel-e6a9@gregkh>
 <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>
 <2023061356-matchbook-footwear-d142@gregkh>
 <35e768ad-7f15-48a4-9c38-09570026cf71@app.fastmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <35e768ad-7f15-48a4-9c38-09570026cf71@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13. 06. 23, 17:44, Arnd Bergmann wrote:
> On Tue, Jun 13, 2023, at 16:49, Greg KH wrote:
>> On Tue, Jun 13, 2023 at 06:58:32PM +0800, Jacky Huang wrote:
>>>
>>> On 2023/6/13 下午 06:28, Greg KH wrote:
>>>> On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
>>>>> From: Jacky Huang <ychuang3@nuvoton.com>
>>>>>
>>>>> This adds UART and console driver for Nuvoton ma35d1 Soc.
>>>>> It supports full-duplex communication, FIFO control, and
>>>>> hardware flow control.
>>>> You get a full 72 columns for your changelog :)
>>>>
>>>>> --- a/include/uapi/linux/serial_core.h
>>>>> +++ b/include/uapi/linux/serial_core.h
>>>>> @@ -279,4 +279,7 @@
>>>>>    /* Sunplus UART */
>>>>>    #define PORT_SUNPLUS	123
>>>>> +/* Nuvoton MA35 SoC */
>>>>> +#define PORT_MA35	124
>>>>> +
>>>> Why is this change needed?  What userspace code is going to rely on it?
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>> Because the serial driver requires a port->type, and almost all serial
>>> drivers defined their port type here. We follow the practice of most serial
>>> drivers here.
>>> If we don't do it this way, we would have to directly assign a value to
>>> port->type. However, such modifications were questioned in the past,
>>> which is why we changed it back to defining the port type in serial_core.h.
>>
>> I really really want to get rid of this list, as it's a UAPI that no one
>> uses.  So please don't use it, it doesn't help anything, and while the
>> serial driver might require it, it doesn't actually do anything with
>> that field, right?  So why don't we just set all of the values to the
>> same one?
> 
> I don't see how Jacky can come up with a patch to do this correctly
> without more specific guidance to what exactly you are looking for,
> after the last 123 people that added support for a new port got
> that merged.
> 
> I checked debian codesearch and found only three obscure packages that
> accidentally include this header instead of including linux/serial.h,
> a couple of lists of all kernel headers, and none that include it on
> purpose. I agree that this header should really not exist in uapi,
> but the question is what exactly to do about it.
> 
> Possible changes would be:
> 
> - add a special value PORT_* constant other than PORT_UNKNOWN that
>    can be used by serial drivers instead of a unique value, and
>    ensure that the serial core can handle drivers using it.
> 
> - move all values used by the 8250 driver from serial_core.h
>    to serial.h, as this driver actually uses the constants.
> 
> - Move the remaining contents of uapi/linux/serial.h into the
>    non-uapi version.
> 
> - Change all drivers that only reference a single PORT_*
>    value to use the generic one.

Hmm, we are looping :).

https://lore.kernel.org/all/75375f8d-e157-a364-3da5-9c8d5b832927@kernel.org/

regards,
-- 
js
suse labs

