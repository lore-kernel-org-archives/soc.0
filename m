Return-Path: <SRS0=Nfb+=I6=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D6FC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 12:33:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8BF8A611ED; Thu,  1 Apr 2021 12:33:06 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B2D611CE
	for <soc@kernel.org>; Thu,  1 Apr 2021 12:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B2D611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-oi1-f171.google.com with SMTP id a8so1577624oic.11
        for <soc@kernel.org>; Thu, 01 Apr 2021 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYBBXqXjqIEWJW+a8G61y+9V36oyZ8bqWDrWT4tmnlc=;
        b=Kg+n6DGxQjSdU4ERhysXZ45Lu56R/0K+pTJJpe7815cK0Mtt660ipOl4qwNPU4lcta
         D4Txr9k1sgImDF7ualRrC8EbqCfmkPSUJ77tRSvAVuybaC8ZFEyy/R1YoD9KeMWsD5Pf
         Va4I7+ZprD3HxQ38wydSNIyjUhtkGpZ5tMGHOAbBD7QkXTT1ml+30AJ7lVEouAAqkuFO
         cUZ/MWeqUnCB3VRNPawpvLBIaN7SP5j/o/91ArNzAYd9WNfyw8mb+LXdkN10bEkAsJH0
         Ypu6ls2y57tvLHQLdxKEXAQlfFU+8Q7KGg2Faf68A348V3OfZOfapnu9I3ShOmnGCslj
         RloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYBBXqXjqIEWJW+a8G61y+9V36oyZ8bqWDrWT4tmnlc=;
        b=AAMwGagbQqI6JSIOWV7BQHbqGzK5HpAOfx1HN72cFlvKVlK3pA+u6O+OCPu0mnKzwd
         r12carpupxBJzukIs2yssQTbochZLVJR4QmyNoNt/gDCl5mcfuU1NVXe0WU9lMkYrYlL
         towvuPQVs4YZaW+6E0gp1cC+nrkIiFYxNjJMeb0m/zYu8TcVXmCQ+gY6kbU46UFmMKCb
         vWz+HDKPJl0zD1YR3bXUliFV9yyS8kd7HOx50GZktwn4WarfgAAihPb9vDKYNbIlXXCU
         1ef8/e8mPRyyidptz/4hiyLl0prk7+jzUfuW97c1x5IMT4WcWx0faYGIGhoigmhhdLgw
         y4VQ==
X-Gm-Message-State: AOAM533k3l5BJU6DsHHqTvKAqHYrRuaWXBPloPrMETK7Xyvzwfv7VOj+
	+SjgfWCUbTTPcRIuB+rrTdI2WXsW1SMVuLyJryFCOg==
X-Google-Smtp-Source: ABdhPJywnxWEEjMlE4aBIUeotkDIUC9+UKYA0hL+/WDzMmkmPSd5/pgY/hKusGxY9ewHKyLtBan5czoqJBH63756PxY=
X-Received: by 2002:aca:7c4:: with SMTP id 187mr5765643oih.47.1617280385522;
 Thu, 01 Apr 2021 05:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210330082208.GA965793@jade> <161727243793.583633.7984995735453542553.b4-ty@arndb.de>
In-Reply-To: <161727243793.583633.7984995735453542553.b4-ty@arndb.de>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 1 Apr 2021 14:32:54 +0200
Message-ID: <CAHUa44Fdvhj2ca4O+CxD94YZ6BtzNut9HMn3FxDshh_vgHVwDA@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE tracepoints fix for v5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 12:23 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> On Tue, 30 Mar 2021 10:22:08 +0200, Jens Wiklander wrote:
> > The previous pull request for OP-TEE tracepoints introduced a build
> > error when building whithout O=..., apparently many regression builds
> > uses that option.
> >
> > Please pull this small fix for the build error.
> >
> > Thanks,
> > Jens
> >
> > [...]
>
> You asked for this to be merged for 5.13, but as the change is clearly correct
> and required as a build fix, I added it as a fix for 5.12 instead, hope that's
> ok.
>
> Merged into arm/fixes, thanks!
>
> merge commit: 3e530f89d72dd1ab31e20d6f8567e357b928705c

OK. Please note that this pulls in 0101947dbcc3 ("tee: optee: add
invoke_fn tracepoints") (the commit just before actually) which I
believe was queued for v5.13.

Cheers,
Jens
