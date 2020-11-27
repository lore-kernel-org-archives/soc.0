Return-Path: <SRS0=O9Bn=FB=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7589DC2D0E4
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 07:15:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 118AB221FF; Fri, 27 Nov 2020 07:15:11 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72CB21D81
	for <soc@kernel.org>; Fri, 27 Nov 2020 07:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLY3U6MT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72CB21D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-oo1-f66.google.com with SMTP id y3so900396ooq.2
        for <soc@kernel.org>; Thu, 26 Nov 2020 23:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yaxtEmqvmorbGKJnkkOGAi0ROIbuHga/om0nivkkb44=;
        b=aLY3U6MTUL5dWJ51yx3EqCGeVIF57s3SnrwJbIRRWHH1wUjzpWGvhbxj7+9L8qkAU4
         WFVkHwVupp1lxevjJtNOAMyDzwPNsxVnIhoXQOMIZYWO8T5OJGRf1Nxi5UA5etOWAGKW
         hjA1KC2oJmcYo1OpRvgw2V2Wl4C2Ry0l9nM/UUIeiILMD+n7GiLOh66BXBAZ+7+XtLp0
         +YELbcmEOAQnnvL03qfBtucnfXw21h/kZXqyPQwbcbQMbet1TOfguLjVZtP5PopZT8H5
         jES04bkn9ADkCO7hjLaAuCx8MLL7+e4r72MVV9aYBit52kFHYQx4lmUuy2yMvfk1VWyS
         zZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yaxtEmqvmorbGKJnkkOGAi0ROIbuHga/om0nivkkb44=;
        b=hgeQAsHCFPUcez4guwpSOxRL4eHeERxLUoVMpPfpi6LqbXU6nWhLFOXcs6ZC+Gr4dm
         EXZx2W49oeUzLFDGnEZsxkovb+Hx0Mq+IzhWR5bW4IuF9U/NDC9cbSAxiZ7In1omgdBM
         Jw9V3WkIKeIle1uIjZwP30X5sgRSGIRFKVMFb4omd3FRBlxVg6u6gR0IlHvM+M+qHnPY
         Y/5HuqTeCtfFjkF7Mft/RhzbdjnM8a/x/AbkvdJP8v+jd5rgyAQmuUofRuOX099WZxYu
         xmXtOWe/B5kqMCXSmt121sMEVktfeeLqnPAIUDzfPSNJ1N3LhArX9JbIo9gfsTBPSEGh
         AxfQ==
X-Gm-Message-State: AOAM532J40TC70UOjEIfXn7H0bNFuovcj8lbWbGhTdB9VMYDnN0kwscI
	nv3MSCbmoB+jrzaPo8L3Ocx5EWyTuOgnHR9YUnhBlQ==
X-Google-Smtp-Source: ABdhPJzaQ7O+e2Jbc1bKrR0f+Mraefm0He/WricXD5DvEREyOW1QEFDqCYH+RUzETNr0QT8k5tlI+7JXq4ssDiMD0no=
X-Received: by 2002:a4a:de87:: with SMTP id v7mr4592060oou.6.1606461309608;
 Thu, 26 Nov 2020 23:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20201125120134.GA1642471@jade> <CAK8P3a2CDp0KwCZjffA78fXUqOfAkvUb8Q=R64830fvvn_WG2w@mail.gmail.com>
In-Reply-To: <CAK8P3a2CDp0KwCZjffA78fXUqOfAkvUb8Q=R64830fvvn_WG2w@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 27 Nov 2020 08:14:59 +0100
Message-ID: <CAHUa44Fnj4zQ_3O+kdzVopVAggUOdb34KGnA8+r=Rp-4+etWbw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver for v5.11
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org, 
	Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, Nov 26, 2020 at 10:00 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Nov 25, 2020 at 1:01 PM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > Hello arm-soc maintainers,
> >
> > Please pull this small patch which allows the OP-TEE driver to work with
> > ARMv7 based single CPU systems.
>
> Can you rebase that branch onto -rc1? I had started the arm/drivers
> branch early on top of that, so I'd prefer to avoid a backmerged.
>
> For the commit itself, shouldn't that be marked as a bugfix and get
> merged into v5.10 instead? If it should, you don't have to rebase
> since the arm/fixes branch is already ahead.

Yes it is a bit of a bugfix, so if you don't mind taking it as that
I'm sure that Rui would be happy to get it in this release.

>
> Also, it would be nice to Cc linux-arm-kernel on the pull request
> in addition to linux-kernel.

I'll keep that in mind the next time. Thanks for the feedback.

Cheers,
Jens
