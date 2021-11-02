Return-Path: <SRS0=PPBT=PV=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49604C433EF
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 13:07:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A253610CA; Tue,  2 Nov 2021 13:07:24 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA2B610A3;
	Tue,  2 Nov 2021 13:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEA2B610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id u9so37779869uac.8;
        Tue, 02 Nov 2021 06:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkTP1A6qXwuEKMshM23kAiOxOnfyNG09RSd2SDdbGyo=;
        b=SyYMorFHmfWnxZBDSwko2G1016PS1vA8qvgp+CJqlYct4BHG4xWRVf+hrOv5fNeDjU
         oXWC9UAYEfUkVbkoxxXWg1E+31NkIyiruIoseta/ZlGwUOwbTimcGGjvIT5avSTAnW5P
         6aZ/vD3+jCH3rpd6mKD/SAMcyZnPyVEcnfOKfqW+asne3Wz1DsS1zXRGrTyvXs1l25dv
         XYtljrGixdWKNXuH+DeXathhrEviTFyNyYAxU3lFfcGsY6+CZ1g6f1ZnTmApoM/SdTUd
         pl0xL+nU9YJeHz36+RV2vUVlS3CsM8Hfg3FqBdg5Bxg0mfMp7uYPeNYEY+JV1d98d5E+
         ZRiA==
X-Gm-Message-State: AOAM532umZKu1vxw3QbBNpwIoWPhuI8Yp6Imwm5wZF4Q8xEadEoFHjbk
	IxmhGcxcpt+VehSV8/0MaEAJTJXUTvEk1A==
X-Google-Smtp-Source: ABdhPJy0gJqtQzgrgAqFvFXiJIQjMtFWFo6DpfB3Mu61919Qv6a0xVu1tCpP2fKnwW6bxHmAhgDdiw==
X-Received: by 2002:a9f:2c9a:: with SMTP id w26mr37016156uaj.120.1635858442740;
        Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id q22sm999025vkd.25.2021.11.02.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id b125so8739400vkb.9;
        Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
X-Received: by 2002:a1f:2906:: with SMTP id p6mr15272478vkp.19.1635858441673;
 Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210928203815.77175-1-luca@z3ntu.xyz> <20210928203815.77175-2-luca@z3ntu.xyz>
In-Reply-To: <20210928203815.77175-2-luca@z3ntu.xyz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Nov 2021 14:07:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: apq8026-lg-lenok: rename board vendor
To: Luca Weiss <luca@z3ntu.xyz>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Tue, Sep 28, 2021 at 10:39 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> In order to avoid having prefixes for multiple internal divisions of LG
> use the "lg" prefix instead of "lge".
>
> Fixes: ad3f04b7bef6 ("ARM: dts: qcom: Add support for LG G Watch R")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/Makefile                                      | 2 +-
>  .../{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts}   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)

What about the second board DTS using "lge"?
arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
