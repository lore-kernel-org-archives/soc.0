Return-Path: <SRS0=xsV9=RA=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840A4C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 12:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45574C34606; Wed, 15 Dec 2021 12:17:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABA23C34605
	for <soc@kernel.org>; Wed, 15 Dec 2021 12:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABA23C34605
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MplLZ-1m9Z9I2PtN-00qEIm for <soc@kernel.org>; Wed, 15 Dec 2021 13:17:29
 +0100
Received: by mail-wr1-f54.google.com with SMTP id a18so37870354wrn.6
        for <soc@kernel.org>; Wed, 15 Dec 2021 04:17:29 -0800 (PST)
X-Gm-Message-State: AOAM532UgtWUK1nApNeu7TZD23rvoYXWaHh4lu03IN68GAVHsS04D7tD
	Em8MlsXHVIuQkDxNDqgqHekSvdcmzu/hv3o2Yvo=
X-Google-Smtp-Source: ABdhPJy4UKqRtvfW6cQvay0TouvbgOcKUZFX6EhOJsYe0gXztFfMaTeFyMMU07ylgV4KhXO0AgB9iHRCI3fQ2oooVhs=
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr4239230wrx.192.1639570649252;
 Wed, 15 Dec 2021 04:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk> <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
 <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
In-Reply-To: <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Dec 2021 13:17:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
Message-ID: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Emil Renner Berthing <kernel@esmil.dk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Fu Wei <tekkamanninja@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6CHbl9qZntC/Q7NVpUOYaovfnyzT6Fz5CzVkq8EJm5g1ojXjVLE
 IG3yinXVc7T2JGigXYeN0CMIIxGdusii/26X9EMCBqMZbDkVIm9QeHyG4Kum/JRpI21FoZ2
 M8tlEPIWxwm7HBixG6FNS10iu8mKWK6RwTg4Y1ccwfawG7onvOTG1j4hWjrpLz1nItJdrdo
 wvDfYP3Dcaa4uFHbh9t6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x3Kztks39A0=:bUwf8IP0hqvcq9EU8KXule
 C++3ofLAjNzpky8UxtfeKcstkB3vDsECt1WvMyv+NwFZ3Hvk1BAE+cBmTLyb2ynufsqelWDGa
 pzbOb70pDxHNaUkAGS2A+XjDq1NP2FvW2YlK/sBm9mMkVZjJirkn+taxFHCc4ja0BAY8B+sbd
 DuLdlW5pqJn6EN3uCCKOJ4esb/yzePPLY8y7tTQB7tYz6uAWzi5fv7Az1nzZ13O5+gsZfXIll
 wPbrUQ0dsstHKxHGJSkw7lC5AiDfBUMMZ0UdgUPViZkO/w4oNbgkz1lKPJiTr3t1fkdSPcIjP
 qE/dyzl/GceoS/cHHDI5Q3RWUvR4spde3YtE8Zn6YPw0SxHlLKb9yAjVXHK4GZlmh8jqd5i0d
 4ACcQ+m5gpJCsDSjCGfPMC4Y+nF5x8/e4S027XwxEndZ5YbWZ12TkjhUpaj6UecfJee+7WeFr
 NdQytw8DEgkW5hHpw7/4LM5J5zBpcXr/syPF2rVElZp8OINTsMAjaR94I+JG5ddcpIiKZnlWo
 Z1b7H/sZ/orDgwSdmPLbeqcs4JWASB4dIKM6FBHXN3DlUmzASzYMAQM4X8Bbks1plEH4MclSi
 LrSaub8/b81vp8iLL/8z3Fig6EKFAG2uB4aIp+qY/j5gKzZFlmrOJ0HFHcRTNJGadRMYdN9+8
 +vOGni8he+UnbRMHrdannnm2L2AZX0N+udwZ1hTJ4F69I8A1MnufNieGg/Ede3M//ya4=

On Wed, Dec 15, 2021 at 12:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > I just got through my backlog of pull request and got to yours. All of
> > the contents look
> > fine but I noticed that there is no tag description. Please sign the
> > tag with a gpg
> > key and add a description that explains the contents of the branch in your own
> > words, the same way you write the introductory mail of a patch series. This will
> > become the description of the merge commit.
>
> Ah, gotcha. The thing is that I don't actually have a gpg key at the
> moment. I can generate one and use that to sign it, but then it won't
> be part of the web of trust.
> Alternatively I can just send it as a series of patches with a cover
> letter like I did before. That would be a little easier for me, but
> what do you prefer?

I'd prefer a pull request. The most important bit to me is actually the
tag description, not the signature. I'll go through the contents once
more anyway, which should be enough for me to merge it.

A signed tag is still better than one without a signature, that way at
least your key is part of the git history and we can confirm that another
pull request came was signed with the same key, even if we don't know
who you are ;-)

When you create a new key, please follow the directions from
https://www.kernel.org/doc/Documentation/process/maintainer-pgp-guide.rst
andyway, so you can add it to the keyring after you have collected the
signatures.

        Arnd
