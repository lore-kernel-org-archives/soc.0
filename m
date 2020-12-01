Return-Path: <SRS0=ldSp=FF=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34418C83013
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 11:40:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3D712080A; Tue,  1 Dec 2020 11:40:23 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8132086A
	for <soc@kernel.org>; Tue,  1 Dec 2020 11:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWLipCkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8132086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=ulf.hansson@linaro.org
Received: by mail-vs1-f65.google.com with SMTP id z16so726347vsp.5
        for <soc@kernel.org>; Tue, 01 Dec 2020 03:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHxrlVBCTjPKP/VUnD+mbmSFpP0ytfWyMwwxTHspAB8=;
        b=OWLipCkCBJn/jipFu+ISagY/QhmBkwUNlg6y3RcFuKrA5N3DtRiwpogZAELnrnTTo+
         MeAUdR6NJpvH8Y+/POEx4QkkSAdJEbWy+NSaPEtuacDQEID6hzuDKqqO0O3NgjagWFAC
         NesVk3z45maSmAp+cgeM3qjWar81ftmJ58Regqbd1umnXOq4aNt9C00rk3ocUFu1D2nI
         4vc+5yQL3fPsxXVxD8R+sqnFjaXpEs7EbCyU/plgdAcvl/peL3I/5LHPQn/Gvmv3ick8
         U1+dWrINBCMCyumMZPg/7Xnn350cgb1aG5phKCb/hnBlqCreiqI9CKbDKRP3nTqJbogA
         uX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHxrlVBCTjPKP/VUnD+mbmSFpP0ytfWyMwwxTHspAB8=;
        b=IMkeK2hSvmbz09GpnkB4xfhS7jXRyzVIK5qFWGyM2zkW4v65ue85wqi8rafsTDyEW+
         wmg+i9lb7IIhhxubFZG8TXrG48vMRZfmcX8gDOKfOgXWmVVD+E6epuqA/ViWNTyEFF12
         uayBkh/0EuseYIUuKHzhPLUPD51AW9B6lwmEODPM4BNtguuFNd6AudeaSFRCho4fw/eG
         UjFeumAxvtgorbVJ39KfoifoPpBXcXE7fKkbot9wHVtCcbW2TvuM6q0d8YClRQnYFFJ4
         LHwO58iAPmW3e+W0DkRP4Mm93/Gy1NnVNc14tFddPzJYSuX6NFkmWnxG2yR/2kI2B199
         ETDw==
X-Gm-Message-State: AOAM533MT/B6Mho4wqb8f8TyzWxxMaNUdkhveKKjteg9EjizScPpbFJv
	uW9Bb6NB9I5dudcTEqE2/hPn5Q0cFRk+0Q9plBz3zg==
X-Google-Smtp-Source: ABdhPJw32NhkoutBCj2KvRWJ/V6vPOEdM7R58dpTqlVdPRDe63CE/87Scp3Ccq6bXjizjJN5P5xMk2yH3sG+S+fzLbM=
X-Received: by 2002:a67:ce8e:: with SMTP id c14mr1844642vse.42.1606822822298;
 Tue, 01 Dec 2020 03:40:22 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com> <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Dec 2020 12:39:46 +0100
Message-ID: <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Nov 2020 at 19:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Nov 30, 2020 at 10:11 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > So I guess the answer here is: strive very hard but you don't have to
> > guarantee that every corner case is covered?
>
> Yes. Covering every possible theoretical case is basically impossible.
> I mean, it can be something like "the firmware glitched for whatever
> reason, and didn't set up a device, and it didn't show up at boot at
> all until you did something explicit".
>
> (Example: airplane mode wireless switches, but also possibly things
> like just slightly unreliable USB hubs etc - I bet we've all seen
> those).
>
> So the rule should be that you strive very hard to make boots have
> reproducible behavior as far as practically necessary, and avoid
> obvious timing-induced ordering issues.

I agree, but let me also try to clarify a few things.

Indeed, we have been striving towards getting a more consistent
behavior when assigning block numbers for MMC/SD cards. Some time ago
the number depended on:

- The time it took to initialize the MMC/SD cards.
- The probing of the mmc block device.
- The probing of the mmc host drivers.

It's been highly random, unfortunately.

Therefore, we have and are still pointing to things like "disk
labels", but those have limitations.

A while ago, we eliminated the impact of the two first parts, which
left us with solely the probe order of mmc host drivers. Furthermore,
we recently introduced support for the mmc aliases in DT, in a way to
support cases when a "disk label" is not feasible.

>
> > In a traditional PC I think there are fewer dependencies?
>
> I'd say that they were "different", not necessarily "fewer".
>
> > I guess the question is: why is static assignment of numbers not an
> > acceptable solution to the problem?  It gives us the desired fixed
> > numbers and automatically avoids all weird probe ordering / dependency
> > problems.
>
> I think that if this had been done originally, it would probably be fine.
>
> But I still have this - possibly unreasonable - expectation that the
> promise of DT was that it wouldn't be 1:1 tied to the kernel all the
> time. That was always the promise, after all.
>
> So the whole "add DT markers because the subsystem now screws up
> ordering" smells really bad to me.

As stated above, the randomness has been there all the time. We have
had only "disk labels" to help and that's what we have been telling
people consistently. To me, the new mmc aliases in DT, is another step
in the right direction.

That said, perhaps we went too far to optimize boot times while
enabling async probe for some of the mmc host drivers. Clearly, not
all users have been paying attention, but was lucky to receive
"stable" mmc block numbers.

So, I think we have two options. If people are willing to move to
"disk labels" or to patch their DTBs with mmc aliases, things can stay
as is. Otherwise, we can revert the async probe parts of the mmc host
drivers, but that would still leave us in a fragile situation.

Kind regards
Uffe
