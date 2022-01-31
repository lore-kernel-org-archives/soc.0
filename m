Return-Path: <SRS0=LS/k=SP=sartura.hr=robert.marko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E908C433EF
	for <soc@archiver.kernel.org>; Mon, 31 Jan 2022 13:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9F00C340EF; Mon, 31 Jan 2022 13:00:37 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36910C340E8
	for <soc@kernel.org>; Mon, 31 Jan 2022 13:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36910C340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-il1-f170.google.com with SMTP id 15so11259303ilg.8
        for <soc@kernel.org>; Mon, 31 Jan 2022 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSdj6+/sfksSA1uArlRQHiUhIJOWxGXX+eQ0rGayhu4=;
        b=J1xqT4WdO+z9nBPjGXWQQTsijFA3X8Ksw+wJJXK/vOuUo/cQKQcSRkP5Omdgcy5luX
         +YmdWF7nH2oHD1AnotOBWD3ovK3VpPU/K7wYAp8uClL91ZxAzVa2hL2bQbhUcWw4D3q2
         kb4ruW5s2SjojUtylRCcErcbp0cbk0B9pLObgbOW3Kc83ER/eeONMSyt0LXa/LL0RzaT
         HExbqB9d3n0761mfKYbc5JGfZZmn/sXQNPq7E7YSVI6UIIT70VvQWmV7bEUwLMgwIYWE
         CqfWaOtTiweXrQPG8s0Pc8aV+XmKDXybEJnzIYgKIzgBMgl9vO3kyxcoZkgdOiROC2+B
         i5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSdj6+/sfksSA1uArlRQHiUhIJOWxGXX+eQ0rGayhu4=;
        b=KaNP8m4rj1L9H7bg2jPmnhEyJoVi8udQLa6Ulc0P+c8NNyzr4ryTzsdZ1uREFWFRZF
         lHk3uENBGgj+rzVuMtRTd+Nu+dpcsHfgckRPiQUyFhzya+7v3mxdMVlaGly/Sv5du2cf
         cVebpAD7HBSiXNFSc98gV3k5aEJINst1ncRRLDKwEDOmpIngAj+RFzBE2nzwx8sBRRSD
         xyp1VauXJL1MSVEEFrOt25pAKZ0XVBRzIX1oTYqCnG6nHs53c/2S9v+yKwUeST9fc5Ds
         FB8xquuGlO03yrtqa5RrkFQ4GYRgpw49m1y9FQg1c+n086opK1HCxE8E23p3km+mfbQ0
         fUPw==
X-Gm-Message-State: AOAM532qI9ljyeigMlOnWmjSMixvxH9YD0lOxzQpXoPeAIUhwm3ddODj
	87k/6pr6Vgdez2gqpPJEFjMj8lTUy92TqFBf09vcFg==
X-Google-Smtp-Source: ABdhPJzz9PBIZoI54/Sn7+tK+W6MwqqxsuFaxpqQ+8QZ+g2GlJrc0cvmg6zXfBoXxvr8tHXNTYJYIUAxBAWDvjNcVUE=
X-Received: by 2002:a92:8e0d:: with SMTP id c13mr11729336ild.159.1643634036343;
 Mon, 31 Jan 2022 05:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-4-nbd@nbd.name>
 <CAKQ-crhDHXZptWr5rO5Rb9JttQREoPqE4YO-6nzC2OWc-z06_g@mail.gmail.com> <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
In-Reply-To: <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 31 Jan 2022 14:00:25 +0100
Message-ID: <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] ARM: Add basic support for Airoha EN7523 SoC
To: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
Cc: Luka Perkov <luka.perkov@sartura.hr>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, John Crispin <john@phrozen.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 31, 2022 at 1:57 PM Felix Fietkau <nbd@nbd.name> wrote:
>
>
> On 31.01.22 11:51, Luka Perkov wrote:
> > Hello Felix,
> >
> > On Sun, Jan 30, 2022 at 3:56 PM Felix Fietkau <nbd@nbd.name> wrote:
> >>
> >> From: John Crispin <john@phrozen.org>
> >>
> >> EN7523 is an armv8 based silicon used inside broadband access type devices
> >> such as xPON and xDSL. It shares various silicon blocks with MediaTek
> >> silicon such as the MT7622.
> >>
> >> Add basic support for Airoha EN7523, enough for booting to console.
> >>
> >> The UART is basically 8250-compatible, except for the clock selection.
> >> A clock-frequency value is synthesized to get this to run at 115200 bps.
> >>
> >> Signed-off-by: John Crispin <john@phrozen.org>
> >> Signed-off-by: Bert Vermeulen <bert@biot.com>
> >> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> >> ---
> >> index 000000000000..ea23b5abb478
> >> --- /dev/null
> >> +++ b/arch/arm/mach-airoha/airoha.c
> >> @@ -0,0 +1,16 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Device Tree support for Airoha SoCs
> >> + *
> >> + * Copyright (c) 2022 Felix Fietkau <nbd@nbd.name>
> >> + */
> >> +#include <asm/mach/arch.h>
> >> +
> >> +static const char * const airoha_board_dt_compat[] = {
> >> +       "airoha,en7523",
> >> +       NULL,
> >> +};
> >> +
> >> +DT_MACHINE_START(MEDIATEK_DT, "Airoha Cortex-A53 (Device Tree)")
> >
> > Since this is Cortex-A53 core is there a reason why this is not placed
> > within arm64 directory?
>  From what I can tell, it's a stripped-down core that only runs in
> 32-bit mode.

Hmm, this is new for me that you could do that to an ARMv8 (A53) core.
I know that you can run ARMv7 code but not that you can reduce it to
32 bit only.

Regards,
Robert
>
> - Felix



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
