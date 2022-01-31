Return-Path: <SRS0=uRqv=SP=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA9C433F5
	for <soc@archiver.kernel.org>; Mon, 31 Jan 2022 13:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14C98C340EF; Mon, 31 Jan 2022 13:15:45 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29A35C340EE
	for <soc@kernel.org>; Mon, 31 Jan 2022 13:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29A35C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f52.google.com with SMTP id v62so11720122vsv.4
        for <soc@kernel.org>; Mon, 31 Jan 2022 05:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ipkj5NQgewYwcirkC14ppPiVF1og9gtn+2K+RG2IIQU=;
        b=T+opQyN0UjbrtKQNYPePvH3nZo+gxTny2tnIjrLlZ6Mu/EMFt5xUjf6YksjwBazO+s
         1vWJK2iJ1WXUz9ZD5CJHDElUKo7l/b19FRLeJXlbL4NsVm9nHmjMogfBMWnAuUC3FGo3
         2YMzeEMdQQKF23qcbbSSlNgoe2ZnTPM+PNDvbkFATGDMI6RA6qF8RPhxP3pzrhXXwsiM
         Xbec2B7tgCzghyWyZvoBzeQ458vNjDtZOID6uDf8nou8w3ItB0/DuHR9t+gik02aXhRE
         2Wr4xEnTSiFyduevUlqfRMQ/zTr88Vz1P7SnQn5Tt4ubCXM9XXIuaJ34w36MT0qAfNMr
         emcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ipkj5NQgewYwcirkC14ppPiVF1og9gtn+2K+RG2IIQU=;
        b=FeO/mOpLjXc6/pvg5LZB0hae2hwiws88VRdHEb8Ykhf0sxZUA+ie3TG/75WVCyWooZ
         wW3XPDb9hXQIk8a/H19WXOVDwZxbIY4bxbPaGubjQhJiS0r07/oxC5/I0ElcSKYh6BFn
         np0XWFp5/81uPKFMVdkfeO4/6mcmGqHitpnEAnRxXgyt0I87S4RG9oktYzDnnTIZvaJP
         C995AMKE9oj9v4OnKMWiIOy/PSsO7Qdd6t9WJauDTMbh/cI18X3L7P6W6BZhTZ3bMCu/
         N42pz1NKMd2ZgKFrx4oEsMQ2sC/NwEBSlqwgkZaxPX+mJW9TfFdwfM9fH/4rIuoJKNSb
         wCpg==
X-Gm-Message-State: AOAM53118ESzBdO8N3wa+cbI0OXOfUken+W8E9eJOnWRiVdKo06QfK+x
	bHuRStpdQUwkDdljQiWhk+oASzf5y+fhUKkKr723pQ==
X-Google-Smtp-Source: ABdhPJxEOKUEWCzILNauqLlTJF9iFhrzAq8fmSlLI7Tkxf8To//0DUiH7TaeLvj6uEcDBJ7wbJpn5wxfsdrmlxVznVk=
X-Received: by 2002:a67:df83:: with SMTP id x3mr7975308vsk.86.1643634943091;
 Mon, 31 Jan 2022 05:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com> <CAPLW+4=Hj-vamn5EoV-SmB5JwEbuik9hF2XuhB+tU11GwXPQdg@mail.gmail.com>
 <51ce758d-b96d-c9b1-b439-e97cc59d1052@canonical.com>
In-Reply-To: <51ce758d-b96d-c9b1-b439-e97cc59d1052@canonical.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 31 Jan 2022 15:15:31 +0200
Message-ID: <CAPLW+4muLWfOsVodZkxEDsAdUYFnsjA2ajg5JVryZ0tYyxARGQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jan 2022 at 09:46, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 27/01/2022 17:58, Sam Protsenko wrote:
> > On Thu, 27 Jan 2022 at 11:33, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 27/12/2021 12:29, Krzysztof Kozlowski wrote:
> >>> Hi,
> >>>
> >>> Second pull with DTS for ARM64, on top of previous pull.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>>
> >>> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
> >>>
> >>>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
> >>>
> >>> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
> >>>
> >>>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> Samsung DTS ARM64 changes for v5.17, part two
> >>>
> >>> Add initial Exynos850 support and WinLink E850-96 board using it.
> >>>
> >>> ----------------------------------------------------------------
> >>> Sam Protsenko (2):
> >>>       arm64: dts: exynos: Add initial Exynos850 SoC support
> >>>       arm64: dts: exynos: Add initial E850-96 board support
> >>>
> >>
> >> I'll send all this as v5.18 material, so this pull-req can be skipped.
> >>
> >
> > Krzysztof,
> >
> > As clock changes are merged in mainline now, do you want me to re-send
> > those two dts patches using corresponding clock constants, instead of
> > hard-coded numbers?
>
> Yes, please.
>

Sent out v6. Please check notes in [0/2], if something is not right,
just let me know.

Thanks!

> Best regards,
> Krzysztof
