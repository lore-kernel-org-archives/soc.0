Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDC1C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:28:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597F564E2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 09:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 597F564E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B7gJR9GhcugpR8Yph/v7UhohYwcI8ntR2/sDtAtn+Yk=; b=BAs634frPfmv3E2PD7UUP4ZTN
	pGJb4NGIJyr9quKbiR+V/ZOkvWtEwLdpdFnNkFGWec9GD+WtC6n2jgIIyQcjuM848Yw3lasCzkwai
	Y5wimVeJWIzB9Ak8E0OAo+suFbiaqfD2xGUwsr4D3G7c3A8b4nwG0CF7CY18oUIIONE7IZQzjOD22
	QJxBKkpQI0dClDX9svb8U/I0YJ0CXsKHlIcW4wdRixVAGhQTvhvv7ue/uktuMqhyAghcYJpI0Wpp4
	Fm6LGUJ68suBIP+PWrG9ed4hViQgY5XD3frKOWrBeYJqlxpnsXVXjStLNgLUyBtlYB1V4GYLOdnUy
	uwcPjoadA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8gLD-0004on-Vc; Sun, 07 Feb 2021 09:26:52 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8gLB-0004oH-J0
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 09:26:50 +0000
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
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
Message-ID: <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
Date: Sun, 7 Feb 2021 18:26:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_042649_794828_611AB28C 
X-CRM114-Status: GOOD (  16.79  )
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
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 soc@kernel.org, robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207092643.R7fRPIqtIvGqZWDQdjVOPweVQWYMAFFma3VuYFl9JDk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
