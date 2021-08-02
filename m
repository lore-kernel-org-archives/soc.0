Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F16FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 15:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1B2610FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 15:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D1B2610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYPYOsWX5ZTTFGsNwvlyB7M0u/yvLblm2VkO0po6TpI=; b=Cf45Dv56nbOW6V
	vLF+sCExXOb42L3leHTtq3WNiVtBS3B+kYpQrwriQQ5FWBHSL+uEXRGk+rgxBaeXW4e1x7uWVArkN
	qTK99rmu8P2iqVynWwxbWVb/y1tETN4IwjUD61Bc9ku/xUPof4n0naS7O0TVJufxNZboK/gNmIM77
	IBs0Tbd1tG5aQXjBaRsxIYkX3NtLeJdKhAfaSO4teZIZqDZEVVwsOq9rY2DdBLkrwf4NclxrHwN6y
	vlGvEeElAlfDs0AbrG2ZDHZRc9xdTADNsCAYTBCyyV37oBBmNQveSwPkCI+Xkpy/X4YD+e0fvCiT9
	8SgLerqnWjrSfA6Lq+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAa84-00H1mV-Mb; Mon, 02 Aug 2021 15:45:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAa81-00H1l1-A0
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 15:45:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id y7so22847742eda.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 02 Aug 2021 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cMN4yc6Yg7k+g95Y7UmZLiL/P6GU424U+ZDesgvhHgU=;
 b=cQd6eHU1xNXbRSjFnHyZg5KKJ8qwmS312QYTIhTlKOvZHVz+vU5I1tTgW2BB0RFmES
 Z4EHxLLnIiMwBth28LK4Ahje7aFFktra/pnP5cFCug4SnUwmR6zGodWlrj8VYbluAqwQ
 YJi6LnO/Ryc3z7LAq+QKYt/TWmkRz5mZvE24aY7yFfW1JyXLaItJHEt86+y67qOOSTgE
 mt1yMy2iPuaKgK7CcNnSNx9YTscgoOCJgITwkVx9FihmNPRfqw5HHHBcqiZE9PhLGbYK
 lT1UqDwf/AQYapSCuVZ3aNLNUS30d0WEkBVdFHWhYEwB6rusx/Ph3bHdvZGhEx6h+usA
 nqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cMN4yc6Yg7k+g95Y7UmZLiL/P6GU424U+ZDesgvhHgU=;
 b=L886LuLL23pYFu8DHbXrYfu8RKoME6NzooH2k5XmsjdO9EdOHLaVYOLkIpvqqpamJX
 o/NGHsd2V3rEx9aUZeU6vUw7X1oQzYUa3prbqdF1UQTh3VSh/E82io3mhwyGFHxS1X+z
 EdfrJl6wj8jyp8TJvLaoz9KQYxRUCgJvAzC8h7PK1qSCjzqAc/fTj0YAzFpKN3nFyQL3
 g9lS4zjru8xp5baIpxyeuGy1OdYqM8O193zXlVv+Yw/6w+V0/STps5gQSMsc0J7/k9PR
 Ha0RclLTwNGg4NnVF6OrBHnn8s9L7sxdcAaqMWTyadaieVo3y0mYHtlJ+Zjl1OyEVNef
 mh/Q==
X-Gm-Message-State: AOAM533GVjf5vMzkCrAvMsMjIgfewstfqkbPASV7OY9jw8j7I+MIY7p4
 vSS+QJNfvFk+SBFJQGQLhh+FJlS1oM2Rxcfuhjk=
X-Google-Smtp-Source: ABdhPJxT71L+T05yz/hq+Tsn15GIbWhZTIbquxkVkxucO5ulY894g/8MmOt6pCNq9/8xQxw7L9Urp1FEelq55p0lqoU=
X-Received: by 2002:a05:6402:274f:: with SMTP id
 z15mr20502581edd.21.1627919118096; 
 Mon, 02 Aug 2021 08:45:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3018:0:0:0:0 with HTTP; Mon, 2 Aug 2021 08:45:17
 -0700 (PDT)
In-Reply-To: <20210802141245.1146772-1-arnd@kernel.org>
References: <20210802141245.1146772-1-arnd@kernel.org>
From: Martin Guy <martinwguy@gmail.com>
Date: Mon, 2 Aug 2021 17:45:17 +0200
Message-ID: <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@kernel.org, 
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>,
 Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_084521_393211_6FB2D359 
X-CRM114-Status: GOOD (  23.58  )
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
Message-ID: <20210802154517.SSmtmTFCZtbDR3xdS_Pj2qoCU1F5jtF9VXoHwLIT0c8@z>

On 02/08/2021, Arnd Bergmann <arnd@kernel.org> wrote:
> The MaverickCrunch support for ep93xx never made it into glibc

This is true, but is not needed except for preserving FP registers in
catch/throw exeptions or longjmps.

> was removed from gcc in its 4.8 release in 2012.

I was sad about that, as I had managed to get it working correctly in
4.2 4.3 and 4.4.
Unfortunately the GCC ARM maintainer at the time was paid by ARM, and
they had no interest in it, as I gather the ARM-Cirrus partnership
ended up disappointingly.

> It is now one of
> the last parts of arch/arm/ that fails to build with the clang
> integrated assembler

Even if crunch support is not configured?

> According to Hartley Sweeten:
>
>  "Martin Guy did a lot of work trying to get the maverick crunch working
>   but I was never able to successfully use it for anything.

>   It "kind" of works but depending on the EP93xx silicon revision

It works fine on all production revisions except D0 (the first one)
which is so rare as to be unfindable. All the others from D1 on have
the exact same HW bugs.

>   there are still a number of hardware bugs that either give imprecise or garbage results.

Not my experience, See http://martinwguy.net/crunch/#CorrectnessTests
If "imprecise" means "doesn't handle unnormalized FP values correctly"
then yes, that's a feature if you need the 2.5 to 4gimes speedup it
provides.
But I would be interested (Hartley) if you have a concrete example.

> This touches mostly the ep93xx platform,

The ep93xx is the only chip series it was ever included in.

> If there are remaining users of MaverickCrunch, they can use LTS
> kernels for at least another five years before kernel support ends.

The only user ! am aware of is the HEAT deep space telescope in the Antarctic
http://martinwguy.blogspot.com/2015/10/maverickcrunch-code-runs-on-heat-deep.html

Personally I have no problem with removing kernel support if that
makes people's lives easier in some way.

  M

   M

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
