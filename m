Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A2EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:11:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3C664E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3C664E66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RiNsZdyVNg40jEJLgTuo81U3kw7U2VahDa9WC4SE0R4=; b=ua9TQN+pIH4WbeZqYXl4+mRC9
	zrXxQA/xAkvg2cxtyVEiI57VVd4UIucFxLHgPtbwF+ghOpdg/6Yy7CRGzFdhkK3RdmGVRpdlh70j8
	NSqMHkXsg21o2VoFjFKRomv5c0Rebi+3u8IwPsio9h90+6INc5q2CQqRm8jlgFliCUsD9YgGMG1Yu
	ZCTN1yCgfmkX4Yrb2r7kdX3MW/EqqI+t3Xo0Wzg+HUgVq7XJEHMOD2WRXGo12xp+T3gs8/RLW6pTv
	evsNcJ0270ubOrHs7LixKT9ovYbwQAzBQTGe/mkK4w9l+uXKmeuj01MHm1RrYQHXmdCTqb+GQCnh4
	Di9DuIN3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9977-00065o-8m; Mon, 08 Feb 2021 16:10:13 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9974-00065J-0u
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 16:10:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2093141F47;
 Mon,  8 Feb 2021 16:10:03 +0000 (UTC)
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_111010_195107_74E2A49A 
X-CRM114-Status: GOOD (  17.80  )
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
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208161002.Y49dt0onhY2Q_OCh-_jCOJbgj3dbhbV0c3g3wIbf7VU@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
