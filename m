Return-Path: <SRS0=Cg0n=RI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524DC433F5
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 15:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D8D4C36AE9; Thu, 23 Dec 2021 15:04:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B206FC36AE5;
	Thu, 23 Dec 2021 15:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B206FC36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLQl3-1mji8v2y5j-00IVpy; Thu, 23 Dec 2021 16:04:50 +0100
Received: by mail-wm1-f44.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso3077054wmk.4;
        Thu, 23 Dec 2021 07:04:50 -0800 (PST)
X-Gm-Message-State: AOAM532vBwTSn7hyGWYk8OU8PXq2Bde9uCa3JoGDO2rwARfISTopIVqK
	RAfu2dWwVsumzOuvWE2rA1VMP2dSWYkN3zX4b5M=
X-Google-Smtp-Source: ABdhPJx87dLChts32MU9qDJmShuS/kjiyDdfWirbg/wFCSB6VkfGq1DBp9QIWOBiwEedNiMXPqADSuAryrrpbAO0JsY=
X-Received: by 2002:a1c:7418:: with SMTP id p24mr2136565wmc.82.1640271890246;
 Thu, 23 Dec 2021 07:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20211218071427.26745-1-shawnguo@kernel.org> <CAK8P3a0Pi+9tNTfaNjKCLH1f3Ge4YLW9_7o1ci1RLeuTOVEbkQ@mail.gmail.com>
 <20211221065708.GB14131@dragon>
In-Reply-To: <20211221065708.GB14131@dragon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Dec 2021 16:04:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3XTkHY0j+h91C_Vx00YXX82y_XO7+CU+QW8=6fzY43+w@mail.gmail.com>
Message-ID: <CAK8P3a3XTkHY0j+h91C_Vx00YXX82y_XO7+CU+QW8=6fzY43+w@mail.gmail.com>
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 5.17
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:flQmrHXvyoU5LdSCFvLOuaB78bCnPs3Wyj3SPPwuAr1agBX3RHi
 TzOLoergkgfD0S5QdqNKttj3hzh8c+rGBOVWG9/zc5y5IpaAt7iJy093nhlL3Cs3GVZmSoX
 zMrSBG2LkhOOWiju2bIgcR3f5RdrffxvXN1bdvdpCGuZuXWy9i1A2NXoD/J7AppD+UO7fLg
 IJGvTXVf0Jc8LDDttrwew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EyEcFXbHegU=:zOJO7OAdA4vuhSEuxPJmSF
 /p+koMATXHq7mUCbsICV4aHiKhFh8sFrOuKCE4ncK5yDleDh3PbuEUV5KrP2UlMz1QaRxhZY3
 l7aUYVsmkxRc/Hi5B8mwKu+0xRhmxI5d9VDjuUl2Y0rb/Re/tLMgYsP2O1RCun4FZ+ot7YUwX
 16ZuvJGR/KDYBSld35K/LcM32z3rJkTBphY6E4lk3dTrMJKvvW9gM2zI6kA78pT4fsnPsk7kU
 9rOo6Oo1wlVTf6jzvKC4elNMrq1HOxnXxgnwtQJll0IepiP3SU0cIG8FCT/AzzkLEhvkxcuPe
 4Emm864MFj9aO+4wIiCDoXdxb9ZqwC9Bay8lbUg/l9JAr6FjXzJKxmAKrz+PYye0cqhgtpuV0
 CCbNho0SQk7Wc0EuHCm+4GCSXj0/6sWB9kpflveafHbs8RMR6Cb3Gyb1rvOEnb7+B252iW0MF
 53Z+IY3t7bJ76bnX2NnmlGzoVAHUx3K/+64MYiMaYMyVsIAgRk52eDp2uOM/u2aoRJDEOPJDC
 In1eb7wCZ+2Y3bRNNb05qeogwPsvdwswYVP+9obJWroPAiosjg7Hx7xqgDkGCNMTugFOHIzHJ
 DfV/R/fYULp7KRAv6Q4X8YgJNiC7Mg8CCCJsrhCTURD9vb9AtiiQ5P89XfinEXad/gbbj3Tj9
 D/cqeY1mgbtFM7LdDxSqCMFn07EfUPXdDtjAuwdLLtzh+5vxSa2olCD8/lCKiZ25kNMI8TYBL
 +8+w1DVL94TK+NPMMVfWanK0XV/kViHqtqjEutd6r26F6QQGzDdNIdlIeXOdvtWi+70omM3dO
 d7wsSxOGPCyFPzcVTm6A0gwAeupKxvKHrmgyp/DFTpasbtA9ZI=

On Tue, Dec 21, 2021 at 7:57 AM Shawn Guo <shawnguo@kernel.org> wrote:
> On Mon, Dec 20, 2021 at 05:28:04PM +0100, Arnd Bergmann wrote:
> >
> > Thanks, I've pulled all six tags now, but I don't know why there are no
> > automated emails about them, this seems to happen for some senders
> > but not others.
>
> I sent the PRs in form of patches (manually editing) with 'git
> send-email'.  I have been doing this for years, and I used to get
> automated emails about merging.  Not sure what's changed recently.

I don't think anything changed, there are always a few that fail to get updated
by patchwork, and I've never quite figured out the difference to those that
work.

        Arnd
