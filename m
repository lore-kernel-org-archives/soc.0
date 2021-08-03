Return-Path: <SRS0=39e7=M2=gmail.com=martinwguy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF861C432BE
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 11:41:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A433760525; Tue,  3 Aug 2021 11:41:00 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A7B460560;
	Tue,  3 Aug 2021 11:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A7B460560
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id oz16so35874692ejc.7;
        Tue, 03 Aug 2021 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UTH1xriYdp7u5xYL3QfzWmKRaaFC9ziEV6g6dXWdnAA=;
        b=tgjPUlEFLS9R3pe1i23bVN9uFNo5sB8O4gOOXAhmPTwVrZrVq+R0HvfFC7tCxJMGS0
         wiQmMdBJ7Qjs8IxqQ+Kk/XPsRmKOP2ZL14CDSP5EJahGpBhZxGqN+9OziIl5Yg45A85I
         5KfD8GlzssfveCwgOsgys80okroPvFFEkPF6mb1t0cW3CkOjQ9G8cWdaCQuhdirdHJGI
         JlTGf8jCSLZDGkdgMDG7NLABtdeNCfzSvAPPQng1kCP8mzptXf9k8jKgq6wMbyO1zWgz
         V/9Sa9moikRXguzOELOnYVB9mR75hUpcA59WfzrXQ2WZaagQPmNKgDsy97rVMTJMgRri
         ku0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UTH1xriYdp7u5xYL3QfzWmKRaaFC9ziEV6g6dXWdnAA=;
        b=D3Pbm961S5FznI0J58KQ5u+Wlp7wXyC8aM5m7BsRDBwQislsjGrPQ45mXMoqKd1oGc
         nNiCh65Ah2XRkiGLmt7lt2BWF6sHsEBArMvH4ukJ3w6k7fAJ+pmeToDARh9Lw3HmwLqR
         KUVhlfA09pD38+dj45mT1WraeJE498NsNYL8bm7/zxddSMOXbYx5VPxhHxeA7uca5keN
         92wNjfNZI4M17oOfI6KTdAYzaE3tXr+rhFA9vv0LeOKGRFg3Wbq8+EMeQ6sGw6Qh1ZHT
         KKiJtMgQ1F816QNfo2F870wU4lhzObPjt7mG/N25gxjibW/9QoAe58yQUJjqiSlYCitd
         3xtQ==
X-Gm-Message-State: AOAM5314KD3OoxqSuKm6+hjfbX72GkK0osHX3yaiAWWSmkh+2oxPuOSK
	6ssMpXuAdJhex4v/PGRKc7xoALZUIH6ue8K/IsteRjRcSweGIg==
X-Google-Smtp-Source: ABdhPJx+oRy7TDwar4JICPJWtGOTCfgTSmYrsw5qbLO26sc9JEqhl7vCfDGC77LJsFULHHYzz9kc6ojyUInie41FksE=
X-Received: by 2002:a17:906:4d12:: with SMTP id r18mr19569693eju.537.1627990859185;
 Tue, 03 Aug 2021 04:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3018:0:0:0:0 with HTTP; Tue, 3 Aug 2021 04:40:58
 -0700 (PDT)
In-Reply-To: <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
From: Martin Guy <martinwguy@gmail.com>
Date: Tue, 3 Aug 2021 13:40:58 +0200
Message-ID: <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

I forward opinion from people currently producing and supporting EP93XX boa=
rds:

From: Technologic Systems Support Team <support@embeddedarm.com>
To: martinwguy@gmail.com
Cc: jerome.oufella@savoirfairelinux.com

> I expect our customers would care if support was dropped.
> Unfortunately I don't know to what extent.  I'd like to bring
> Jerome Oufella of Savoir Faire Linux into the conversation here,
> as he runs the software company who most of our customers
> contract through when they need a modern Linux kernel running
> on one of our Cirrus Logic EP93XX series single board computers.
> I expect his opinion will be more valuable than mine.
=E2=80=8B>
> Good morning Jerome,
>
> A member of the Linux Kernel Development community reached out
> to us this morning letting us know the community has suggested
> dropping support for the MavericCrunch FPU on the EP9302 processor.
> Would this impact any of the development your team has been doing
> for some of our mutual customers?

From: Jerome Oufella<jerome.oufella@savoirfairelinux.com>
> I am aware of a few companies who rely on variants of the TS-7250
> running not-too-old LTS releases (4.19, 5.4) to cope with their patch pol=
icies.
>
> With Linux 5.10 being the next "Super LTS", this presumably brings its
> support lifespan until about 2030, which (I believe) they would be
> comfortable with considering the age of the platform.
>
> Jerome Oufella
> Vice-President, Technologies
> www.savoirfairelinux.com
