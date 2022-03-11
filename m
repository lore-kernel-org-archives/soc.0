Return-Path: <SRS0=38w0=TW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF8C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 08:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 542B3C340E9; Fri, 11 Mar 2022 08:19:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F819C340EC;
	Fri, 11 Mar 2022 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F819C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxE1Q-1oLoht17Jg-00xYU9; Fri, 11 Mar 2022 09:19:37 +0100
Received: by mail-wr1-f47.google.com with SMTP id k24so11737021wrd.7;
        Fri, 11 Mar 2022 00:19:37 -0800 (PST)
X-Gm-Message-State: AOAM532PxvBgxsofwXrOZTc9/v5qo0qRxCKqjcAu3WuKGjvDSL0RutJD
	EFEmlBahwHLfpxlEFZLcZp9T2XaQRxnSJs4je68=
X-Google-Smtp-Source: ABdhPJxWyOrVHPAd6W5M2rcxGMy+ZmZs2SFgKCrOVAaFDflfl6gItQqEvF+hSHJSQdSa0qDb39ePN/xMvFTNUGT9Yz4=
X-Received: by 2002:adf:f606:0:b0:203:8dff:f4ac with SMTP id
 t6-20020adff606000000b002038dfff4acmr4269722wrp.12.1646986776850; Fri, 11 Mar
 2022 00:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20220310195123.109359-1-nick.hawkins@hpe.com>
In-Reply-To: <20220310195123.109359-1-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Mar 2022 09:19:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1z6bCfhMUzqjDNaNWky52vH+NjQA5Qpo=0tABv4Z1Ocw@mail.gmail.com>
Message-ID: <CAK8P3a1z6bCfhMUzqjDNaNWky52vH+NjQA5Qpo=0tABv4Z1Ocw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ARM: Introduce HPE GXP Architecture
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, Rob Herring <robh+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:auEmzFsCXSR7uiTdPGolFeS0IrH3mpA4+9bOkDNWEYpwpQ9J3Oc
 uUVhw6jww754ksX8AyKUJG/lcYMfwma1ipXwnGHk/XCmwhxAftmntvzfMspCiHm3hkxx6fz
 HBGPcj1lsZKVBAhwkgboV/HLzs0yxLucX2m0XIQ5DlSC37Nt9JjzAjQYM9Zwut3dCnlVfLv
 94a4RZIdGa0uDnwex/SOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w9L4QfcF+ec=:HZvf9fPbE/weFh/egxId8M
 Yiuxu85CyMCo4RS2doe7LGie0iCEXNUQMJ2fWHucXK7uADOL3/FRdjqtztCqlRVmqDx2SW2JK
 vnLp7F6VfzD+QaSI4L9XVHoHYsqXaBsoJMLBco2KsTMqxPgdqFgz4TEB3Xsykwlq5/9BIevpY
 BpkdfXKil2NUV8is8hWgNfToNHAjQ+5Befv4iOVv/punyvGI30qcmFTc2I1eipWDuUnSTaK7c
 VhM7TX21pENBoiTqlBdIzS0crDtVxaDmID5W0YXHc2PZylcW+s+DZo7sCDrul687bjpSX4bkX
 kAiGXVFbhDTI1GqrPvnaRRWXtAKGV9SzryCqlmYij48BNUpei3JQluAPtB4olp0ExjGfRHWX1
 WPiDxl49gj5S/mUgx34JY3ZVSyDAOyAIodh2hh5A6cvQBrFlLMxtOIuOb5l7v4wFDMueAuOSR
 lPPN7rOGUNdpO4LlVqSmxjD1qfX0TMJxK2HgqU9zgZAa/4BPaNtmT5hsH4OTr7XhCV/5jODuk
 ghWDoKXy44BQdCL0RlI5F9Gj2Z81QifjayW2ykBApMN3zhA/b4aJFQA100KogIf3fTPNk77by
 L1C8xfm+dGtM/FDFID4jDugZI8rNPbIZjvIcP/KhHk6WziXEAtVs9KT5R6EhHVVykbI4Z30DB
 51azH+UqRhyJVPpShsZR4F/CJ6XQkTMLHaGCC630y8UZeGSJHD9udPkOroUsCBoaA3ve2S9I7
 bWjUw1lqJwV7snrcERpGIsrPaaBtr5+UKmFWpsNUwvaPnVUYFUHLyOJbud8LSqtHDeG5zKbHL
 azuoDge1WKJwbMDXPZa30xDFuHkgWhZa25/AqClM5cykP5DZ18=

On Thu, Mar 10, 2022 at 8:51 PM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> Changes since v2:
>  *Reduced size of changes, put them into pathset format
>
> Changes since v1:
>  *Fix compiler warnings
>
> The GXP is the HPE BMC SoC that is used in the majority
> of HPE Generation 10 servers. Traditionally the asic will
> last multiple generations of server before being replaced.
>
> Info about SoC:
>
>   HPE GXP is the name of the HPE Soc. This SoC is used to implement
>   many BMC features at HPE. It supports ARMv7 architecture based on
>   the Cortex A9 core. It is capable of using an AXI bus to which
>   a memory controller is attached. It has multiple SPI interfaces
>   to connect boot flash and BIOS flash. It uses a 10/100/1000 MAC
>   for network connectivity. It has multiple i2c engines to drive
>   connectivity with a host infrastructure. The initial patches
>   enable the watchdog and timer enabling the host to be able to
>   boot.

This looks much better already, thanks for following the normal
submission procedures. With the timing for the merge window, this
is now too late for 5.18, but let's try to get it into 5.19 then.

       Arnd
