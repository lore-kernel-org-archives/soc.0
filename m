Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47180C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 16:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0ACCD64E5D; Mon,  8 Feb 2021 16:10:12 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A17F64DF0;
	Mon,  8 Feb 2021 16:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A17F64DF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 2093141F47;
	Mon,  8 Feb 2021 16:10:03 +0000 (UTC)
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <20210208105451.yumjjunjeyrglfnw@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <11d36c47-45c6-03ee-2d08-6692b5d0e241@marcan.st>
Date: Tue, 9 Feb 2021 01:10:02 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208105451.yumjjunjeyrglfnw@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 08/02/2021 19.54, Krzysztof Kozlowski wrote:
>> +enum s3c24xx_irq_type {
>> +	IRQ_DISCRETE = 0,
>> +	IRQ_S3C6400 = 1,
>> +	IRQ_APPLE = 2,
> 
> It seems you add the third structure to differentiate type of UART.
> There is already port type and s3c24xx_serial_drv_data, no need for
> third structure (kind of similar to tries of Tamseel Shams in recent
> patches). It's too much. Instead, differentiate by port type or prepare
> own set of uart_ops if it's really different (like you did with startup
> op).

This ties into little changes in a bunch of places, so separate uart_ops 
  callbacks for every one of those would end up duplicating a lot of code :(

That list is just used to map the port type to something that only 
represents the type of IRQs, but its only real purpose for the 
indirection is so I can do "== IRQ_DISCRETE" in some codepaths to mean 
"not apple or S3C6400".

e.g.

     if (s3c24xx_irq_type(port) == IRQ_DISCRETE)
         free_irq(ourport->rx_irq, ourport);

Would have to become

     if (port->type != IRQ_S3C6400 && port->type != IRQ_APPLE)
         free_irq(ourport->rx_irq, ourport);

or

     switch (port->type) {
     case IRQ_S3C6400:
     case IRQ_APPLE:
         break;
     default:
         free_irq(ourport->rx_irq, ourport);
     }

Which one do you prefer?

Aside: Marc didn't like introducing new port types into uapi, but if we 
don't do that then we need a "real" port type in drv_data that isn't the 
uapi-exposed port or something along those lines, with a separate enum 
containing all the true port type values for that.

>>   	/* Startup sequence is different for s3c64xx and higher SoC's */
>> -	if (s3c24xx_serial_has_interrupt_mask(port))
>> +	case IRQ_S3C6400:
>>   		s3c24xx_serial_ops.startup = s3c64xx_serial_startup;
> 
> Don't overwrite specific ops. It's difficult to see then which ops are
> being used. Instead create a new set of uart_ops matching the needs.

s3c24xx_serial_ops was already doing that here, but I can move that to a 
a separate uart_ops too.

Ack on all the other comments, I'll make the changes for v2.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
