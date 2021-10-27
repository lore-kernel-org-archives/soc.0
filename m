Return-Path: <SRS0=fU2+=PP=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E743FC433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 14:08:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CAF6E60F38; Wed, 27 Oct 2021 14:08:00 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2E460EFE
	for <soc@kernel.org>; Wed, 27 Oct 2021 14:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB2E460EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so3770430otk.3
        for <soc@kernel.org>; Wed, 27 Oct 2021 07:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dqUuQlH4DnXRPcRZFyC/rf6NwywVKvTGkeOXqaPUVW4=;
        b=hft5zQ9WiyF+SuVBhIXBL+D88PaNa8tafAqttZ+3UoKqrswtDootJcCltsM2NIu49z
         UCKZx3kid/GlJGdATO98C6QgCW37J3Tq9+/WYutzivX4ENw8os69ekVJX2GEnGvIHTU1
         vWnoCrhrzbbfOBss3jgJ2GwIqELxO+ViyUX6CTN9ztxkYOI/ny1aViAZAJ3Rc1RkEWXc
         unqCEwFFQ6ZNo2hJwy9e/73dhzOObzqbmwb5fjQn6gEjGpj8io7KVNC/CdkxoEpnGx0M
         gauFpVi2aU1DgKG8XRV8Z+ZI193YUMjAkuBQ1LPxya1uQ4iYt0BBrPCqMS+vqwE/6zdl
         +I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dqUuQlH4DnXRPcRZFyC/rf6NwywVKvTGkeOXqaPUVW4=;
        b=7oCdtRUcmojG8FBy/bKBKtdN7uw9jfJd5ggU7lNPkYU9VGrrurTfkV6ToEmxPCbROY
         6B2yhOJpmDIs7Fe9yvfJncBk1oCSK8HurMpA/iH9ADkKQcGOIiBt+i98vUGNO7oXCv9e
         xou7beC1PxtnFUzhSChD5pyPPsljSHZ8o5N3IZStNhOpXsHl0La88TYNWtHNii2jfnQI
         nv16H9s/YIBpKSsrtr/3qK/38o4GMMyF3R29ycKcgCz+0QXsz9eJ2LcX4WHS4zXx4HSD
         ZVwJ1A4+Dy1qtDdMRfpqtuc4W6T8Oix2tszIh41cV0gt4SyrdwFs+JevLWUWz07VxcrM
         tohA==
X-Gm-Message-State: AOAM5328ZXY+JSx3xeN9kNkgcL/FjICvEivKj2AQzDyprl9A5zRTUz3T
	7yNuB+OzZuGtWMSCa3bDlggJdi3z83nFlcua
X-Google-Smtp-Source: ABdhPJw1mWzgD6QE89wYJ8HWGsD1ilb9e/Cg2rV3cNaRk8EuSYUuFr3KlPKt93OVWCDA79gA41Ft+g==
X-Received: by 2002:a05:6830:2a8a:: with SMTP id s10mr26073246otu.17.1635343679907;
        Wed, 27 Oct 2021 07:07:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a71sm40887ooc.10.2021.10.27.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:07:59 -0700 (PDT)
Date: Wed, 27 Oct 2021 07:09:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Andy Gross <agross@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom: scm: fix non-SMP build
Message-ID: <YXldsEH+oqN9a2vi@ripper>
References: <20211027072427.2730827-1-arnd@kernel.org>
 <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>

On Wed 27 Oct 01:49 PDT 2021, Arnd Bergmann wrote:

> On Wed, Oct 27, 2021 at 9:24 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > A check was added for non-arm platforms, but the same code
> > is still broken on Arm non-SMP:
> >
> > ERROR: modpost: "__cpu_logical_map" [drivers/firmware/qcom-scm.ko] undefined!
> >
> > Fixes: c50031f03dfe ("firmware: qcom: scm: Don't break compile test on non-ARM platforms")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Nevermind, this is not sufficient, as the symbol is not actually
> exported, so this still
> fails on SMP configurations, both 32 and 64 bit.
> 

Damn, it seems I only compile tested it on the three platforms with
configurations where it ended up =y in the end.

> Any ideas for a better fix, or should I revert 55845f46df03
> ("firmware: qcom: scm:
> Add support for MC boot address API") for the merge window?
> 

Let's revert the patch (and the fix) for v5.16 and try to figure this
one out for next round.

Regards,
Bjorn
