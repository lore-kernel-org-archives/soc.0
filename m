Return-Path: <SRS0=EptG=OB=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEB1C433EF
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 02:56:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BC52F6120A; Sat, 11 Sep 2021 02:56:45 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46505611C3
	for <soc@kernel.org>; Sat, 11 Sep 2021 02:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46505611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qk1-f171.google.com with SMTP id c10so4250120qko.11
        for <soc@kernel.org>; Fri, 10 Sep 2021 19:56:45 -0700 (PDT)
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
        b=DFlzIlgdvxteZFQv1bayeohUVVkvBZQnSkJ6FgI9GSNeSUp80YUdfq/Ur15pib/rYo
         kaRY/V5qjjvXfrNSgJW5Tf+rf2uaXXwc/8mmaC34jJhtPJduPQMqsRZIipwVwbdiyHdJ
         Tl3yKrCgcwWqvJsQWibbFtQb2ji63d2BGIdrAWMwv4plGCYJFkk2yxXJG8BAe0Rbm1jP
         xxvl3lzbV1q6yxF81n9c4WNhy1rp2aHSMKAiroBN2+ph/POsJ3H7uUdGaamcIWeXs8N8
         VWFq06NtMDjwEZ+AI5GTU10T7fehGr1PF0UhZ5Z5BedqzqL054CHJbRePsezrI5r+dF3
         fz0Q==
X-Gm-Message-State: AOAM530I8PSeiJLDcPFTLUCEhA0kAQlHrHc66NwBLeIkbon91VvlwrnQ
	sop16c1+yo9Bh9uEtqcuLw00POCKSlPSIzVlgtWjLQ==
X-Google-Smtp-Source: ABdhPJxyPNstiWLJG53wPOjDbgm6Dv1LCOTIxLjonS9hoQA3Pq9DmrgpkpAr3oJe8ZeISaPvJyLJTY5o5JC47ysONNM=
X-Received: by 2002:a05:620a:4495:: with SMTP id x21mr498697qkp.378.1631329004367;
 Fri, 10 Sep 2021 19:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-5-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-5-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 11:56:33 +0900
Message-ID: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

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
