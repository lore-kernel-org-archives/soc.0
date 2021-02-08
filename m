Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA52BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF5064E54
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF5064E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nxp6PpO6rWHH+hn+Js0TsFEbNf0efnIBTFchs6wqTNA=; b=uxRa4JDz5I9nLnllNkf5ISD4z
	C1MkvaqwpIdz9J3ZVz66DiRANXofzEc24wmPFHZmr5Ocp8VsB8yDhmHzb6kepM28jqLqX5uy09Phj
	tZTiloJnQRTUVsiGBQtmGFLSUnEZgKBoEHpV9rDd/WKJwDjRc+v+TcEcurvq7YxujaBeN8r0u0tUw
	+Ycd0WoSzIWiw1PNIZOJYTQWEeCtuD+L/e8QB3tb1nATriW/PEw+/mo+r7XMKt+CwjQ7aXGlHb7YP
	wmu5J4htjBn0GjMxgIjFnC//JHohBPvDTCdJ5oAMJ8Kl1Jom8twzMOt2yD28FsXhKhyivMNLNkSAC
	XB8K6Ti+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l93ry-0007pq-CA; Mon, 08 Feb 2021 10:34:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l93rv-0007pF-3Q
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 10:34:12 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5159D64E56;
 Mon,  8 Feb 2021 10:34:10 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l93rr-00Ckco-KX; Mon, 08 Feb 2021 10:34:08 +0000
MIME-Version: 1.0
Date: Mon, 08 Feb 2021 10:34:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
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
X-SA-Exim-Rcpt-To: marcan@marcan.st, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, arnd@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_053411_340598_0EF5D402 
X-CRM114-Status: GOOD (  21.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208103407.I7uCH_V2YuVWjBtIf1J2xiTT0RBj2ciQUYDb5i3zJlE@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
