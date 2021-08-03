Return-Path: <SRS0=uzdW=M2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A955C4338F
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 12:12:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FF5260F70; Tue,  3 Aug 2021 12:12:46 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5119E60E97
	for <soc@kernel.org>; Tue,  3 Aug 2021 12:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5119E60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id bq29so13761817lfb.5
        for <soc@kernel.org>; Tue, 03 Aug 2021 05:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjwFLstJrPnRmXg/rZRQYNcQZixdp2USEJZj3tF3f38=;
        b=QZvsRYa5PI0EjkNxpFJt0PjnkZl/KzLMkb06EW7T3tkTDAe4SGOPJhjWDkxfPWHvtP
         bXdVGwpVKHTCyVg74Io3kBqhbco3yndRvKndVVFP1tHO789dMj3mi3/UKGHCbUs+ZydN
         oqwUFqGcDgydpFFlJRoUTPa8ExjIjwY2nex7pkICvVHbSkG56SCi7BVTrYd1c5GPKxnu
         WYIuFov9/lUOjKg/fB7OpjVWR72yCX91lvbLkibrUvmaZovNuqrdFJE9FOkNSzdV86PG
         ffLRdFMBmEjJrK1qId5SfGLKqHKBDClc9krcDn3h9GL2lJhJ9kmrWkaIFG/sn/8eVOt3
         Qofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjwFLstJrPnRmXg/rZRQYNcQZixdp2USEJZj3tF3f38=;
        b=XrGpnWQW1DGs6hXxiou/KwxtXnJZjKnBrRfDObCScK7CyV/28qzHa9764LW3uAtqDD
         ANyD3phjP4VNa4cFx1yQv74rtR1NAkq0EGPkgyspYVP8ptYcroyeveASbs5yMI1skElL
         g9Gpi6zx4hgVIkYdOFJ4/sAoqRBqY1GZRiwYa/OCV3W1+XG73krvmSiUdNS8k4SVp2O9
         kIZz7iWMtZM/1j2UuM22ziMOh7E0jQW4gwu5IZxSN2sqBWg1X0NB2uVI52a+G0KwG+Lb
         IGg//ZO7qlccPm3BYJg13KqoNTDVLGJewBDU/iYGhHt8kATssn/VLFUpGIg7RGA2huU/
         +QpA==
X-Gm-Message-State: AOAM532xZzlDPTecXO/UAFcReQKDVJBOncY2oLvbs72Y1MxNiEeALv77
	f72FNsh+4d+sk3Bm8sHbOrbKVl+DZjoUXx1kCuJAIQ==
X-Google-Smtp-Source: ABdhPJz782mMUx2DQxPgWR7w25+Ro1pQSWnX/5zTyOK3W2u5RXz/AhlGd1Pib3weOa5vmkxj00IAN8QgYUu3dBYZqNw=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr15849594lfu.291.1627992764702;
 Tue, 03 Aug 2021 05:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
In-Reply-To: <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Aug 2021 14:12:33 +0200
Message-ID: <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Martin Guy <martinwguy@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 5:45 PM Martin Guy <martinwguy@gmail.com> wrote:

> > was removed from gcc in its 4.8 release in 2012.
>
> I was sad about that, as I had managed to get it working correctly in
> 4.2 4.3 and 4.4.
> Unfortunately the GCC ARM maintainer at the time was paid by ARM, and
> they had no interest in it, as I gather the ARM-Cirrus partnership
> ended up disappointingly.

Political issues aside, have you considered contributing support
to LLVM instead?

It currently doesn't even support ARMv4 AFAIK but reportedly
has an easier to use and maintain back-end. (I do not know if
this is true, I just browsed this:
https://llvm.org/docs/WritingAnLLVMBackend.html )
Current ARM Targets are here:
https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/ARM
And they have a very clear and straight-forward developer policy:
https://llvm.org/docs/DeveloperPolicy.html

If ARMv4 support could be added to LLVM, that would solve
a lot of my headaches for ARM32, where we have things like
SA110 being actively maintained.

Yours,
Linus Walleij
