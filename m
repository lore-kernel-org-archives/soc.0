Return-Path: <SRS0=ZVtb=XD=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C855C43334
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 19:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0F94C341C6; Tue, 28 Jun 2022 19:26:56 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BF88C341CA
	for <soc@kernel.org>; Tue, 28 Jun 2022 19:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BF88C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id g4so12375078ybg.9
        for <soc@kernel.org>; Tue, 28 Jun 2022 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=r5dhjikOjoOSTxH7twYmSKEfHqErqjhxkSM9McqWoCouOgLOQB7kvkMdEEzxx/BDX6
         TQrjLVB6hMIfuOa9g8Jq2JmzE97r9+o77os7tKeNZgQG+gQR3fBWEr5T9i+X01s9wRKF
         poqPtQCKU93338RDg9n0sUG/ZEqcMMUZPZnDwkORaC63HcYlFTRnittAcohjRCM8pOOF
         g/UPD7ABIbEWrLq01pVgh4ii12ETWhUPrCA8/9LHWHuLKXXESxjWthvXPWzyjMNL6Oot
         Hlc8iuNIiurItn418+oTScTJhM5C5ncPhx/nMRn5oHIDm7HNscLwCkwchgANUMMiViBr
         lmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=ueXlFQ5oeu0eIKCYOp1ap92W0pcZXcvdf86L9Zu0PU28Ph2SKvz15x2lxfZDMVmztG
         /Nrdd3avXUiKaTX+9Gd6Mfct67+1cB9I0yeo62cEi+Qoa4siul1GSJJRbDIeX/lfLJHy
         bm46CfzceIo+2cnROF6H3crlC/yzSr9RMTCAq9lo8Qziu+AirA3yIDTMYHuRvmmCJb+M
         I4ZXTG3vGZB2SrEbWO1UYcSVNA4Fpa/2jJX5NcUNxLRXxr9iNVURNzVPjG45oVpUjbLf
         EA/fFsEY1wTekxhmRLqWniLZSzRVatkrvYoYAC1KvJAfc0qcHsP3DCrOByPgJmsa2Aqb
         xwew==
X-Gm-Message-State: AJIora/GIdioP6nIVq80gND39Ni39IWWDOP0iwn/TmNXCIpAyd0fwb2w
	F4egnOS417y4/3Wt4M9AUZCHGcQA3mtag4p5milsgQ==
X-Google-Smtp-Source: AGRyM1tix/MDbYpAocLhXqNa2cuD1sSvJJYVbcVLzqD1nAvkTSC00uKkSWSEB65C4UY4pgJ8yatan7ZYC8uyX2aYtAw=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr21915704ybh.291.1656444414438; Tue, 28
 Jun 2022 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jun 2022 21:26:43 +0200
Message-ID: <CACRpkdawFWN_3EYV0p2AAgu54Lu1s0YgqiSiV3136wOSfSGhrg@mail.gmail.com>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> gpio-keys schema requires keys to have more generic name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
