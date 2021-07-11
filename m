Return-Path: <SRS0=I37k=MD=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5044FC07E95
	for <soc@archiver.kernel.org>; Sun, 11 Jul 2021 01:42:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE5236135C; Sun, 11 Jul 2021 01:42:02 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88ED061289
	for <soc@kernel.org>; Sun, 11 Jul 2021 01:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88ED061289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-io1-f53.google.com with SMTP id k11so17706162ioa.5
        for <soc@kernel.org>; Sat, 10 Jul 2021 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DviByeW/MRd4o8QAxjQbNiyDl13TlKgHIeZcYevPf8U=;
        b=aEKYNlLyKmBIhtj2zpIjSnRJ+Qd4EOAwRFeseUtJvCj6OD+ekcsQK39PN/zn6cNbHl
         WGSEQ2S8qlVvBsOEXTGLUc/zrTpNltS/TXx2jqMA41Jqqjmj/Af+gcz+Wfc2H871qsbD
         kKOMiwfZo5T7EKQAU1PHMq4l/nkGMMHdValSnpEVrSptiF7e6jcC1kJ19HoiU7LfIZkF
         /XwH6CJ/JhwJf3FzqaXGVRZUtIzo6ZiOIzO6wkbPoi+W9jHLWPTMvUOdtbP8FR5nZFlA
         lC/t59OmgEJe5VGRTKxlrBEtrR3vgxjt1E3MV5HMMAyFnqCO9LazZ+8fTjSIz9M7RjA3
         IFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DviByeW/MRd4o8QAxjQbNiyDl13TlKgHIeZcYevPf8U=;
        b=TZd8RiScrPLxDAVc+VIpql3XxeKY214w8vhI0cOmL0Y/KbmaIH5PTDHZ4sLxEaCtp5
         AHFzhRDdKTDb0J740PyjyEBTMmxuanytxFXu//hHCmKhkbLKrXwa4jWU1JftjhRI2yj5
         aye9a1aZbGbS3AOXTKc0bMAvZ+Bb/D6b0UYVRFCG45DURX1YZGhoqgai0VatMryldgHr
         u+r8/6JbGi3F5XK2+3c4XFUkFWZa4GPLwQjEyiJu+6am7WtGri9Bv48VJmbly7QrXkwe
         VhCjguo/0pwSeHl7rSE+vGW1hu0J0lLF8t5EVwD6Eq+WYAe7pFTFghJxSfaLEjvmC9+c
         Uomw==
X-Gm-Message-State: AOAM532sXBG6IEgpQ61VBS/5uwQvVJzdPaZoROyt++YQNzORYFtQmg2m
	LmH38cH9Pzf6dENSkqfGdajVInFgKeMer1pYfO82Ww==
X-Google-Smtp-Source: ABdhPJx+rpq4HSXSp6jfp7UQ0J9hdUAfM226zfK6hZLavZmabddYLhfL+ajhRe1PyVE3+Be8kXbBeehdncaxRpDO7es=
X-Received: by 2002:a5d:9051:: with SMTP id v17mr33836994ioq.81.1625967721832;
 Sat, 10 Jul 2021 18:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-2-olof@lixom.net>
 <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
In-Reply-To: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 10 Jul 2021 18:41:50 -0700
Message-ID: <CAOesGMjzU7bgX97_N08sLPsEew_6iHeQAi4EKgFK9EZVmMP+sQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 10, 2021 at 9:45 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What?
>
> My shortlog matches yours, but my diffstat isn't even close.
>
> You show 554 commits, but then your diffstat as not a single file from
> arch/arm*/boot/dts, and says:
>
> On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
> >
> >  97 files changed, 8428 insertions(+), 5174 deletions(-)
>
> while mine is very different indeed:
>
>  552 files changed, 24060 insertions(+), 3691 deletions(-)
>
> I suspect you got the diffstat from something else entirely, because
> mine looks a lot more believable and matches the commits listed in the
> shortlog a lot better..

Yeah, this was an operator error at my end due to the workflow I have
when I generate the pull requests. Thanks for noticing, and as you saw
on the 3rd branch, the info was swapped between them.

For more detail in case anyone is interested:

I merge the set of pull requests one by one on top of your branch, and
then run a script that generates the pull requests. At least when we
started out, git request-pull got confused and generated wrong info
when we had complex merges.

This time around I generated them backwards: Merged all 4, then
generated the last pull request email, reset back to the next head
(with the previous branch), generated that, etc.

The mistake here is that I mixed up the order of the two middle ones.
So I specified the tag (and got the commit message from it), but
obviously the diffstats and the shortlogs ended up generated from what
was in the working tree, i.e. the other branch.

My bad, and something I'll double check for in the future or add a
sanity-check for in the script.


-Olof
