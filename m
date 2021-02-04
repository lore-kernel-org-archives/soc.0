Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9973BC433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 21:16:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5512164DD6; Thu,  4 Feb 2021 21:16:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A5CE64FA7;
	Thu,  4 Feb 2021 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612473405;
	bh=hFlPJEpX92eRZfDmwMnWNQRtfdiFjtLU0seS8Hu8j44=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ioIOH/1GevlsN14l+YKusoCH1YcT/HykJXrbioNxCTvyz+OTbVdbv8nYClGuS0xdQ
	 /lFESUhp4uDqvOGiHyRbEZ2ZZGbobPfw1662MBRyKd4SvQGGWpwdosmYa9/0CQXwrX
	 2X39CagnwlpoN4abAUdTs/gVtTAfhTfknnCSOIC6A0BvIQB15s97pJJgiB9qpuNvQX
	 wQPH2+h1NMmKofjsF3OzA9YBUFQpdrnDkOkplgWhEye5jqzlX1zwB5U+MzCAhDADUR
	 QCQrErxYysGPc/ueMbyWfccCW2/uuj05KfInHXZPcXHWN2fytg4Tnzb17a8I1R0/12
	 JG+Ezl2xoGUSw==
Received: by mail-ot1-f48.google.com with SMTP id s107so4848913otb.8;
        Thu, 04 Feb 2021 13:16:45 -0800 (PST)
X-Gm-Message-State: AOAM530td9/IxE21Q9T99ChrqTseOYUkxvuj/KlAnWtcLay+TSxDsOud
	9gjd52EJ6PW+/n4hX5zKzJYvV00HRXL74IAxq5o=
X-Google-Smtp-Source: ABdhPJyhWd5lBy0oDlCjI6uSP/wrkn6ATGMHUHfhJR5MuoSb9V/rgAdV3QhSEWHdaZ0VCEOBZvfjaCMHgHnosQ4Pxpo=
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr1012064otp.251.1612473404388;
 Thu, 04 Feb 2021 13:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-8-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-8-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:16:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1n+C5V5J24myy_h67DVp2YTN5Hd=tCWjPUYZcrAX4hCg@mail.gmail.com>
Message-ID: <CAK8P3a1n+C5V5J24myy_h67DVp2YTN5Hd=tCWjPUYZcrAX4hCg@mail.gmail.com>
Subject: Re: [PATCH 07/18] tty: serial: samsung_tty: enable for ARCH_APPLE
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:

>
>  config SERIAL_SAMSUNG
>         tristate "Samsung SoC serial support"
> -       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> +       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST || ARCH_APPLE

By convention, please keep "|| COMPILE_TEST" last in the list.

            Arnd
