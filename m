Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73304C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3696764E41
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3696764E41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qomATJvP2ss2hFheD3n7tmpnp2YqFRHA5f3vEyv9PfA=; b=wjcsWHPlDWw4WB12LL+eUqdzv
	ddRrwvh0+FlY+9QYKp51ryq2LthFUpt7qKYsCNrupvQVa39/vPUHuapuYdusZcSPNJckNC66NZt/x
	mfSR5vaZYQQDQAiWVk0xp1W+qzMx01s7cM/dbPLFAlFLWA4tvF7Vdrp/t60jtrVlH+jP7i2eU5D0E
	y9VH47K+7Mb6HhtZbCOWZFCNUzwBIAoje1PyF+EkGoNFC1PDS2xG+qAPTPyNK26AxikUQ785CS3n4
	6CgyXLxLHgM1VORTa+X8zotVofYgzL35+j6oR3J2Ry9qwSZHhrgzI1nJWZnaaey+T+ZJ+Cjp/hGTk
	Cya2pcaOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8g75-0003Nx-Om; Sun, 07 Feb 2021 09:12:15 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8g72-0003NT-Hy
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 09:12:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 55E874283E;
 Sun,  7 Feb 2021 09:12:08 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
Date: Sun, 7 Feb 2021 18:12:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87lfc1l4lo.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_041212_859528_18AE5434 
X-CRM114-Status: GOOD (  29.51  )
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
 Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207091205.ff3nyUCf50KR8C1Mlsvlc8jcdqp-HePhU9dN9bQvbDU@z>

On 06/02/2021 22.15, Marc Zyngier wrote:
>> -static int s3c24xx_serial_has_interrupt_mask(struct uart_port *port)
>> +static int s3c24xx_irq_type(struct uart_port *port)
>>   {
>> -	return to_ourport(port)->info->type == PORT_S3C6400;
>> +	switch (to_ourport(port)->info->type) {
>> +	case PORT_S3C6400:
>> +		return IRQ_S3C6400;
>> +	case PORT_APPLE:
>> +		return IRQ_APPLE;
>> +	default:
>> +		return IRQ_DISCRETE;
>> +	}
>> +
> 
> nit: For ease of reviewing, it'd be good if you could split this patch
> with introducing the S3C6400 and "discrete" support initially, and
> only then add the new stuff.

Good idea, will do for v2.

>> +	if (s3c24xx_irq_type(port) == IRQ_APPLE)
>> +		s3c24xx_serial_tx_chars(NO_IRQ, ourport);
> 
> Instead of directly calling into the handler (which has its own
> problems, see below), could you just tickle the interrupt status
> register to make an interrupt pending and trigger an actual interrupt?
> I have no idea whether the HW supports this kind of trick though.

I thought of that, but I tried really hard to find such a feature with 
no success. The best I can do is unmask and trigger the *RX* timeout 
interrupt which will eventually fire but... this doesn't work so well in 
practice. There is no way to trigger IRQ flags directly (as those bits 
are write-1-to-clear).

>> -	spin_lock_irqsave(&port->lock, flags);
>> +	/* Only lock if called from IRQ context */
>> +	if (irq != NO_IRQ)
>> +		spin_lock_irqsave(&port->lock, flags);
> 
> Isn't that actually dangerous? What prevents the interrupt from firing
> right in the middle of this sequence and create havoc when called from
> enable_tx_pio()? I fail to see what you gain with sidestepping the
> locking.

The callpath here is:

uart_start -> __uart_start -> (uart_ops.start_tx) 
s3c24xx_serial_start_tx -> s3c24xx_serial_start_tx_pio -> enable_tx_pio 
-> s3c24xx_serial_tx_chars

And uart_start takes the uart_port lock. None of the serial functions 
take the lock because the serial core already does, but obviously the 
IRQ handler needs to, *if* it's called as an IRQ handler only.

> The default should be IRQ_NONE, otherwise the kernel cannot detect a
> screaming spurious interrupt.

Good point, and this needs fixing in s3c64xx_serial_handle_irq too then 
(which is what I based mine off of).

>> +	ret = request_irq(port->irq, apple_serial_handle_irq, IRQF_SHARED,
>> +			  s3c24xx_serial_portname(port), ourport);
> 
> Why IRQF_SHARED? Do you expect any other device sharing the same line
> with this UART?

This also came from s3c64xx_serial_startup and... now I wonder why that 
one needs it. Maybe on some SoCs it does get shared? Certainly not for 
discrete rx/tx irq chips (and indeed those don't set the flag)...

CCing Thomas, who added the S3C64xx support (and should probably review 
this patch); is there a reason for IRQF_SHARED there? NB: v1 breaks the 
build on arm or with CONFIG_PM_SLEEP, those will be fixed for v2.

Either way, certainly not for Apple SoCs; I'll get rid of IRQF_SHARED 
for v2.

>> diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
>> index 62c22045fe65..59d102b674db 100644
>> --- a/include/uapi/linux/serial_core.h
>> +++ b/include/uapi/linux/serial_core.h
>> @@ -277,4 +277,7 @@
>>   /* Freescale LINFlexD UART */
>>   #define PORT_LINFLEXUART	122
>>   
>> +/* Apple Silicon (M1/T8103) UART (Samsung variant) */
>> +#define PORT_APPLE	123
>> +
> 
> Do you actually need a new port type here? Looking at the driver
> itself, it is mainly used to work out the IRQ model. Maybe introducing
> a new irq_type field in the port structure would be better than
> exposing this to userspace (which should see something that is exactly
> the same as a S3C UART).

Well... every S3C variant already has its own port type here.

#define PORT_S3C2410    55
#define PORT_S3C2440    61
#define PORT_S3C2400    67
#define PORT_S3C2412    73
#define PORT_S3C6400    84

If we don't introduce a new one, which one should we pretend to be? :)

I agree that it might make sense to merge all of these into one, though; 
I don't know what the original reason for splitting them out is. But now 
that they're part of the userspace API, this might not be a good idea. 
Though, unsurprisingly, some googling suggests there are zero users of 
these defines in userspace.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
