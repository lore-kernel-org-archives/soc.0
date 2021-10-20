Return-Path: <SRS0=LSP4=PI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAF9C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:31:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 293ED6136A; Wed, 20 Oct 2021 13:31:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B636128E;
	Wed, 20 Oct 2021 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30B636128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPXxi-1mHmxK2T3q-00McqL; Wed, 20 Oct 2021 15:31:16 +0200
Received: by mail-wm1-f41.google.com with SMTP id o24so11623964wms.0;
        Wed, 20 Oct 2021 06:31:16 -0700 (PDT)
X-Gm-Message-State: AOAM533BA7DpHYcnkCeeGkD7XVezmEDyF9XPeGDdVMuD8wiM8NOSHTp0
	UjhAh6QrfYG5D+RIPl3nK+ugslD0hhnFsASNuMU=
X-Google-Smtp-Source: ABdhPJxKVpH5wqYslRICglnTTCwvnfIARjkCHAfultNMD0mtol7UBcncx8Fq5w3uXSIA3llnjypoIoGL1Bhg8ZDtKwY=
X-Received: by 2002:a05:6000:18c7:: with SMTP id w7mr3065306wrq.411.1634736676095;
 Wed, 20 Oct 2021 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211018095848.19101-1-romain.perier@gmail.com>
In-Reply-To: <20211018095848.19101-1-romain.perier@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Oct 2021 15:30:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
Message-ID: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rygoyi3gRsfI08fzR+RX+fhxsNr3+aoEr95vladdBcAT4BGw2zB
 amQ0Y4CM4vrnc8E17VIySeG5jtAtfbslnlHi+TQRFwdHtCQGQ2k3fBVYb7cKDwmGRlt/mKP
 chgKzV56sEK57GzjCgFzJDQKeU30QCjfkI5TY8Lak7SKYFlp3ogO5JLNIcNgbnm9d/4jtzr
 etKxVtk+ernb3hXjwYv9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x5RtZT+Bp4o=:h+JW6aUe6J5iJsi4zoRGxN
 7G4sut7v9cpNlaM/qPIm3ywdXRwAWd8p5prY0vUbzshWZaNCNdyplksa8Tlgg69nwDChWqhbi
 dFWkF7oS5xSPbsl2vr3NOBrIHqZwMa3kJcKppS0rnc7t4epkXkOvcTD8SQNHwYUVwYs9156nD
 AEiZrjpJyCqAirXLwm0PKaltVmOt034Q0/DoybOTyCu/T+z3933CORR6bB+3Qeb2oMWrrj2EJ
 rS+2xU2cnE+ceTUS12jK5uOpy1s7Xe/AJ8N8zQxGmd4n42eXHqLYwXYgDowbCPrmcacwrtffa
 xBOkOHWU9Znyzxif/Sqmhn44eDj39+VOb6wyZbynxTkaeATj+ONncrwOdE+51mIIamaotYPdw
 r7af07kI7ditnV5c99SQKasIsil2NZJBFkVZ6hwdhNio4lwO/tV7slDuwBjK8EZXqnF+qOGCD
 wphKA4XykNjHpSaEjqbQGMrBZiiP0s6zjPajVZVp62PJTClwqEFnYGLbzeaC2XOcO+1+kM+2e
 IQm4HJxHrq/SznO2xtlsADNWA53aDdU49YDQ8Be1/gwsXURHWtkAQ7+P+tuwmG/0Cp5UQmPRo
 QfzQrs3p5I5jrdGNEz5wYbual0OxwWS1PoOHRNShTNRTeyNw4V3ZTV00k/o9zW/dk+vA3XGzW
 ymZSK8h4Do0MWc/Poymd/iMZP6m7Jq96UFg7A18KPFAQedthmNwHanTWF20794FWiR1cQ+Xa4
 Y2Ps2ehK1ZWd9aobR2gp2xy0ZNErVj+i/yPIXg==

On Mon, Oct 18, 2021 at 11:58 AM Romain Perier <romain.perier@gmail.com> wrote:
>
> The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:
>
>   Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/linux-chenxing/linux.git mstar-dt-next
>
> for you to fetch changes up to 7e626b6d71e7678e85e9e06e9e2271b5923741fd:

The contents are ok, but you have based the tree on -rc5, which would require
me to backmerge the new upstream contents into my branch and mess up the
git history.

Please rebase on top of v5.15-rc1 and resend.

       Arnd
