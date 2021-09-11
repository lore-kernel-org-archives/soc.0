Return-Path: <SRS0=EptG=OB=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120BEC433FE
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 02:59:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFD7561211; Sat, 11 Sep 2021 02:59:32 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A16E611F0
	for <soc@kernel.org>; Sat, 11 Sep 2021 02:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A16E611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qv1-f47.google.com with SMTP id 93so2580396qva.7
        for <soc@kernel.org>; Fri, 10 Sep 2021 19:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLsl1b3NpV63ZgEOzfho19a1Y601LOSFY9by5dYQ2vk=;
        b=ZuJTyoJ2Az9c1Is3XTu1LV5/RcY65XnXmK9vMWCubV36heqTW7cF4yLUQU9PtDVMM0
         fnXovV3tnPfgC5oaX9jyX6JtQEEgHRvOt6pnEvvrOlUiNsbD9Vv3TJZrvF+S0kZyHHFS
         E98OaS1d0Tpyt77mNYlHPOHMmTywNyO4wZQ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLsl1b3NpV63ZgEOzfho19a1Y601LOSFY9by5dYQ2vk=;
        b=2QffZFn7FEmVlH9mQHa5smGAf1tdpxzEJdBfjrI7KzU91xnlUvjMNksMHe+ATkLzBW
         Pyjpxhu0UI8MB/mWkNhe+gJHgoEqxgse9GsFbpRQ3R7znlQMV6TGoeKr04nCSyE71dJU
         lhOjzKqfZWT24ivHCjSIIiUniRdyhepbvKNErQUuIXuNKlnJqW7kASyXINN0fyE+m2FR
         IRSv5W3hDSrCpCYJAu8NNXh1aqFsAdNaXzRlPDcYP/mLmahEANz/cMjIXxzV7aERbiit
         TwTdGRnizINNRtfUULa8wDpboI6I9q1whyIZi5Z7WLiU5f48o6QbyAOldiTtHgMq6TwF
         3NIw==
X-Gm-Message-State: AOAM533R6KoCrdwIDJT3jfckg5uof26pDLIKSvWxMTbkUSC3PDgXmx94
	cLuIyKt+bJLMGCVAVxooTnLdMekNfJghwv/pqgvLhA==
X-Google-Smtp-Source: ABdhPJxlXs7FidNs06MWxVYHLmOrbib25biafBKZ0BHrdEoITRWXuaidDQ8sY+mPr9EqtO+a/mftg06B0puO2QvO5HU=
X-Received: by 2002:a0c:aac5:: with SMTP id g5mr666903qvb.23.1631329171737;
 Fri, 10 Sep 2021 19:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-4-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-4-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 11:59:21 +0900
Message-ID: <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Romain,
Sorry for sending this again. Gmail decided to switch to html email so
the first version bounced from the mailing lists.

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
>
> This adds a vendor prefix for wireless tag boards and SOMs.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a867f7102c35..b50d62dde7c5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -517,6 +517,8 @@ patternProperties:
>      description: International Business Machines (IBM)
>    "^icplus,.*":
>      description: IC Plus Corp.
> +  "^wirelesstag,.*":
> +    description: Wireless Tag (qiming yunduan)
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
>    "^ifi,.*":
> --
> 2.33.0
>

This should be in alphabetical order.
Also, this commit should be before adding the DT for the board I think.
The prefix should be in before something that uses it.

Thanks,

Daniel
