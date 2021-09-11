Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABEFC433EF
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 02:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D4AA6120A
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 02:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhIKDAo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Sep 2021 23:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbhIKDAo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Sep 2021 23:00:44 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A114C061756
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 19:59:32 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id s16so2558831qvt.13
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 19:59:32 -0700 (PDT)
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
        b=X3YquLbefx/PHSQXvNgmuUoJ2iNU96/u4Ln7BTl8gqjsULYd9XYWP+j5zNYZOabkyc
         KO1lLgPc6GLmp/FmGgxQ45CAvDxUhVYkv5WzqRgQRVyz06LTIf3dTx47gSfF5N3Cc97b
         6gh/ZMyQNio4T2RAtudH/OqggzcxBSTct9k3Hfwxo4DgbFi8IvttV+xd1MePobjwfyZw
         3J9t90R36J6Qq/lZhkIn6qJ8AC+z/LTS7apMuNduWizRWVkC05mKTX6NU1IYI0cjnKHB
         bB78xAZ3o6bdBrXsBgCl7s80o2TeZxCkXT5WTSIVpokhQFFwO+KEmiAz9GZsvUvdE+r4
         vi2Q==
X-Gm-Message-State: AOAM533W/jteNgYN9de34Cg1oHKsrdg1O7E1Y898nscfl3ziiWlynZe+
        Ke4ITMS3YsD1Pz0+kwUagV2qQiCS4DJi7rzqzuXHHg==
X-Google-Smtp-Source: ABdhPJxlXs7FidNs06MWxVYHLmOrbib25biafBKZ0BHrdEoITRWXuaidDQ8sY+mPr9EqtO+a/mftg06B0puO2QvO5HU=
X-Received: by 2002:a0c:aac5:: with SMTP id g5mr666903qvb.23.1631329171737;
 Fri, 10 Sep 2021 19:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-4-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-4-romain.perier@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 11 Sep 2021 11:59:21 +0900
Message-ID: <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
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
Message-ID: <20210911025921.Kio6i6NXUv3upMoGZGxkvERIddr1b7GomRfI1Cdg5vU@z>

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
