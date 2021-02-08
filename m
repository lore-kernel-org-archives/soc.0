Return-Path: <maz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A525CC433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 10:34:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 80DD964E88; Mon,  8 Feb 2021 10:34:10 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5159D64E56;
	Mon,  8 Feb 2021 10:34:10 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <maz@kernel.org>)
	id 1l93rr-00Ckco-KX; Mon, 08 Feb 2021 10:34:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Feb 2021 10:34:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Olof Johansson
 <olof@lixom.net>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
In-Reply-To: <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-02-07 09:12, Hector Martin 'marcan' wrote:
> On 06/02/2021 22.15, Marc Zyngier wrote:

[...]

>>> -	spin_lock_irqsave(&port->lock, flags);
>>> +	/* Only lock if called from IRQ context */
>>> +	if (irq != NO_IRQ)
>>> +		spin_lock_irqsave(&port->lock, flags);
>> 
>> Isn't that actually dangerous? What prevents the interrupt from firing
>> right in the middle of this sequence and create havoc when called from
>> enable_tx_pio()? I fail to see what you gain with sidestepping the
>> locking.
> 
> The callpath here is:
> 
> uart_start -> __uart_start -> (uart_ops.start_tx)
> s3c24xx_serial_start_tx -> s3c24xx_serial_start_tx_pio ->
> enable_tx_pio -> s3c24xx_serial_tx_chars
> 
> And uart_start takes the uart_port lock. None of the serial functions
> take the lock because the serial core already does, but obviously the
> IRQ handler needs to, *if* it's called as an IRQ handler only.

Right, that's the part I missed, thanks for pointing this out.
It'd probably be cleaner to move the whole s3c24xx_serial_tx_chars()
into a helper and keep the locking in the interrupt handler proper.

[...]

>>> diff --git a/include/uapi/linux/serial_core.h 
>>> b/include/uapi/linux/serial_core.h
>>> index 62c22045fe65..59d102b674db 100644
>>> --- a/include/uapi/linux/serial_core.h
>>> +++ b/include/uapi/linux/serial_core.h
>>> @@ -277,4 +277,7 @@
>>>   /* Freescale LINFlexD UART */
>>>   #define PORT_LINFLEXUART	122
>>>   +/* Apple Silicon (M1/T8103) UART (Samsung variant) */
>>> +#define PORT_APPLE	123
>>> +
>> 
>> Do you actually need a new port type here? Looking at the driver
>> itself, it is mainly used to work out the IRQ model. Maybe introducing
>> a new irq_type field in the port structure would be better than
>> exposing this to userspace (which should see something that is exactly
>> the same as a S3C UART).
> 
> Well... every S3C variant already has its own port type here.
> 
> #define PORT_S3C2410    55
> #define PORT_S3C2440    61
> #define PORT_S3C2400    67
> #define PORT_S3C2412    73
> #define PORT_S3C6400    84
> 
> If we don't introduce a new one, which one should we pretend to be? :)

Pick one! :D

> I agree that it might make sense to merge all of these into one,
> though; I don't know what the original reason for splitting them out
> is. But now that they're part of the userspace API, this might not be
> a good idea. Though, unsurprisingly, some googling suggests there are
> zero users of these defines in userspace.

I don't think we can do that, but I don't think we should keep adding
to this unless there is a very good reason. Greg would know, I expect.

Thanks,

          M.
-- 
Jazz is not dead. It just smells funny...
