Return-Path: <SRS0=Tbsy=RA=gmail.com=emil.renner.berthing@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B922AC433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 11:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ACBAC34603; Wed, 15 Dec 2021 11:25:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A568C34605
	for <soc@kernel.org>; Wed, 15 Dec 2021 11:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A568C34605
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id v16so3908281pjn.1
        for <soc@kernel.org>; Wed, 15 Dec 2021 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IDgK5WljJsEE72tHFtmh4oft8f0ktjQWWP2F9+hZzz4=;
        b=B3MycGvi03GA3inRJtMm/lYWi+0fy4xncM5hDWsJ4P9xdnn//0EiePaOnkJfjq0xAP
         jXqEQZiPS8aEtguBuHMSis2l2qtQAZs/5LNSZyTo6q6zTnnSTYQmdex7+SlzY/mFbFH7
         2yacwVtPmIl1OBQ7obeyri+Erb0ZajUBE9WcdBXqGpw7iyZd/zETESXzGrEFFcdHRUme
         46vPZxxmH7ma9cw5jrdCm2kdami+5mhomkLy9N0v8RzeWR088qwfGRp46LZCzpeCmPpE
         oQ2o5vFphUmYb//4/qoBdlHtg7fDm6ThZhL/zLMgNuhBI+Afl495ys19XwSe0O6Lz8u2
         ndRQ==
X-Gm-Message-State: AOAM5305ynPKAe9fs1zBanCmzk6txvJ6cqJzesEeXBADTplEaDoYurRH
	1gxOrSRT00VYzT0pSMwvVmcvsUypVq6Ewo5pKoQ=
X-Google-Smtp-Source: ABdhPJxTjHnpffSsJmC6035WY0c2cEKJBF+ezsbT8VP/RTa/MAIljU1RvMTr65MIjBK9RD0SZSLczAStlVujCTlQBMg=
X-Received: by 2002:a17:902:7616:b0:143:a8cd:ef0 with SMTP id
 k22-20020a170902761600b00143a8cd0ef0mr10339972pll.48.1639567518745; Wed, 15
 Dec 2021 03:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk> <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 15 Dec 2021 12:25:07 +0100
Message-ID: <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Fu Wei <tekkamanninja@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >
> >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/esmil/linux.git tags/for-soc
> >
> > for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:
> >
> >   RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)
> >
>
> Hi Emil,
>
> I just got through my backlog of pull request and got to yours. All of
> the contents look
> fine but I noticed that there is no tag description. Please sign the
> tag with a gpg
> key and add a description that explains the contents of the branch in your own
> words, the same way you write the introductory mail of a patch series. This will
> become the description of the merge commit.

Ah, gotcha. The thing is that I don't actually have a gpg key at the
moment. I can generate one and use that to sign it, but then it won't
be part of the web of trust.
Alternatively I can just send it as a series of patches with a cover
letter like I did before. That would be a little easier for me, but
what do you prefer?

/Emil
