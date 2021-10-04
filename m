Return-Path: <SRS0=QKSH=OY=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E045C433F5
	for <soc@archiver.kernel.org>; Mon,  4 Oct 2021 13:51:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1627F61207; Mon,  4 Oct 2021 13:51:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D665C60F58
	for <soc@kernel.org>; Mon,  4 Oct 2021 13:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D665C60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id a11-20020a7bc1cb000000b0030d6aae48b5so23529wmj.4
        for <soc@kernel.org>; Mon, 04 Oct 2021 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixcLdTagJRu/06gC176lfPRdoFQRHt0CXg6VWfHheVY=;
        b=p6TDaGTFlpLS+iMuviaB8B07k0Ae0uBloriBCGPD6Rrdgs9T0CVQcM1WFsIzGzqRh4
         rzJ2nflnlUjmgNTKvOp4HOnH39FUwKc9dNzsjATrAk6hzT3jQ6bOhMIBpi0iQhJMw6BI
         wotyqWu9/oW7G/Y2SEOnTsaKTFQUfyr48vOBADEdoWxiKc1BaCy++HOyiq6F/uQao6Iq
         /4GQOe7YvDcD7JwNqkKmmcFu6iULtZbTs0VgkGejb3JQpgBjfcelhjREylmPQmZGW0BW
         wCnlC9fwjpcLbd24WvMLdhjOKyCeLbppTbFikG2nR9Cx/sWND3dI05tPFInq0wGiYb5C
         dlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixcLdTagJRu/06gC176lfPRdoFQRHt0CXg6VWfHheVY=;
        b=ArtGSegNot6QGB5LJkDBcSIC0Vz6c1htqwIMzm3EqScmpmJaKAetz3T4lY1//puI4I
         CrT7a5Ii+no83Ayjhm8a/qUJhJZf0xXGJ2GabTEr7PvUfJKJnPbH7DuRWbMBoBLqNkjI
         oh5xHZq04yov9oy9iqNdQRFRr1NsGUj44WEGzTdW4H1/qO7G5jfH2IBt1hjZCQ9Bc+gs
         OyIw5StOWz1K/bRvgURkNaWBF4USBTHrRD+TUWybhhD91G/X91FgDvHoIukmPLNninmY
         0Jr4AMXZvf4Wiy1aDnRrkWgoj6Hs2eBndqNr1lzc2dA5jWil36n+0HqbeyHuTEW98OCn
         eM6g==
X-Gm-Message-State: AOAM5318e0PGy0fj4JxH6xq+R0elpVVhuoUIyY3ys+E4HNuHY3Z86BX2
	bwwqL8wFR/NmAK215wRFZmSd3wCpiPT1hHdrk1RjsYmninI=
X-Google-Smtp-Source: ABdhPJw1v2ZRogF2DMasR0MEbo1LWWhq0iSwwVnx7mfGK0MtGZblExODYu8l8WDnhe6n4XGcNYOzK3roxkxLprcfO0w=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr1524425wmg.177.1633355461387;
 Mon, 04 Oct 2021 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210915113813.GA509196@jade>
In-Reply-To: <20210915113813.GA509196@jade>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 4 Oct 2021 15:50:50 +0200
Message-ID: <CAHUa44EZeE4pWmYFTfoBBxL4AhjTbRBS8vv6=M1UksL-oO_Rzw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fix for v5.15
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, CGEL <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Is there any problems with this, or is it just that you'd rather take it later?

Thanks,
Jens

On Wed, Sep 15, 2021 at 1:38 PM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this small OP-TEE driver fix for the shared memory pool
> handler. The fix doesn't change the generated code, but it's still relevant
> since the problem obviously triggers warnings with some tools.
>
> Thanks,
> Jens
>
> The following changes since commit 7d2a07b769330c34b4deabeed939325c77a7ec2f:
>
>   Linux 5.14 (2021-08-29 15:04:50 -0700)
>
> are available in the Git repository at:
>
>   git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.15
>
> for you to fetch changes up to 88a3856c0a8c03188db7913f4d49379432fe1f93:
>
>   tee/optee/shm_pool: fix application of sizeof to pointer (2021-09-14 07:54:56 +0200)
>
> ----------------------------------------------------------------
> Fix OP-TEE shm_pool lint warning
>
> ----------------------------------------------------------------
> jing yangyang (1):
>       tee/optee/shm_pool: fix application of sizeof to pointer
>
>  drivers/tee/optee/shm_pool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
