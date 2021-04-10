Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880B7C433B4
	for <linux-kernel@archiver.kernel.org>; Sat, 10 Apr 2021 08:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F72D61184
	for <linux-kernel@archiver.kernel.org>; Sat, 10 Apr 2021 08:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhDJIPs (ORCPT <rfc822;linux-kernel@archiver.kernel.org>);
        Sat, 10 Apr 2021 04:15:48 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:25148 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhDJIPr (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Sat, 10 Apr 2021 04:15:47 -0400
Received: from belgarion ([90.11.64.244])
        by mwinf5d03 with ME
        id qwFG2400R5GBUJa03wFRLb; Sat, 10 Apr 2021 10:15:30 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 10 Apr 2021 10:15:30 +0200
X-ME-IP: 90.11.64.244
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
In-Reply-To: <161727243811.583633.1536328285829233051.b4-ty@arndb.de> (Arnd
        Bergmann's message of "Thu, 1 Apr 2021 12:23:29 +0200")
References: <20210323130849.2362001-1-arnd@kernel.org>
        <161727243811.583633.1536328285829233051.b4-ty@arndb.de>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
X-URL:  http://belgarath.falguerolles.org/
Date:   Sat, 10 Apr 2021 10:15:15 +0200
Message-ID: <87im4utv1o.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20210410081515.FWpT_x99dEVVcHSHWNJHmpAjGs4pH4H5ZSjzGG4EKuk@z>

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
