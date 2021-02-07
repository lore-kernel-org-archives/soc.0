Return-Path: <SRS0=gJAr=HJ=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF1AC433DB
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 09:26:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 578C864E2A; Sun,  7 Feb 2021 09:26:51 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1488764DE3;
	Sun,  7 Feb 2021 09:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1488764DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C083042852;
	Sun,  7 Feb 2021 09:26:45 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
From: Hector Martin 'marcan' <marcan@marcan.st>
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
Message-ID: <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
Date: Sun, 7 Feb 2021 18:26:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 07/02/2021 18.12, Hector Martin 'marcan' wrote:
> On 06/02/2021 22.15, Marc Zyngier wrote:
>> The default should be IRQ_NONE, otherwise the kernel cannot detect a
>> screaming spurious interrupt.
> 
> Good point, and this needs fixing in s3c64xx_serial_handle_irq too then
> (which is what I based mine off of).
> 
>>> +	ret = request_irq(port->irq, apple_serial_handle_irq, IRQF_SHARED,
>>> +			  s3c24xx_serial_portname(port), ourport);
>>
>> Why IRQF_SHARED? Do you expect any other device sharing the same line
>> with this UART?
> 
> This also came from s3c64xx_serial_startup and... now I wonder why that
> one needs it. Maybe on some SoCs it does get shared? Certainly not for
> discrete rx/tx irq chips (and indeed those don't set the flag)...
> 
> CCing Thomas, who added the S3C64xx support (and should probably review
> this patch); is there a reason for IRQF_SHARED there? NB: v1 breaks the
> build on arm or with CONFIG_PM_SLEEP, those will be fixed for v2.

Seems Thomas does not work for Linaro any more :)

CCing Krzysztof instead, who is the Samsung arch maintainer.

> 
> Either way, certainly not for Apple SoCs; I'll get rid of IRQF_SHARED
> for v2.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
