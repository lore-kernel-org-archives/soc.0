Return-Path: <SRS0=y4xS=MN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79301C6377B
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 22:00:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F57961249; Wed, 21 Jul 2021 22:00:36 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AB76120E
	for <soc@kernel.org>; Wed, 21 Jul 2021 22:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AB76120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f43.google.com with SMTP id u13so5382121lfs.11
        for <soc@kernel.org>; Wed, 21 Jul 2021 15:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JNYKfEC2XgIe4P22hQdCPlxP6b32Wm75jWfz9vNASdQ=;
        b=VbIbeVYcEg9R6LFL4eV3LtCYv3emUrr9wD3eAaAJsesFot8I4PezL/2TyQVytBeu1z
         3kBq5J7cll3l1Mq+bJ/ZdCO753FDNK3SMsM+awtWSKtbBje9ooBCfmpnB+j8Sm46W0oc
         +waGBKGo88iimcDvth0i7wqnK6ffuQeZ33As5mv/F3Qx9XzkakFLeTPwdGEFKRhhV6NS
         z623kXPwxnEUPgNBFeN669f9EGajsUGRHJO3tS5PBwNweaNwp5qlFd1bhoq9Ing+deQU
         4zKeaTPpNlqKPSlhe5rX+ntjaN2dESY6YSjd/xNUVXu/SfME+edsH5aftk+82ZI+D8i4
         Haaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JNYKfEC2XgIe4P22hQdCPlxP6b32Wm75jWfz9vNASdQ=;
        b=O3EHqaJEc08TxS4Q85OPP6DDbNGhUUNR/5p1+myHgjAVB33CFHc6/NffGhBXkfAhsm
         AXyQp2jNEbXN4qjCNCAXLyNMhG8ewhWgQj3DWyoGZWPwuB7qM0rvZ1Rd5S6mBlZmeDXI
         MbHxeUqtU8FldCFRyM60+xqwTwGiwj1kR02kc7moGBUefGDg5JAsWM4R6WM7oGRvRGZl
         2uOiaWsxSBG75rcrltY/EdpotaUMAXiVLKI9DG/lW8/zvy37dsRIjU7ENJGyLR22Y9xO
         oyVYfcOrV6qoB2Dj8nU/EQe0wgu4KdHVniz0Vkg3aJn5GKcWutfIu3gaE9IDX9cTS6LX
         CyoA==
X-Gm-Message-State: AOAM5336XUPq3GmEFRY0BEejhhdnDkedewkVtpTarGbzmO8+xzHqM2s3
	zC2PN7tcujry7WXaGA+HRzZnNKGmsSDA7rAiDtLwiQ==
X-Google-Smtp-Source: ABdhPJx+2GQAUDXqohhrQt5LdzTObCbGRun5lWTid9GN2w85MRs7dgJ2BbU422eqrTMM9/HF54kKi36PNk7WBD242sU=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr27775866lfs.586.1626904834440;
 Wed, 21 Jul 2021 15:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210721211412.3537004-1-arnd@kernel.org>
In-Reply-To: <20210721211412.3537004-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Jul 2021 00:00:23 +0200
Message-ID: <CACRpkdZ3jWjPkVFYnizZ4CPHWsvS-gaGcUYZdp_4pi_BrZHjMQ@mail.gmail.com>
Subject: Re: [PATCH v2] [SUBMITTED 20210721] ARM: ixp4xx: fix compile-testing
 soc drivers
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, SoC Team <soc@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 11:14 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Randconfig builds on the ixp4xx ethernet driver showed that the qmgr and
> npe drivers are not actually built even when compile testing is enabled:
>
> ERROR: modpost: "qmgr_stat_empty" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_enable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_set_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "__qmgr_request_queue" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_send_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_load_firmware" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_running" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_disable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_stat_below_low_watermark" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
>
> Fix it by always entering the drivers/soc/ixp4xx/ directory, and fix the
> resulting compile test failures by removing the #include statements
> that prevent building on most other platforms.
>
> Fixes: 7a6c9dbb36a4 ("soc: ixp4xx: Protect IXP4xx SoC drivers by ARCH_IXP4XX || COMPILE_TEST")
> Fixes: fcf2d8978cd5 ("ARM: ixp4xx: Move NPE and QMGR to drivers/soc")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh neat, thanks for fixing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
