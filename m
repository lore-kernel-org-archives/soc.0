Return-Path: <SRS0=gbhk=MW=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909C5C4338F
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:45:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BF8560C3F; Fri, 30 Jul 2021 14:45:17 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7E060EFD
	for <soc@kernel.org>; Fri, 30 Jul 2021 14:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE7E060EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qk1-f173.google.com with SMTP id 129so9624495qkg.4
        for <soc@kernel.org>; Fri, 30 Jul 2021 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
        b=MZMNdU90T1mdr8f+FlrQaQK/8xRSpuWb+VLJYY04eQAnQjNSfuvvE2QrwqSops4AMK
         YoYRYQLiThc0bxkrK9iOOdLLSyRaxse1aXajornOiRMRdWKS5p4sY2rCHlwWqgP+HZyz
         zkt6k0YfRmN5zyErzIxLsFY5wJEXsdX68OBlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
        b=CGEWmFO339TJMGGbPfsE4GhankhUirSr5vMwq4PftvvyxZhRBrVacbWH8VP1Xwb9jA
         N11wqkyVxHSp9rJQKUlFN/DRbIyA8VfzFnTtzFM2g6fJeFllJZqc9ndvePlIo5b4ykv0
         Dt2KkRkwwKcHseL8Cgf1dUMN8k3eBOcLa8fOLK3qJDgaCmWfQfBwbnWZXXnOubvgHb6R
         5Mm8gVopdf66vgXlnA1eDgssg0bo+AVw0p19aANTDR6pI4I9H6qpibgsB91GLsW3XncA
         yG/Fg7IvcqfcdMpq2AlzNa1xiX2/yKFIjlfD/B1qBWxr4gIlj2D7G6Mzn0H7IkGcBh5s
         24Tw==
X-Gm-Message-State: AOAM5324DMwHJ27krtek+u/uQBwCg4sLMZDBcvoq/4vh023UlL2N5SGe
	2NSTdYxB5EGVfmir2QamCaRokFLbtCY2H1D9ndJEdw==
X-Google-Smtp-Source: ABdhPJyz3l2sQZ+SSXfddd6sETZFkOS5YZXDtdPgdR5B3eaKCu+XhEgm3upVc9TljLMB6v7V3xiiVDe05DNMJPnsckQ=
X-Received: by 2002:a05:620a:1242:: with SMTP id a2mr2651740qkl.443.1627656315951;
 Fri, 30 Jul 2021 07:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com> <20210730134552.853350-4-bert@biot.com>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 30 Jul 2021 23:45:05 +0900
Message-ID: <CAFr9PXkHfncDq=XybcTu-W=Q0ieFRSP5vvSk1nNz2F3jfoS50A@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"

Hi Bert,

On Fri, 30 Jul 2021 at 22:53, Bert Vermeulen <bert@biot.com> wrote:
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +                       clock-frequency = <80000000>;
> +                       next-level-cache = <&L2_0>;
> +
> +               };

Super nit but looks like an empty line snuck in here.

Cheers,

Daniel
