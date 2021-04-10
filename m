Return-Path: <SRS0=jXx7=JH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF25C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Apr 2021 08:25:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F40860724
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Apr 2021 08:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F40860724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MIvu1sdtl+8coD+MDoU9Y19+/u6WMDT/fdGA3jApoFA=; b=kEzJBp00i57fRFjOQ9C+d3sNU
	VTXaDTKRNcUZeW307VAN4YMlkmkWYyxjzWyINLLLkXX9k0vgkRsqJsd6A19JWSAiVwvxQy8LNC5k4
	jJFGt3WtPGk8Lqr81SPIXPyr/WZX/5MjiE+VXkoTMoT5jEzK7CpM8vZ2mjjmvci22aT5Ul626SMKz
	4xnqv2go/7doAjwH9AIourwA4es7rfywAeOI9HXJ//2e/ThAALtv4GSj/nYBhX92/r2XAJgsmb/0V
	zHKWXXRCA+tojQrJmo+gCddI39onCix/n6q01ri740Gk/h4j6rHQZgIC3CETYxoKwmCm+dGAQFewI
	FiaO1LsEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV8tg-002PaS-1h; Sat, 10 Apr 2021 08:23:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV8tZ-002PZp-TM
 for linux-arm-kernel@desiato.infradead.org; Sat, 10 Apr 2021 08:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1g9dwFK+ZzjwKg1fm+1MQdSB/cgBpIFTQEyht7RYvAQ=; b=iLlTO4oZRvQLe4ul4Koy9KySH4
 R6d6j86wFsPHCHNgvEtyfCMg6YnL3VBkHfxcE8Wf6Kk7QOXzKKkOqnORAVGHOU6vqVFV80EYFZROE
 YCU6nH6PvAoOhZUdFxEJyRgHZeelZRDXKkNSoyBLwmbaOQKPM75uDUDNvWEQk+7GwYVRUx/+Q1jzr
 Xzv231TzWlUV4IX/fQjZoKem1D6JlBG3pIrd0qIPyuoVCROqiN17WYHJBs3tb4uNzQtzWB0mcnCMd
 9SHgdA2ogo+4M+e2pO6b5Drnnrf4cWEktaRNzbqz0xYYeQZh4TciJt48yhxB8RfR0Osjm6rn0U5Mr
 Hp00qVyQ==;
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lV8tW-004zFG-Rw
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Apr 2021 08:23:08 +0000
Received: from belgarion ([90.11.64.244]) by mwinf5d03 with ME
 id qwFG2400R5GBUJa03wFRLb; Sat, 10 Apr 2021 10:15:30 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 10 Apr 2021 10:15:30 +0200
X-ME-IP: 90.11.64.244
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
In-Reply-To: <161727243811.583633.1536328285829233051.b4-ty@arndb.de> (Arnd
 Bergmann's message of "Thu, 1 Apr 2021 12:23:29 +0200")
References: <20210323130849.2362001-1-arnd@kernel.org>
 <161727243811.583633.1536328285829233051.b4-ty@arndb.de>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
X-URL: http://belgarath.falguerolles.org/
Date: Sat, 10 Apr 2021 10:15:15 +0200
Message-ID: <87im4utv1o.fsf@belgarion.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_012307_057179_495D7034 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210410081515.6A8L39J1LVbl-7sH1wx5wWa7r99CQprrFX6-X1uhb-k@z>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On Tue, 23 Mar 2021 14:08:27 +0100, Arnd Bergmann wrote:
>> The default initializer at the start of the array causes a warning
>> when building with W=1:
>> 
>> In file included from arch/arm/mach-pxa/mainstone.c:47:
>> arch/arm/mach-pxa/mainstone.h:124:33: error: initialized field overwritten [-Werror=override-init]
>>   124 | #define MAINSTONE_IRQ(x)        (MAINSTONE_NR_IRQS + (x))
>>       |                                 ^
>> arch/arm/mach-pxa/mainstone.h:133:33: note: in expansion of macro 'MAINSTONE_IRQ'
>>   133 | #define MAINSTONE_S0_CD_IRQ     MAINSTONE_IRQ(9)
>>       |                                 ^~~~~~~~~~~~~
>> arch/arm/mach-pxa/mainstone.c:506:15: note: in expansion of macro 'MAINSTONE_S0_CD_IRQ'
>>   506 |         [5] = MAINSTONE_S0_CD_IRQ,
>>       |               ^~~~~~~~~~~~~~~~~~~
>> 
>> [...]
>
> Applied to arm/fixes.
Too late, but ...
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
