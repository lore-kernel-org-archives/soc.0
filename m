Return-Path: <SRS0=5yRm=SD=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68800C433F5
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 14:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AFCBC340E5; Wed, 19 Jan 2022 14:35:14 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83A0BC004E1
	for <soc@kernel.org>; Wed, 19 Jan 2022 14:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83A0BC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f52.google.com with SMTP id r15so4862299uao.3
        for <soc@kernel.org>; Wed, 19 Jan 2022 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLgxgM2afbaDj1scoJJyoJXdiR5WXv+QSndG8neOGUo=;
        b=g1zH2Kto7io35PJPi5MA+AdWvRs/0eqilwW0xwumESemPMzRmJ4FiG5KL20XG4a9+E
         ee+c7e0BCEU59SOEeNqGgDnjB8x6U+ECkau1S+4XFUMlWLjcFQr9uxY0xdaArjtHALyP
         //yLUvFGrW79FCQZNZbEHvWdwYyVsA4x7pMj+ePO6p7ryavNQUweENCuLgUYF8ArNmsP
         4YRRNO6GUQpsRoqaLYBkyVi7xCj/2FoyuguxApYPuhWpKsRmgyWhHU2iBR26OgQknxPW
         AmIJH+RDicT11VS5ehBInkko6OnJ/9ggrYuRUeNFJ3bXyeg+4qdx0ffE3xIpdB6pMvtk
         HUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLgxgM2afbaDj1scoJJyoJXdiR5WXv+QSndG8neOGUo=;
        b=5CFSZeAMmNuxx/cv/ezf1mkH4EoszdteL10wXrNOig33uTd3yOZKLVlsmFooPhKbV/
         wuyUCjK8tk5sc/i7x793guCuYGkD3s8ZYmlYN1UwdlTAONzfIxM0CFt07VrbFfMtGzeC
         /cMJak+fmysnWfVR99v89isBz2tLq2MEop2iiZKLlsmbfp+hvGlTP4Hwgop4VbVFsIEc
         L2fzuhYd1P+kXqA/eEbjxMw6KlEyoUM8WYbyunj+h7JVdfmGXdpo9kg1ie4j0Viubnrk
         mSHW/UUBIrKezxSAJpd0vRCmuOYDd73s/3MMy9TEsKDHtAtfp1B2uhe11MICNYJKrigP
         KsCA==
X-Gm-Message-State: AOAM530XoTyadQcuqjrChIxdo+2FbMJ70AbF+CQOo03jCUJjjYdpDBee
	F487qpNDk0qm9fR9QG4X15ZQOYAICfpEsWfJjNAiKQ==
X-Google-Smtp-Source: ABdhPJxOruJaoz/pWwTVy4wuzkYZkvTsWWKQ2sxSaYu79R6cOGJjr6S5WsMsXxmmNtYFC++JOIanZkWJ/VmgFGUTkfk=
X-Received: by 2002:a05:6102:108c:: with SMTP id s12mr11738010vsr.20.1642602912348;
 Wed, 19 Jan 2022 06:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 19 Jan 2022 16:35:01 +0200
Message-ID: <CAPLW+4=vEYm6dGSCXtmiXUVe7FT6p=6Uk=MCvEsEgcdTz-R0NA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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

Hi Krzysztof,

Do you know if this series is going to land in v5.17? The prediction
(by phb-crystal-ball) is that MW closes on 23 Jan. I can see those
patches in soc/for-next [1], but want to be sure those are scheduled
for v5.17.

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next
