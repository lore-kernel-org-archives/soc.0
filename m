Return-Path: <SRS0=YbQr=II=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAEFC433DB
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 09:45:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4893B64FFE; Wed, 10 Mar 2021 09:45:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD77464FEF
	for <soc@kernel.org>; Wed, 10 Mar 2021 09:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD77464FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=lee.jones@linaro.org
Received: by mail-wr1-f52.google.com with SMTP id l11so19172776wrp.7
        for <soc@kernel.org>; Wed, 10 Mar 2021 01:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
        b=gmhG//67uUiQkJT3GRUTS9z+Tq+SpQbswnEQR3XBOpiU7cuv9y1ZxqWW5di7WTiU0z
         5IGBqN7qnmOOotjHLYfwHb3ymzghFWrRTY1lWccM1Jx+OctRRl2HrazL+Ie3zn+oOLg4
         +Cr93FaZA5kDLdCQdfSnM2ocPGfjV/4QFyjlmLL+A/yeCntkZRxL1Y6VHE3Ix0XGWvt0
         6g/f18dGAHNtTske/QJGnxe1q9MAz0KsF1R4s87be2nrW/bOkzR56VrkiKlK8Lct6oeX
         n8ruIEf/G85aTXWUgm6d5CINJa9ul6yAnrKIqzkWyNT+48PSH1UtSBhOAi5f8ntwPNJr
         7JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
        b=jTgBqJHg8nADHmnMbxJnBmt9dAEloPJjQsIFZ9k0kAMLucEivPxnyDEZpwBtn2Nn/8
         Aa5e9TtTlEx6i22spG/eqA3iUVAPawtznlJ30xw4q5ihP4FoPnPco77lKsYbD5a2tvDN
         umlOZALy1ymEOOE6LRmGKdgCjjDJfhAcSP69gcz1WM1xQUcEU5UFvQVqw2REOrzwTMgD
         Two+/HpxLHwWcLuxHBGecFwIVDwvdc7Yj+/EgVi1p9HQCWFLZ0QJ6Vuo4/lY+b15wFXM
         FZ+l7jXK9jItpByy+eI08cvF1k10mBdnKKregFjl+sxKK6r6FbX4kVqNt3JEflHoHKgh
         ZVIw==
X-Gm-Message-State: AOAM533kFRDGzrXDS8Bnf4np7+SHDziHebOVF084Swbsrh4HDLh+Sq4+
	fPdZ2NiAP+XxsmnEXVNTork9IA==
X-Google-Smtp-Source: ABdhPJxcv9V5lAz+sEJ4HCtbzjFqfXkdmpxw/ngT7vdSlUljH3RkiAsQdLLVCP49qFAMYuC+GEIjxg==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr2649040wru.266.1615369530343;
        Wed, 10 Mar 2021 01:45:30 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id c9sm11764201wrr.78.2021.03.10.01.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:45:29 -0800 (PST)
Date: Wed, 10 Mar 2021 09:45:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, arm@kernel.org,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
Message-ID: <20210310094527.GA701493@dell>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>

On Wed, 10 Mar 2021, Krzysztof Kozlowski wrote:

> Prepare for merging Stratix 10, Agilex and N5X into one arm64
> architecture by first renaming the ARCH_STRATIX10 into ARCH_SOCFPGA64.
> 
> The existing ARCH_SOCFPGA (in ARMv7) Kconfig symbol cannot be used
> because altera_edac driver builds differently between them (with
> ifdefs).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/Kconfig.platforms                |  7 ++++---
>  arch/arm64/boot/dts/altera/Makefile         |  2 +-
>  arch/arm64/configs/defconfig                |  2 +-
>  drivers/clk/Makefile                        |  2 +-
>  drivers/clk/socfpga/Kconfig                 |  4 ++--
>  drivers/edac/Kconfig                        |  2 +-
>  drivers/edac/altera_edac.c                  | 10 +++++-----
>  drivers/firmware/Kconfig                    |  2 +-
>  drivers/fpga/Kconfig                        |  2 +-

>  drivers/mfd/Kconfig                         |  2 +-

If it's okay with everyone else, it'll be okay with me:

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
>  drivers/reset/Kconfig                       |  2 +-
>  12 files changed, 21 insertions(+), 20 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
