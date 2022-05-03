Return-Path: <SRS0=1zmO=VL=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18099C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 19:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0D22C385B0; Tue,  3 May 2022 19:29:02 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED9B3C385A9
	for <soc@kernel.org>; Tue,  3 May 2022 19:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED9B3C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id a191so2181970pge.2
        for <soc@kernel.org>; Tue, 03 May 2022 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Oz0/vK987/3MBTtQni0WYSqmI6RH+uzxXIUVgYPMSAU=;
        b=Sg61vsIPaz1vtBvNU01LUvd/RC+/pNuLk9KYqEV6Dg22d0F6VqWix5wD60pJETvMOL
         u1K5nZN1jnWsEmy5sSntbWsopBfEmGrWcZhdf7FLdrI8Y3N2Mq0WfGgLQA0o23Phsw3o
         mhwgewirIv/hYXBlXh1sMd8VCy4tRC5NFTfAYl9+ByxtnowgjGEXrOJAx4Dss6cFQdnJ
         oEjhiUPvOZsY6BgzcbBGUST9l7EEWv+9H9C60aUoY/zmWRZhNSjQAGOVBj4/14gibfXR
         DZgHprtSpF24EIULtd1etCljnsJvzlAn5h4lHuZLFLu7E6XeawK2ScUSNqjYTlBONBhO
         vdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Oz0/vK987/3MBTtQni0WYSqmI6RH+uzxXIUVgYPMSAU=;
        b=ryhaCU1MVdQiCFOMRc38UbKKvn0q1k9tBB+P7pUuDAqONKdiSxbZfWr7sj5CuRSymL
         TL2FM08UxMA568iQgnJD1jgWA4GxwogzUWI4QsA0RPWCY207vLqF/OBlkyj434GOmz3q
         +jg9HSwNZLW9PYvpHhdCEo8SkrZlNm8J1WQjna/WT4xjn0xhSCzldUzddh4xK/YT9L2X
         zn2NvkhUpAmN8LCghrTOkFwwexsenNZdLabwcLcQsEgV8gqtiwMU9T64a02CLWtcQcCi
         3/XPoy+3ikrJfPeFQfJgpHUgBo3tdGG+TgHEFx/camFXKuutXgEM/darEJX0dizzjztN
         X8Sw==
X-Gm-Message-State: AOAM533QLgb7WMFm9AhAZ2XjC+5VJ0dbgynFsqCQRaD/1cX8eKFsXlWM
	X8PVHmXGrLJzf3MkWEkIv2twOcB2IE/g9W/h7xP0Iw==
X-Google-Smtp-Source: ABdhPJzy7fLP9Hxfhe6YyfmA6dAoDN4kSUeEloq2bdmaMDt9jS5MpkNqfIovaL9wy1EP4p6Lt5BaResoei25MKQeW6k=
X-Received: by 2002:a05:6a00:18a4:b0:50d:f418:b982 with SMTP id
 x36-20020a056a0018a400b0050df418b982mr9045746pfh.49.1651606141391; Tue, 03
 May 2022 12:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220503192418.GA3285658@jade>
In-Reply-To: <20220503192418.GA3285658@jade>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 3 May 2022 21:28:50 +0200
Message-ID: <CAHUa44FCGjEp3_Y05Jj7NSWHeN3Y8QSOXV+fu5BV4tKKMLQTGw@mail.gmail.com>
Subject: Re: [GIT PULL] TEE SHM vmalloc for v5.19
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Please ignore the previous mail, I'll resend the pull request with the
mailing lists included.

Thanks,
Jens

On Tue, May 3, 2022 at 9:24 PM Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this patch which enables tee_shm_register_kernel_buf() to
> accept vmalloc()ed buffers.
>
> Thanks,
> Jens
>
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-shm-vmalloc-for-v5.19
>
> for you to fetch changes up to 3e47235eaee09488c7e467b9aaccb7c93c862c6b:
>
>   tee: make tee_shm_register_kernel_buf vmalloc supported (2022-04-05 08:04:16 +0200)
>
> ----------------------------------------------------------------
> TEE accept vmalloc()ed buffers for tee_shm_register_kernel_buf()
>
> ----------------------------------------------------------------
> Phil Chang (1):
>       tee: make tee_shm_register_kernel_buf vmalloc supported
>
>  drivers/tee/optee/call.c |  2 +-
>  drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
>  2 files changed, 26 insertions(+), 11 deletions(-)
