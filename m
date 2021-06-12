Return-Path: <SRS0=I1vS=LG=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B07C48BCF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 17:03:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D95E611CB; Sat, 12 Jun 2021 17:03:35 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC98461357
	for <soc@kernel.org>; Sat, 12 Jun 2021 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC98461357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f174.google.com with SMTP id c18so19266728qkc.11
        for <soc@kernel.org>; Sat, 12 Jun 2021 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=71ddPGTVgi3kmqZ+vnJW6DPtx5A785PjouLOdvG++zA=;
        b=vrxbnEdRbCD5+WoNPmlQ0WTB9AVWDw6LUKHGI3qNXoTD8gWHRXIdWF/Uh0idLiDSBJ
         hJQ4CyuGR6ftCf8WGlkn7sihIRgL5PVdJ4nGpzzFbPfVQihvwCIcVk6ljBwaQ9eApHER
         4yPNEOzuQqQNPhdlLWbuI0tybjlZisBb6OPiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=71ddPGTVgi3kmqZ+vnJW6DPtx5A785PjouLOdvG++zA=;
        b=unIAcE2xvlrMOzKpHsVfzRCU5ucVvUMMsOKISJCAJ6UggXalMIjmn3UeXbkkj3jf2q
         wgjVuQ420uAk5yohqYgRVfsMI3t73Zk/Tz0mGmxPG3Uzv4wynZ/MvxUtT7/I7VEc0kHA
         8tDW5vSS8QKp3ZLBG2EdXNeY1TLVjsk2eszARepCFLzu8RulQwbRMLIwy4MlflZO2J4p
         e9e7yfYT/MAyOaNHHpj7F/Pyg/rMx2X39z1hc+QEscUfD0/PyHU5ljvbma8plr9JcY4L
         5FD7F42VSdt/6REEsDU8Ocbq14ox9WoDVMKlrHrmnHPIqOTDawN6uXuLhaVPfdtUWgQz
         9wXA==
X-Gm-Message-State: AOAM533ys7gfT/p82xSzISdpBIL7aX+Q1A0tQOV8eS1kMa4+qV1S3sOT
	zDEO/FcAcwVqvsHwH3GaI76OBCclIgCMmt6spp/XKA==
X-Google-Smtp-Source: ABdhPJzSZEFI/aFcPy8IvaFy0dlqizShdbS2S4QT8CXM1JGYQotzIAaT0UYVOnEUQScHKymXgQbSToGX9tCR6ntPZAk=
X-Received: by 2002:a05:620a:e02:: with SMTP id y2mr9470640qkm.54.1623517413796;
 Sat, 12 Jun 2021 10:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PXkMSDvks+DeCNJ6iKf6zDH0VaOL6msirR3g2K7BNL8YkQ@mail.gmail.com>
 <20210612155953.GA11724@lx2k>
In-Reply-To: <20210612155953.GA11724@lx2k>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 13 Jun 2021 02:05:35 +0900
Message-ID: <CAFr9PXnuoonY=m53==hyAo4Con_3-Fk_3KEfQp4sfLKBZyGS+Q@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, SoC Team <soc@kernel.org>, 
	Romain Perier <romain.perier@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Olof,

On Sun, 13 Jun 2021 at 01:15, Olof Johansson <olof@lixom.net> wrote:
> Overall this is the right way to do it, but my tooling spotted a miss: You
> didn't sign off on at least one of the patches you applied (the UART one). Make
> sure you do 'git am -s' or similar so you have a S-o-b entry when you're the
> one applying the patch.

Ah, so there should have been a sign off from me for Romain's patch
after the existing tags.

> Mind respinning the pull request with that corrected, so we avoid getting an
> email from Stephen Rothwell about it too? :)

Sure.

> Beyond that, keeping an eye on how you sort patches when you have more
> material: In particular we keep DT, soc, drivers and defconfig updates in
> separate branches as much as we can -- sometimes dt-bindings need to be in both
> DT and driver branches, for example. That doesn't apply to this pull request,
> since the MAINTAINERS entry and the other one fix are fine to bundle (they
> would end up in the 'soc' branch at our end).

Thanks for the heads up. We should have one DT patch for 5.14 that
I'll send a separate pull request for.

> We can tweak that over time as you get more familiar with how we separate
> the streams of patches.

Thanks!

Cheers,

Daniel
