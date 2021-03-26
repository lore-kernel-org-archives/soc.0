Return-Path: <SRS0=GF4P=IY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4DCC433C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 08:54:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3631619AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3631619AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4OF2j0oHboPG9AyIYphqcqevhLXwyKyiyiYqc58fA4=; b=lkBayzunW7QnpMWQduKjUw6AO
	PF/SNb4/LOjCW98pr9K1mdYNTrlU2PTMMzcRtUxmdF6mtQWagWVPdAVc4KD2P/Ehm5W7KPsLhvXYK
	1KFLnjLBzj3vWZlsFCdhxVszGaRzYAKeTBVe0DcGgVP6hlRL2Qa4Ln02Yw9OAM8USHhXMQa751Iy1
	hDFAYWRB6h79pBhnmkasmlaKmWI53Gq4p3lYtxi19gaZSWQS0dxlEMt9t1u0ijRYdwaWuHjW3faku
	J+wdG7mbU4RSw9lwlRjRoTjUvMJ4NmOzjxAIyGhm8astXHED8zsLIponlSZ1c6FKVABydANKJbK9c
	L3aOAvJMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPiCQ-0033CI-IL; Fri, 26 Mar 2021 08:52:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPiCL-0033Bb-UF
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Mar 2021 08:52:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FEE861A43
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oo1-f44.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so1144959oor.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Mar 2021 01:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM532UlYPUzjiotTiV3Vw4McjGs4cH/K0qT22a/5kB5zempU2TDCu+
 /5pXMkA3lYVZC9VicufVlxfk0MmQVbE01y+4teI=
X-Google-Smtp-Source: ABdhPJxFmzDYtA3vz0j++H5JPrGDulcgfDeMX+fhEtN0QMlJKXJwWIk94mYoTguFCR3xO2L/Mr+haF9Bq5h9AnTcBrs=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr10392411ood.15.1616748722322; 
 Fri, 26 Mar 2021 01:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org>
 <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
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
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 YueHaibing <yuehaibing@huawei.com>, 
 lkml <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_085206_390923_DA875AC5 
X-CRM114-Status: GOOD (  23.47  )
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
Message-ID: <20210326085147.SPfPxRpg0ADLT2p7VqQvQtKrVumvDEgFC2KkGYMmIPc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
