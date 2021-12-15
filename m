Return-Path: <SRS0=Tbsy=RA=gmail.com=emil.renner.berthing@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A0C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 12:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF23DC34603; Wed, 15 Dec 2021 12:27:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2451C34605
	for <soc@kernel.org>; Wed, 15 Dec 2021 12:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2451C34605
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id o14so16270357plg.5
        for <soc@kernel.org>; Wed, 15 Dec 2021 04:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdrzgxxaZww/l2rcuws83urbBn8Do58NhJhBwCmMimg=;
        b=p0t/pDh5MUWWjWqJmi3N3f23i7I6qDJKFPB+hXc1DbixPnm6Q4m4BP822EELSZ6MNg
         04R2kLYoBDWUIq8LUGqCzzaVXM/6kngfCl1yPW/ciC2qZMAlkPB5IArwEVh6xctiVXJB
         TjQAtKE0fjIWzd213V0XGFQiLNx8lwC+BPYleB6EZFoLZCvXIOeePjLqHdlwid508OT/
         Bvde4bmLVURMzfSPbMzDmUlHwutJoyHih50KDuIQzbBGHTnFmkB0BGJrEXdkZ1tSeFU4
         drdMMSzbp7R3nfd0q4moE1A8UHPn4a/FGG50SxGZ4wyNyAe+iuuU7UWBzbh+s6blhYqc
         SOqg==
X-Gm-Message-State: AOAM532YiebkTbuDmijjjiPoMG44TURvt8mbLe3nG//rNP4Rr8uXwWau
	VtlSjb/u04DZ/5kf4b7F8JMkIvlUMDCTLdnDDIU=
X-Google-Smtp-Source: ABdhPJzWiB8wF41D06DYo6PG+1QNnBepipzq/MOuOKTyB4bOog9Jp145EzqkGXttyXYbnSXsvMrFXkPJGZtAX6aYHO0=
X-Received: by 2002:a17:90b:4b0e:: with SMTP id lx14mr11591436pjb.160.1639571235268;
 Wed, 15 Dec 2021 04:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk> <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
 <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com> <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
In-Reply-To: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 15 Dec 2021 13:27:03 +0100
Message-ID: <CANBLGcxzdx=Rr1J=UnOTVpYybCpZPFYfPLWtd7QP8k9E-G=CQw@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Fu Wei <tekkamanninja@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Dec 2021 at 13:17, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Dec 15, 2021 at 12:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > I just got through my backlog of pull request and got to yours. All of
> > > the contents look
> > > fine but I noticed that there is no tag description. Please sign the
> > > tag with a gpg
> > > key and add a description that explains the contents of the branch in your own
> > > words, the same way you write the introductory mail of a patch series. This will
> > > become the description of the merge commit.
> >
> > Ah, gotcha. The thing is that I don't actually have a gpg key at the
> > moment. I can generate one and use that to sign it, but then it won't
> > be part of the web of trust.
> > Alternatively I can just send it as a series of patches with a cover
> > letter like I did before. That would be a little easier for me, but
> > what do you prefer?
>
> I'd prefer a pull request. The most important bit to me is actually the
> tag description, not the signature. I'll go through the contents once
> more anyway, which should be enough for me to merge it.
>
> A signed tag is still better than one without a signature, that way at
> least your key is part of the git history and we can confirm that another
> pull request came was signed with the same key, even if we don't know
> who you are ;-)
>
> When you create a new key, please follow the directions from
> https://www.kernel.org/doc/Documentation/process/maintainer-pgp-guide.rst
> andyway, so you can add it to the keyring after you have collected the
> signatures.

Nice, I'll try to follow that then. Thanks!

/Emil
