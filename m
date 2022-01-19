Return-Path: <SRS0=5yRm=SD=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2268C433FE
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 15:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B162C340E8; Wed, 19 Jan 2022 15:11:39 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C03CC340E7
	for <soc@kernel.org>; Wed, 19 Jan 2022 15:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C03CC340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f44.google.com with SMTP id p1so4998114uap.9
        for <soc@kernel.org>; Wed, 19 Jan 2022 07:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5anB1qKvK2H23xAu6C3rLAmFkNsNDqtuvmZ4n6I1f5k=;
        b=nYkP7RSCsY5tI8VOsjbxjBTAKkAtJYn8TrIXoy/HeMG2qDzUZ0JAxvQByeeeTC8z2p
         nnCva2hhi+F+7kzew+MS9WMR17o7Q7mSHvenBMc3ufpLr8HR/PCfvyLxq9GPrVjtaW3b
         eYq8TI60FlxcNmK2rg7vtl9vlxvhDr0yBTBFvnjXzC5VtkOivOPVEUR4MoiJBP2yXwuB
         O89/pgWMHRe82JNQOuGzCjzDC8dKb7LgYcgpAuOeYjdQtL3mGpfe9Wz9RLAKsxgtadaS
         pq4CCo6zPs3Ifu5T4BirYOko+9/uNny6rVXh1TgI5d3sfImNv6qZGh7MUoR7aOjLaxRg
         RuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5anB1qKvK2H23xAu6C3rLAmFkNsNDqtuvmZ4n6I1f5k=;
        b=UQMR7hLnai4t9TQ4YMnLK4xJXdK5YBNQ5+8XUDwriqGSzzXWnrujWI7TZfNe2OM+BA
         GD0jslt6ulfu0Ea86vooR53jsQ1banbk98AJR0+8fuxsAThVG5iQjL8CD2wXKEsIu5N1
         aiO2HJ8CRlqDaU/pQF+zS8ErUa9VTPMOw5YkTgI9kCFbAwYymZrJ0/ZA0AgUp/MwZH1E
         7sCg0p+0CfODKInOkk5NakwnpUrBZ2IhrqIGAforLsLah1YrY+QeiuboaMiFLCfl+JUQ
         h02Sf4zdmgETvHfAFTy/fcDFghSEtCIr1PUl9L9Rz1Zhmt60KYrS0md4Mp0wtLPy7rj6
         nnLw==
X-Gm-Message-State: AOAM532lqnePeyXcLYTnVDmFU6kMiLYja95fgfLgr/6CUpSq/eyaNO11
	HA7CuDomzW8KgjxrZeWdflOmUMS7ZgHk8pONZ0atfg==
X-Google-Smtp-Source: ABdhPJxZTOngZY8mSxHOCjIKQO7ZHkkdS3mwh/b9GyWVf+LVAkWPR5gDWBWXKrk9Zm39CMnsLd7vRxruUSwIXT7CnzE=
X-Received: by 2002:a05:6102:108c:: with SMTP id s12mr11846836vsr.20.1642605097039;
 Wed, 19 Jan 2022 07:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 19 Jan 2022 17:11:25 +0200
Message-ID: <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Second pull with DTS for ARM64, on top of previous pull.
>
> Best regards,
> Krzysztof
>
>
> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
>
>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
>
> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
>
>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
>
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v5.17, part two
>
> Add initial Exynos850 support and WinLink E850-96 board using it.
>
> ----------------------------------------------------------------
> Sam Protsenko (2):
>       arm64: dts: exynos: Add initial Exynos850 SoC support
>       arm64: dts: exynos: Add initial E850-96 board support
>

Hi Olof, Arnd,

Just want to check if it's possible for those patches to be applied in
v5.17? Sorry for the noise, but that's important to me.

>  arch/arm64/boot/dts/exynos/Makefile               |   1 +
>  arch/arm64/boot/dts/exynos/exynos850-e850-96.dts  | 195 ++++++
>  arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi | 643 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi         | 759 ++++++++++++++++++++++
>  4 files changed, 1598 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
