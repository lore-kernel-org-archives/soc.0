Return-Path: <SRS0=7cRl=KM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E348FC433ED
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 23:47:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD6AB61350; Mon, 17 May 2021 23:47:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F174611BE
	for <soc@kernel.org>; Mon, 17 May 2021 23:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F174611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f180.google.com with SMTP id v5so9294072ljg.12
        for <soc@kernel.org>; Mon, 17 May 2021 16:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=;
        b=J1ZYxPyZ8cjCExpqI3RxldvZfmnGnKipWwx+N7Lb7oRmwpbvIklJ9GutZMVJ7sMckT
         qpXB83zq3QwBmgq94TsbLcg0jeWcA2SY+O81rPPvAPM3yHQyofYG1tgVl/86von7i5tj
         J0ChEu9e8bbKtPN1nYQl8AT6g8O2tmQaWXtGjj5jWDsyS+8r7krQQtsxWrYb8SGx9fXQ
         jiCauF4QXccJyeuZ+sl/kefEa0MATjf28rRE9vI38NS9abJfTzffYW8h/LsnpmpK1jyt
         Lrysdcfv4lF6UWY4I72PwRXq5w8786Pg4VcJkDxwlB4vVFV/3xkN6o0cNpijbuZmE0D9
         KWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=;
        b=D+97e6Ks4t/ic8GjjqdNgALq9fYHBc9TSfgwlNg0fBc2rZ+CgTVCISPI2peDNx1I5y
         MlI/D5AHV1DX8sCSjZE93sTVGy2ERO1XAjFOBUOcGUSb7SrQppNbbuGz85uiMG/D18BW
         pVKQv2dHC+awhrVOrBMfsuhoUFXhhd4dCkR6dIS+qOE+uKdNs/jhhtkLEtveF11I817a
         Y+rRAqGmg089EkQc0NuBMUpntq4+mQrSdBrPSZFVxnDs7XRKIsHEdE1ikNtBvZANW00V
         k/LdZLoQIEWUldoeKiOsHmcKDcRkJYuu9FgKu+N5a6JqT2rYK+MqfxCLFBX+ZQ/Ud1TA
         +5mw==
X-Gm-Message-State: AOAM530XVUFzLfLJUoMM2HsFPbK7T+wN16IN6dPdeSSd4N7XvIxHeXvL
	Wau9DY8v1+DPyQPs1L3158SAvxPwE9X7K9x8wRUpWw==
X-Google-Smtp-Source: ABdhPJxDXJyFBTKjv+mHs1r6TFAqKvhWB+ItK8dz6jjCTY8lwt/USQqO5WACAqPWuhy+6k0yqu4ISteDXDCbpU9JCdk=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1591377lji.438.1621295271997;
 Mon, 17 May 2021 16:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com> <20210517193205.691147-6-clabbe@baylibre.com>
In-Reply-To: <20210517193205.691147-6-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 May 2021 01:47:41 +0200
Message-ID: <CACRpkdZeeij7ZM5C7eTUeOiBzvX_PKH4XwthEggFyJn5_QqdAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: gemini: add device tree for ssi1328
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Corentin,

On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> The SSI 1328 is a NAS box running a SL3516 SoC.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Same question with redboot FIS and the pin control for the
flash here, otherwise it looks good!

Yours,
Linus Walleij
