Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70E4C433F5
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 02:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889D4611C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 02:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbhIKC55 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Sep 2021 22:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235174AbhIKC55 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Sep 2021 22:57:57 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F674C061756
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 19:56:45 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id w78so4259895qkb.4
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89y7dtYjpW2V9bTWN6kb0LJfhttVbVV+nnJbuimMLgY=;
        b=CA/aZXFeGkPuzg/ckeBhtNY8HYbXRlOYOhmLKCI2KF0rZ/NZcqyTRuwEd1PgrerdSC
         iGWWHM3lXyXIi0IWv0+n9JbNCwV+tCPZWA1HIZvPRSaJ3BI0+uTCum3FolNyCMFrOuKR
         4VWhE5avruEnXE9qopY1Q0NlrT81Pze+kDVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89y7dtYjpW2V9bTWN6kb0LJfhttVbVV+nnJbuimMLgY=;
        b=gRnfd1kDlzry2FzO0QGA75tim/fQn4yftQf4bWx7tfu94O2s24O5dRwnvJadFlRRBd
         F21E/P5mECIeQ5GE+VjI0+cgcNYCQI2zinKJ12gb0g/JcAPnohhAyJMq9O9C36YWY5cc
         CXNNG4qf5hVAbIPaBuESA5cdkrBoB5UGpCx1i8/GLG3KDSTTltV6HhDbbxN2ntdB1u+u
         ViZhpGWShqvoUAEbQ7DOmsxY3DXu8FJVLf7zG+dmI2LyczCIDuMYIKA8zOTMYSQjJJSK
         DaveJfqSw6DgW+IUKQUZXSv2x1i4LZOF2sXDIFZXitg42WPMc9rTzKmTrGwIU7Jm9mnJ
         covg==
X-Gm-Message-State: AOAM531kcsvybuRWadIr3B+9YxSy+sr+XsbjRikFCQ3kqIbZBkDh+5V6
        3F8iMNDT08+i+NHW5bmBvjJyPl58cuo9JmlDgUfyLw==
X-Google-Smtp-Source: ABdhPJxyPNstiWLJG53wPOjDbgm6Dv1LCOTIxLjonS9hoQA3Pq9DmrgpkpAr3oJe8ZeISaPvJyLJTY5o5JC47ysONNM=
X-Received: by 2002:a05:620a:4495:: with SMTP id x21mr498697qkp.378.1631329004367;
 Fri, 10 Sep 2021 19:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-5-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-5-romain.perier@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 11 Sep 2021 11:56:33 +0900
Message-ID: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To:     Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210911025633.VmKCGdDbC-G1rQO7ZFOhGN54QzF9H-tzyVRepOkjl84@z>

Hi Romain,

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
>
> As proposed by Daniel, I am going to help him to maintain the platform,
> so add myself as co-maintainer.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a9a7cbf9456..ad1a0e5a5425 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2231,6 +2231,7 @@ F:        arch/arm/mach-pxa/mioa701.c
>
>  ARM/MStar/Sigmastar Armv7 SoC support
>  M:     Daniel Palmer <daniel@thingy.jp>
> +M:     Romain Perier <romain.perier@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:     Maintained
>  W:     http://linux-chenxing.org/
> --
> 2.33.0
>

Acked-by: Daniel Palmer <daniel@thingy.jp>

For everyone else: For MStar/SigmaStar I have a ~350 commit backlog
that makes almost everything work on these machines.
It's impossible for me to finish up working out the hardware and clean
up and push patches without the whole process taking years.
Romain stepped up to help out and has been pulling out patches,
cleaning them up and pushing them. He deserves to be listed as a
maintainer.

Cheers,

Daniel
