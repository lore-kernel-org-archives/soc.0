Return-Path: <SRS0=AxJt=MP=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E9C4338F
	for <soc@archiver.kernel.org>; Fri, 23 Jul 2021 10:34:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 249F960F26; Fri, 23 Jul 2021 10:34:40 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52AE60F12
	for <soc@kernel.org>; Fri, 23 Jul 2021 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E52AE60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id l4so1135013ljq.4
        for <soc@kernel.org>; Fri, 23 Jul 2021 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=swGcTNpA98MU/vBFxvZLl9qo7SscXLpjeJm2hi9sy7I=;
        b=fcmHRd/Vsw/hxY/nlM1A5Q8ziml1XikfWihkC5N1/rqK3UXsBVjF13+j+c7VGdeAQ9
         qnmcozaQc22tvuwglbyJJyZ9TTUBlx7eXU0lZmBTQYHWSoYfjP5BHpCFitc9zQRmC55p
         isNdKSUBA0ESGnN85ENYb9mTxeUj3P7D50Sl+4LOCBbVILanTs00UnboMm2JMpfBvu0D
         Ur5a8DtDJY8z3ZE45eZpY1i0KLptXbB9fhGORaXLXQPN16ZJQopTILB9fE0x4SshyobT
         xCp+aBrBT0mxNeq3C+aEed/s5DS6ouCdToZrKj9H9YNiUNjQC726eWclZRuco3DkqYgh
         KYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=swGcTNpA98MU/vBFxvZLl9qo7SscXLpjeJm2hi9sy7I=;
        b=Z7bxmwFHtokmNVU757Z4juKfjZRNlx24JYltJzIKsLkGXuTrie89EhMdiFZ7plfe2I
         OoIGh9jNpwwZLt46weQdQjkKh3KrOQVwRrjBB4ECNOEgqGZzZiqyuoL5y2HRTVhXIubT
         YwYYMQZYuwkjlU+B/ndKCP1xlUf56NFGKorQFqO47RGc/BzDQl1sfOg7jF6GGldullTM
         oIQyPvP6ZP3PhTt//d2BgN5YpA8HjswDkC5Vc4bHGqS2PJuWGF7UPLMbtL2doY9gES25
         HIdauuLF8bUaVOJ0Qgww8R0UArmAGa/oc5zX2z20ynXIoO0fqMViuPorGSVZln1fjnLj
         EliA==
X-Gm-Message-State: AOAM530m4kMcPb5X6OEuQN8S68bh+VqAjMripbRKLZk3hLsgbrCSH4Ry
	XclUBvuxIWtLpQkFQzTTmmK9yczocOVVS2LmotEE6g==
X-Google-Smtp-Source: ABdhPJzCFJwi0QtxItn9n9d22Y44wmE7wx/d8aLLz8VyvFA97du4CxRRxIrfYiQRUruKvqLhoVIWcU1xYaulvbb2KbI=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr2912069ljb.368.1627036478284;
 Fri, 23 Jul 2021 03:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210618205533.1527384-1-clabbe@baylibre.com>
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 12:34:27 +0200
Message-ID: <CACRpkdZNeJLsOhAOqD9TPsPuHDjK4ec-SUAVrLXvVOkcGd1S-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: gemini: add two more board
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 10:55 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> I have two boards with a SL3516 SoC. Both are NAS box.
>
> Changes since v1:
> - ssi1328 use now redboot-fis partitions
> - added pinctrl as asked by Linus Walleij
>
> Corentin Labbe (5):
>   ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
>   dt-bindings: add vendor prefix for edimax
>   dt-bindings: add vendor prefix for ssi
>   ARM: gemini: add device tree for edimax NS2502
>   ARM: gemini: add device tree for ssi1328

Thanks Corentin!

All patches applied for v5.15, I saw that the NS2502 does
not make use of the redboot FIS partition table but that's
no big deal, you can send a separate patch to fix that
when you can test it.

Yours,
Linus Walleij
