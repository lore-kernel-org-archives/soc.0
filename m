Return-Path: <SRS0=iQxS=RF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D83C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55A76C36AEA; Mon, 20 Dec 2021 16:26:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7517C36AE2;
	Mon, 20 Dec 2021 16:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7517C36AE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mf3yk-1mXALD3v7S-00gUUr; Mon, 20 Dec 2021 17:26:33 +0100
Received: by mail-wm1-f43.google.com with SMTP id c66so3523233wma.5;
        Mon, 20 Dec 2021 08:26:33 -0800 (PST)
X-Gm-Message-State: AOAM533/l+JEdxnFOaGAoyx+oraSOuEy8M9zyRtm1/Nls5grFSS2IAe+
	BWo7Ic7LuoqbT1otlW0BYvWZxhTB9nU9uVi5TpU=
X-Google-Smtp-Source: ABdhPJzwLrcEdHroPABlE7IJDleIxx8hF8kMeanu6+6idToBCIFPiLRY1JmE/9PmnlEOMB7YuxOroFdtYAkUkDWN3xs=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr4058397wma.98.1640017593504;
 Mon, 20 Dec 2021 08:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com> <20211220115405.30434-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211220115405.30434-2-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2021 17:26:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1A+6f1OsJ-8-8kbmXXbbsrQZTQywOAy59tJoUmdDN49g@mail.gmail.com>
Message-ID: <CAK8P3a1A+6f1OsJ-8-8kbmXXbbsrQZTQywOAy59tJoUmdDN49g@mail.gmail.com>
Subject: Re: [GIT PULL 1/6] samsung: soc: drivers: for v5.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Chanho Park <chanho61.park@samsung.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Pi5v/GETGJQHdGKMmhqrLVikNTOvaJoruwPk78MOGjR4L6GolSM
 I2A6AI7pYAMBwoIDzzGsdbsIAgqoYvDoideP1RnsMcExWAmX11ZULxcbeLV5SETJmixNiDg
 dLnPGebynJwkH2+tLVkkgS3R3ly4gOa+OXS2KOg8/vL/EKqFy8WR92peSUFdNsIeQRJwZse
 BY+Ko9tinRpDHyUQn3znw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OpY+khYYS2c=:YOf8zgRbEl3QG4yZBO4OQi
 wZdTu/mcikDO0WdYAomqApCtabURTrZi7v4thLKT2qKmtk9YDRDSu3k6LdyqKQ+VN8+/toMnB
 NF3/5BIdrkxoWsFYj4ge7zKr+dLn17bevGYrmmYydAxOydFnH1U1BrN/hYOPdlBSvfeiGxLuI
 eQhjN3nz5HcrW3xF6+16xtezyOKASHkBbppzpBeHQy96RFYKCFxC52iwkO4YTmIMVEDawNciB
 yUZeUisHjNLc6y1K0b84qq1G4Snmprb7QOK1qojy4/sEWzyNqUINakpYAaSKTBS0140Hwrz4c
 dQZ9WZWoGC+veJQevYWEaABw35PoWcCBgIBVlnGYGKsqJGlM9YYyWkFe4lkZg1BdzKtqgEyJV
 IrM5AB8eCo5Wg67q6AaOVG+lFxVM89mnHydim8fNmuT0IWyfgAyF8e66T5uAFOkDI327JnFvj
 JvxuECIcmgl4x3H+67C+HERqSkTYQUBkAP/UJxia8YbzWWsMbIqcOgBLQsaWQzNVI6HUR+TMh
 U1FrPu0Jm6rZqdK016hjsTrTjoMH1jofyJYQtPduQLU49P3yfHaXV0+ySOp5Umvg199XFpJfZ
 Q56/+bdKC0MNwLcvLHhlAcOw4KchiCJ0BGxC+pkNWF5LYUhoEQUaboz4Ef/p04kIRnleavq/0
 OIwbP3B07/QI/GLzYnJekYwxxzinRHI3M6S2IttqOiB1jqx3dDDNTDzJGkJYLiQZLJBSSmBmf
 w5Srmludp9qDXczGx2girhKdDxmKUSthTMj4VrDFqzaMzmUZ2MtYYsYCc7obfh7cevuQBGGa6
 Wyo5Rv92EyAK8atluNpGNlS1MQ7j0Tn7c5vEsKsXL/i5CLwtKw=

On Mon, Dec 20, 2021 at 12:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> ----------------------------------------------------------------
> Samsung SoC drivers changes for v5.17
>
> 1. Exynos ChipID: add Exynos7885 support.
> 2. Exynos PMU: add Exynos850 support.
> 3. Minor bindings cleanup.
> 4. Add Exynos USIv2 (Universal Serial Interface) driver. The USI block is
>    a shared IP block between I2C, UART/serial and SPI. Basically one has
>    to choose which feature the USI block will support and later the
>    regular I2C/serial/SPI driver will bind and work.
>    This merges also one commit with dt-binding headers from my dts64
>    pull request.
>
>    Together with a future serial driver change, this will break the ABI.
>
>    Affected: Serial on ExynosAutov9 SADK and out-of-tree ExynosAutov9 boards
>
>    Why: To properly and efficiently support the USI with new hierarchy
>    of USI-{serial,SPI,I2C} devicetree nodes.
>
>    Rationale:
>    Recently added serial and USI support was short-sighted and did not
>    allow to smooth support of other features (SPI and I2C). Adding
>    support for USI-SPI and USI-I2C would effect in code duplication.
>    Adding support for different USI versions (currently supported is
>    USIv2 but support for v1 is planned) would cause even more code
>    duplication and create a solution difficult to maintain.
>    Since USI-serial and ExynosAutov9 have been added recently, are
>    considered fresh development features and there are no supported
>    products using them, the code/solution is being refactored in
>    non-backwards compatible way.  The compatibility is not broken yet.
>    It will be when serial driver changes are accepted.
>    The ABI break was discussed with only known users of ExynosAutov9 and
>    received their permission.

Thanks a lot for the detailed description, very helpful!

I've applied pull requests 1 through 4, though it seems that once more
the automated emails did not go out.

I can't find the two defconfig patches you mentioned in the introductory
mail, neither in patchwork nor in my inbox, I assume these were
numbered 5/6 and 6/6?

        Arnd
