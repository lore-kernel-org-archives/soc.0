Return-Path: <SRS0=FMNg=SX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A69C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF48EC340ED; Tue,  8 Feb 2022 10:10:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2EBBC004E1;
	Tue,  8 Feb 2022 10:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2EBBC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAwPf-1nSh423Y77-00BJtZ; Tue, 08 Feb 2022 11:10:39 +0100
Received: by mail-wm1-f47.google.com with SMTP id r7so11752230wmq.5;
        Tue, 08 Feb 2022 02:10:39 -0800 (PST)
X-Gm-Message-State: AOAM530CdaPsvLomnOGRm1SjnSy/TRQMPABlDlbEw19lsAxY+6/1jF3H
	g2lkeb0A3VfDr6nExsZSh/0T7HDvaYBiCcjpw9Y=
X-Google-Smtp-Source: ABdhPJyOxTF8A1YA6jDmIdIk99ulH6BRKsAlaMSNbXcJTtDT/l8Rb+MtroSVSLXPuDD8bb6T8hIYbFrFUtprUhfJcBY=
X-Received: by 2002:a05:600c:1f0b:: with SMTP id bd11mr487054wmb.82.1644315039236;
 Tue, 08 Feb 2022 02:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20220107033736.26762-1-leoyang.li@nxp.com> <164167921430.24856.5117528642270798509.git-patchwork-notify@kernel.org>
In-Reply-To: <164167921430.24856.5117528642270798509.git-patchwork-notify@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Feb 2022 11:10:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0w7S6B3SVw+esH2H=sg9jOTGK3yC3hQSwRRM6GhosdkA@mail.gmail.com>
Message-ID: <CAK8P3a0w7S6B3SVw+esH2H=sg9jOTGK3yC3hQSwRRM6GhosdkA@mail.gmail.com>
Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v5.17)
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VqusHpmH2e5Uq6YwIJNAAiinkaecEUeNM1ioIlnJzWforkQCImC
 F3dH2m1bvsIDbKBoGmgIBC+fC/p9NcJZvHHo8v40/E9q/VKlgfEzEuFsBLpqdERlg5ZrKZ7
 gua/tY4pSHBoq84JXB3Rpm/sxT1abM5XNlhy6Lb4celjdg7GC2NdIl8gXKk+G5aEC+EAQ5F
 m24RZfoMA9o/fiTsvehEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ukEfmJHBuz8=:ELqm5pv6yOqsdLWmV18cni
 e5twK/Agu7G2OeY3m06ZM/jWPIYBXN0qRRJ6RR7Bp1sy3qyf51M8xrasOx92IIHzhFb6hHa6o
 TDEcOIfxlu//+kVWeNv/cmAxm64Lcp57OTAsPq1q5mgy8RwFVLZ2qd3O5rwOnAfntOcMa6SHm
 H9ZrW6lXdx5c78EnpcEqvnArwayr4C/VYQIfCc7YLlPWDRk+XMF5HjZF+p9d8Pso8rJn02yit
 KtPWh1vLVlxCnFvrm8DeAnfH8vSaDUAXh0Hl7s36GWQx0656Z772K4PjhHd4t+A0LXyEchpPl
 5YSOD6CGyMS6IPTbFuFQwmSPXVEgRxDl+ObQAxzzb0YLOZwEXfLeL4/7qiOjEcpgklJ2Nyrsw
 kwDI/nVphB3BA9KKtyfr18slrl/5BdAimy18ZfeaISAx5jQPg6V2IemQIijEDjk3wSVFkOJyC
 gwRo/qmpDecVp+aRcxqwuagEyKo2UItCDWGXonZgjow3XO97DGpnnzUWCoQudYAUG0Z0Yq0fT
 wDUVTZ5oI85Xq2UFVFx1SIC5C91JmdRb0R/o4kC6LVV06C9x9A0pX1FMAIeMF2w7lm7fEx4Cv
 XXuhxuGr6k/Luk1lgNzj1JQshnXmSGMtUxxFBIo3W/V9oGcPucYHcbJZ1ayEFS/diiKsDkvvl
 4Ks0bZlp/K9Jb3ZNRb1fwDRptw/m7qbAfHpVd0Bgkx4RJhYazIxrIWeMm13FuhVq5YzI=

On Sat, Jan 8, 2022 at 11:00 PM <patchwork-bot+linux-soc@kernel.org> wrote:
>
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Olof Johansson <olof@lixom.net>:
>
> On Thu,  6 Jan 2022 21:37:36 -0600 you wrote:
> > Hi soc maintainers,
> >
> > Please merge the following new changes for soc/fsl drivers.
> >
> > Regards,
> > Leo
> >
> > [...]
>
> Here is the summary with links:
>   - [GIT,PULL] soc/fsl drivers changes for next(v5.17)
>     https://git.kernel.org/soc/soc/c/6b6db66fb373

Hi Leo,

As you probably noticed, this branch did not make it into v5.17-rc1
because of a mistake on our end, and I have now dropped it from the
for-next branch.

Most of the commits here are bugfixes, but I'm not sure if you
still want all of them in 5.17. If you can send me an updated
pull request for the important fixes, I'll put that into our fixes
branch, and wait for the rest to come with your 5.18 updates.

        Arnd
