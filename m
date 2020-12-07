Return-Path: <SRS0=bCa/=FL=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D2C4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 10:55:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1548323356; Mon,  7 Dec 2020 10:55:57 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F62020809
	for <soc@kernel.org>; Mon,  7 Dec 2020 10:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F62020809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f196.google.com with SMTP id n142so1894852qkn.2
        for <soc@kernel.org>; Mon, 07 Dec 2020 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
        b=lzzmt0CZmK2Jmd7kyroYw+RWFtJX3ikmVxwIpkx+vZ/gCDKMah0PBZ3pRvKxqo8lN4
         eStRjgjM4ibwnew31RMzb0hOwrT6uiFAFmqPXGWbPGnLbol0VBIpkeSQGAMsmcvQpOll
         n6xniOcxXcDXSYxpEDnLx9saK/zqAazjt5HMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
        b=qOqxrMHf7dXYa+TRu89ImFP5a9nEpNUw7e0xEDq3zkm4y3oK/l3O56ZWfKlD2t+02i
         DnZhrKQDPX0selgMq2+GIDYT8yr0bujRSm5fKFf4CcTQRz8ymfyqjNfjeOv4++wdrYx1
         LHlUVfeQnWyFz1OCViz3DTTILm8qEQ0xs0Gn9Fn+vahC/CsIvAH/oKszbwLI8JcUwSz/
         t6u3clZeMz26l08lulTh7rs4hFmJpdtpEcWBU4kiCiwSqdgtroqz7wkkbmDxZQTCiubF
         djXVj9ppkrOUUMMtjYBZO70yGlv2b/ZlJYD9rG+Wwks1MPU1fw+qQlt+4dKWPTWK2Dsu
         48Mg==
X-Gm-Message-State: AOAM533oAI6DI01GEO4nZH4JkXWAokMMQz1aLogNzav4QNNWL3BbUdcu
	muTxj1nxX6qVAKAKU81Lz9FDKqzz57ycAQLdKsOvUQ==
X-Google-Smtp-Source: ABdhPJz5LN12jxi1tLmMe+C2qEWEij3QetZAtETxe63ezdGfiuGGd8prNeyfZ8+OZ//s1SFdN8nthpHV6T5ni1agtns=
X-Received: by 2002:a37:8681:: with SMTP id i123mr22759135qkd.54.1607338554890;
 Mon, 07 Dec 2020 02:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
In-Reply-To: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 7 Dec 2020 19:55:44 +0900
Message-ID: <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>, olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:

> OK finished!
> Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Awesome! Thank you Linus. :)

Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
for patches 4 and 5 (device tree bits)?
They are in the Linux SoC patchwork.

Thanks,

Daniel
