Return-Path: <SRS0=rVAb=BM=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECDBC77B7A
	for <soc@archiver.kernel.org>; Tue, 23 May 2023 06:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C04CC4339C; Tue, 23 May 2023 06:14:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DDD1C433EF
	for <soc@kernel.org>; Tue, 23 May 2023 06:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1DDD1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f607839b89so10806295e9.3
        for <soc@kernel.org>; Mon, 22 May 2023 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684822451; x=1687414451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnajTxUoiJQWeN3bk/ipx6IGatmGAm++zLeibpj6ysU=;
        b=DoUv//v/24hVrbMt6gdiY7GVF6CnF/C4EoqgswzTZcGUduJvYc13XMD7nfCNS8QoUO
         HNMI5p4+EB+dL1Aio4LmIgZjmCtODTDgaLwH9z/eCbMUIX1bxp1+ThR2r3wjwYbo/pHC
         cnkkzCsEvf/M4Jb+hYXtCkh/W/7FUt17SVT5pXyiUFq1COoZaonFRxNgiy/rn+s6moIc
         kOyBv6+7X/He++N9Owlehze0VOlwi4gWNyVpz95830vSmlpiNcvlrlB7F1IMOLZrUL6l
         wg/DVock9Qj0BFU/3uOvXveFOXACm7pUBnkkFHmnl5RoEWuU62p/v84N/ySmGROvKCBb
         kT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684822451; x=1687414451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnajTxUoiJQWeN3bk/ipx6IGatmGAm++zLeibpj6ysU=;
        b=jeA3EeSGgSjtCV4ycrxUQeVLBMvMJgEgh26ad148gI4yME+oHeUCg5XyhBdX0Nd1fE
         qrvHK1vJxSLVLqaRkZHCKOHWThvGemo9ZI/OX+BJmuj5RBamOyy54UJqtIGFADyJokTH
         GFoJM8fm9tzW3FK52y6SZtByegFGwraI1UYmATnFgcmRdE91/9huVKeSAQc9oGWyRF6r
         WlrMGOIVUrBTT8J3X7/Xvl8/lz9aGX7swO9eWo1Ii05FIfdVEgYR5nu3q/m8iBugJr8q
         zHZglMXC4Q9VUqG2QH1vhJsDlKH6bVMTGfOstUCHdulF8seW1QPJnoPTi3WLuiN5pvzY
         JmxQ==
X-Gm-Message-State: AC+VfDwtCFnj7hkYOwPtjllFCV0n1X3Ghuyc8CXRSGLVe3oSi1lAeeFJ
	gctf5/qVqq2jZ2puZXMOQow7E9VIvHBIg4FZFiHBug==
X-Google-Smtp-Source: ACHHUZ6owQ+ZG8dqCP6VbRNTN0gxeqj1kSVszEEZQzN9lYWW8+LBPQLRQYOPLg1frS2IV+6NwoPuJ3ZbXKeiCWo6UI4=
X-Received: by 2002:a7b:c456:0:b0:3f6:8ef:a213 with SMTP id
 l22-20020a7bc456000000b003f608efa213mr1555834wmi.28.1684822451253; Mon, 22
 May 2023 23:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230421075443.GA3136581@rayden>
In-Reply-To: <20230421075443.GA3136581@rayden>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 May 2023 08:14:00 +0200
Message-ID: <CAHUa44GOzp-w0vqxEqw8uVk95x+tM-H59gY0EyqjYB+H09a=LQ@mail.gmail.com>
Subject: Re: [GIT PULL] Fix uninitialized variable in OP-TEE driver for v6.3
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 21, 2023 at 9:54=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this small patch fixing an unintialized variable in the
> OP-TEE driver. The error has been reported recently by the kernel test
> robot.
>
> I realize that this is late for v6.3, please queue this for v6.4 instead
> if v6.3 isn't possible.

I noticed that this hasn't been merged yet. Perhaps it fell between
the cracks, or do you see an issue with it?

Thanks,
Jens

>
> Thanks,
> Jens
>
> The following changes since commit eeac8ede17557680855031c6f305ece2378af3=
26:
>
>   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-a=
sync-notif-fix-for-v6.3
>
> for you to fetch changes up to 654d0310007146fae87b0c1a68f81e53ad519b14:
>
>   optee: fix uninited async notif value (2023-04-20 14:52:25 +0200)
>
> ----------------------------------------------------------------
> Fixes an uninitialized variable in OP-TEE driver
>
> ----------------------------------------------------------------
> Etienne Carriere (1):
>       optee: fix uninited async notif value
>
>  drivers/tee/optee/smc_abi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
