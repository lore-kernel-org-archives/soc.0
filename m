Return-Path: <SRS0=D1/I=FL=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E191C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 20:20:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 01FF32332A; Mon,  7 Dec 2020 20:20:05 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E242311A;
	Mon,  7 Dec 2020 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E242311A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=geert.uytterhoeven@gmail.com
Received: by mail-ot1-f65.google.com with SMTP id w3so13108984otp.13;
        Mon, 07 Dec 2020 12:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8fj10nDje2x93+KcCvXW7CIv2lqtiTGkIsq3PGAkpQ=;
        b=ERZ1AipjbyK06rk/0qbWpC2xNGlB/QPOVG2XvweEO/hFDtykA6uBaUfmzAcXvaFgwj
         mwZ8bq3ZXjrPq1GhcMZvLY8NnLwIhHjEKwJJMkpTIhF6uCaBYbaF1r3h2ImKNKBJalAG
         EsnLHEgjuR4mBqS5ybEGb9LkietWc+d1Bfprm/bojXWvVXx04q6oFyExtQY8SkdPsDG3
         yIjfxxbKuGp8A6jczdR5sQC+MnT5E+TapG97ZoWhtwQS/FCppfw8ymxsG/eTxUDkaauB
         T5M90PR1w+h810KbX82d9Fj3XTGH31hrZDaP1Zriqwg2Vkc6VKuClrbgWhEU8CcAEDdE
         ROSQ==
X-Gm-Message-State: AOAM530fFO56B6lilT702MQuY4OoViqKHG167oOpLTATEM9VuKYGiKkj
	e8OPvo3/90paE853aYXoRhteV1lqt6Ole//RIOXwVGsX
X-Google-Smtp-Source: ABdhPJy2xXJ31q/f+prT+1t1V3CRJwLEpaT1rJWaISAdMh4ZqnS5NVqYeodB/wICppPMsAb4jFStHycuOjYZ7aK37g8=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr14394879oth.250.1607372403410;
 Mon, 07 Dec 2020 12:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com> <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 21:19:52 +0100
Message-ID: <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC devicetree

On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > So, I think we have two options. If people are willing to move to
> > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > as is. Otherwise, we can revert the async probe parts of the mmc host
> > drivers, but that would still leave us in a fragile situation.
>
> Can you reliably detect whether the mmc aliases in the dt exist?
> If that's possible, maybe the async flag could be masked out to only have
> an effect when the device number is known.

IMHO DT aliases are not a proper solution for this.

Yes, you can detect reliably if an alias exists in the DT.
The problems start when having multiple devices, some with aliases,
some without.  And when devices can appear dynamically (without
aliases, as there is no support for dynamically updating the aliases
list).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
