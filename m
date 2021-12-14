Return-Path: <SRS0=nEOA=Q7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978B8C433EF
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5ADB2C34606; Tue, 14 Dec 2021 21:30:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D28B4C34604
	for <soc@kernel.org>; Tue, 14 Dec 2021 21:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D28B4C34604
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MSI6i-1n3wOa3qB6-00Sih2 for <soc@kernel.org>; Tue, 14 Dec 2021 22:30:04
 +0100
Received: by mail-wr1-f50.google.com with SMTP id a9so34684348wrr.8
        for <soc@kernel.org>; Tue, 14 Dec 2021 13:30:04 -0800 (PST)
X-Gm-Message-State: AOAM530tNwPDD0I4VBrKPFbwSivf+g9MzFyDQ1cC5HC05c57iioidQ5X
	Lax631qMZsecXcZtbtia37thTgKQAZXetGXzavM=
X-Google-Smtp-Source: ABdhPJzcegCK9YMz5uc5MEIV8QsJtofipyRKfw/xnhV/DeCAcLktjJYubEtld7Wf6tdXnIwtumoe9/2/TOT0iKczb9s=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr1617828wrv.12.1639517404563;
 Tue, 14 Dec 2021 13:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk>
In-Reply-To: <20211128200647.147058-1-kernel@esmil.dk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Dec 2021 22:29:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
Message-ID: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Emil Renner Berthing <kernel@esmil.dk>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Fu Wei <tekkamanninja@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YrcPmCbhsqlypGZvnNNC09d26C9Vz3WpO9/8QQsfqxw1Bf4/VGM
 gPxNpdaa6hwxEYoIqHGqgovIKy0fEKoaiy1z3iO6mu53UwCxnAOE6eS+zA8tdlbEo0Kb39W
 FcHMxLhSmPJonSFt0px59gxIa9q2Hm+c5tSHE4mWsBM/NQrjXR92BeA2dh3YxkEmRNXHVwk
 9yAPSSVf9OQ9VswduMcOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GX7r5MWc7XY=:ivu3MDcA1KhuB+B9o6Ja/I
 ARLzB/RSVAh02e23ham7EJeiKBouuxmVn7UY1DnUT6RN9EUL7VIR4++SNvBA0VqaDMvg8Guna
 XPAsx3HcwdEw5OnA91eSZGAetYaJFw+emQuJRA1xDSdaAZEqq5KsS44ZoNauAt9Pt0FRhLEeb
 MEMGfYGUMRsgOYUwKWCYsjmC/PVaOHKtN8XTc1bwW3F36mIi5LI/Hryn6BCgvIgjpTO+HPV+d
 ODVku8RI/5hOnxeeb8WhG9UjQaBmjzboG2ZJR70bxYgpczkOloU3Owb/H8sy1u6ROwlw+lCNG
 TFpY8s4+MwIXZK/oqOUv1wqw0DvX6/5OuKhGMnpr6AzausiNaJ5i2yqupyYkghc3zfv/QH33l
 fh+GvWFIkIHWnHdc/XYh2y3+JLPNxw1q/EK1/R6sbMoO91ArVgY5H/4PuDr89v9fD7QvjRrQp
 +DP3xbrnGPBtzSYrgc1tCWfFMw80sF9tlmK7Dm87F+dkCFJ9vO3J5qgDZ7hKL7I51yuFlsejc
 CjcoBJ6TphY5sKbPOSYqIovsXwVkbrh8+MGH90QIswn67THB76WTV8sOqIklbBz/z0w7s8m3M
 TAGIQFVDs1YjoTtdiLlqVlVc3FAmYpvjzukAdcmW6JUhQFf1cIWsJ4LfR9GOw2X/3zYOpfrh/
 /smM2wzrHrxTZ3+pHS1ofOfOg5X8uPntJ2Qdg8GW94k0//udPvDtT+9vKO59laFn2ooc=

On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/esmil/linux.git tags/for-soc
>
> for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:
>
>   RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)
>

Hi Emil,

I just got through my backlog of pull request and got to yours. All of
the contents look
fine but I noticed that there is no tag description. Please sign the
tag with a gpg
key and add a description that explains the contents of the branch in your own
words, the same way you write the introductory mail of a patch series. This will
become the description of the merge commit.

     Arnd
