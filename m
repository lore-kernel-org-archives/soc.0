Return-Path: <SRS0=cb5G=MZ=gmail.com=martinwguy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0D5C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 15:45:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0471610A8; Mon,  2 Aug 2021 15:45:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625D0610FB;
	Mon,  2 Aug 2021 15:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 625D0610FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id b7so25121548edu.3;
        Mon, 02 Aug 2021 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=cMN4yc6Yg7k+g95Y7UmZLiL/P6GU424U+ZDesgvhHgU=;
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
        b=ktOgja8LXPlrwg96+5fmLyq28FiUwjH2pXu2Fpn81Sfk7Ur+CsCPJ44slJAp3DeUc7
         KYuPcNH6cXb13pZnaJGMPRXB6czUkV9gWrLi54ka8qJppHI/eeHb3H04YyLV1Q29c5eu
         1I/SgdhvjCGWlj0DmKVhrKzT4vNHkQpzO/fZIAd+A7BjpdhXjiYGBZDruCbULNpGryS5
         Vy4Zi7aZ8TSMsPExGnnxroDmBGdfxwlMxAe7eS8stxnCdr63pwftIrEr0kLWRsvdIeF8
         KUKlZH+XLEfW2UYqaCPgLge/gXJVPb8EmEKNdYQrFejnPt85QwA2Q8ta8/hyRhbjMVQz
         n1/A==
X-Gm-Message-State: AOAM533MnNX4U+UGpQxV6cRBxy2T45W0kT7zP4QI/a8tA9uxy8ks9n7D
	ZMpcAE2fqVbX5eWdu/Vb2sZI2gianlBFHiEwPiQLk2HNPOQ=
X-Google-Smtp-Source: ABdhPJxT71L+T05yz/hq+Tsn15GIbWhZTIbquxkVkxucO5ulY894g/8MmOt6pCNq9/8xQxw7L9Urp1FEelq55p0lqoU=
X-Received: by 2002:a05:6402:274f:: with SMTP id z15mr20502581edd.21.1627919118096;
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
Cc: Russell King <linux@armlinux.org.uk>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@kernel.org, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

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
