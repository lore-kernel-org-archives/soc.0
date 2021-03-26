Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEB7C433DB
	for <soc@archiver.kernel.org>; Fri, 26 Mar 2021 08:52:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D6AB61A4D; Fri, 26 Mar 2021 08:52:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27F3161A48;
	Fri, 26 Mar 2021 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616748723;
	bh=XLC9yTktkkTCTcqmTymKbTkS7ocrX/l3RayX7yKfUVI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lBrtXw4IguGaQxldR1tMbzgyY/459t+AJnsxWjtacrvonEyaiKgvg0a36MZmS2hRI
	 pPf5E60q6ihnrDDdqCxaavQOxRcMs9G9AXp6kx/L7N9hchCEwzHzuEd4n2iccH13Yl
	 o03yicOVpDb9sfGGim3AGr1J/9KkOaFlZkkDUihxhKqE9C+Yz2JGoeap1i2WziQtCh
	 scfzUykjP7KNWmoudf3E5tpPOUhOORVuKzzVZ0CvWv3Thrp+yV5SLmYh8XYF01Y0wK
	 Vqgrcir0b4fJskQNdi6J4j8du2SqYB8uUjt8vlaPWcCQVstBUo8J9PU1/psJzAbKZo
	 bVJD99+44gCLg==
Received: by mail-oo1-f45.google.com with SMTP id i25-20020a4aa1190000b02901bbd9429832so1147758ool.0;
        Fri, 26 Mar 2021 01:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM530BdVTYCk18h9WbT70wWGwJie5yMhEPebHrS7fj1nUY4TosDDtg
	oNz/ZwBlHlnnYD7wVmkp3NFEbxddwl9/dsfcVFU=
X-Google-Smtp-Source: ABdhPJxFmzDYtA3vz0j++H5JPrGDulcgfDeMX+fhEtN0QMlJKXJwWIk94mYoTguFCR3xO2L/Mr+haF9Bq5h9AnTcBrs=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr10392411ood.15.1616748722322;
 Fri, 26 Mar 2021 01:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org> <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
In-Reply-To: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Mar 2021 09:51:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2y4cmmRtpPvSvxaevDftsCUQDEJxjin0j77yOJqxv_YA@mail.gmail.com>
Message-ID: <CAK8P3a2y4cmmRtpPvSvxaevDftsCUQDEJxjin0j77yOJqxv_YA@mail.gmail.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Scott Wood <oss@buserror.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, YueHaibing <yuehaibing@huawei.com>, 
	lkml <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	Madalin-cristian Bucur <madalin.bucur@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 3:17 AM Li Yang <leoyang.li@nxp.com> wrote:
> On Tue, Mar 23, 2021 at 8:17 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When building with W=1, gcc points out that the __packed attribute
> > on struct qm_eqcr_entry conflicts with the 8-byte alignment
> > attribute on struct qm_fd inside it:
> >
> > drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
> >
> > I assume that the alignment attribute is the correct one, and
> > that qm_eqcr_entry cannot actually be unaligned in memory,
> > so add the same alignment on the outer struct.
> >
> > Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/soc/fsl/qbman/qman.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> > index a1b9be1d105a..fde4edd83c14 100644
> > --- a/drivers/soc/fsl/qbman/qman.c
> > +++ b/drivers/soc/fsl/qbman/qman.c
> > @@ -186,7 +186,7 @@ struct qm_eqcr_entry {
> >         __be32 tag;
> >         struct qm_fd fd;
> >         u8 __reserved3[32];
> > -} __packed;
> > +} __packed __aligned(8);
>
> The EQCR structure is actually aligned on 64-byte from the manual.
> But probably 8 is enough to let the compiler not complain.

The important bit is that all members inside are at most 8-byte long
and naturally aligned, so the compiler can now optimize the accesses
because it can assume that each member can be updated atomically.

Marking a structure as unaligned with the __packed attribute can lead
to rather unoptimized code, which is particularly important when the
structure is mapped as uncached -- accessing it one byte at a time
means you have eight times the latency for a simple read. I think on
arm64, the compiler doesn't actually have to do that, but at least if you
run a 32-bit kernel, the packing would prevent the use of ldrd or ldm
instructions that need an aligned word.

       Arnd
