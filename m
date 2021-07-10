Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7064C07E95
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 16:48:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7EDD96135D; Sat, 10 Jul 2021 16:48:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516896135B
	for <soc@kernel.org>; Sat, 10 Jul 2021 16:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516896135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f50.google.com with SMTP id y42so30665067lfa.3
        for <soc@kernel.org>; Sat, 10 Jul 2021 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMwYm3Z5kzi/jKsZNKzSHFnOUpat3NrlV7AI13eBog0=;
        b=h1J+0nIt4sfDSPrqc3+zf1KmH1ZX/FyrDYTxSHYZF5cNvUWD5k8W0IacYSS/7Yp2Tw
         S7byUrDkJ2y8Pi727vaVaRBdIS7p16mRkrIZeUy2OcEJTZ++6E5T29c6GoFamaUUS4pQ
         ADhYcYMcoNqrSzQOTx3Mfd79GREJ8Quw1wzs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMwYm3Z5kzi/jKsZNKzSHFnOUpat3NrlV7AI13eBog0=;
        b=IjaXBbesz0KTaLJq8kxf6hgVSGS6WJfwiOz54qMUjgT4rp43VJ9CeHOUAdyzqaRT4+
         k7sCe2RnyKIU8Xu/rP5zIZ+EefnaeiZ/6kw51IpHFoVA29QYMX03F9hcvh3Le6WunezS
         +sjUtORh2NahPdG/IlDqDINfc7XWaOaQKQw+4vWYl7DkAmNzrZBOahQrqKdr7rWb7uLe
         kRlPN6h5INkX9cwlGAXW6YyeIRngxNaDjFxn/5eGRycbALOxReW+dO9LvrWnjkn3GTKU
         OCuqGmzT6PE8ZjUlOw1PMEShdrfcM8GnLOE7peGjF9vluJ53Wq/4+YsTihL7x0e5JAwr
         vnAA==
X-Gm-Message-State: AOAM53036ydq1LQqYQH/s51M+TvPgyStLvpt/TMYAOW2b1mDOHUlW6fe
	ZRBd3frzYJv7NGBJxB7+R1E1RqXtkK3Nvjs6
X-Google-Smtp-Source: ABdhPJzaUmwcWZiG1uXhk5WXWbN6N/Nggep5w1S2rdDoBU4reXRrbfxkAWjBS55t8X2tn9GZd6fznA==
X-Received: by 2002:a05:6512:11e2:: with SMTP id p2mr33900753lfs.312.1625935691387;
        Sat, 10 Jul 2021 09:48:11 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id u15sm744587lft.75.2021.07.10.09.48.10
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 8so18942388lfp.9
        for <soc@kernel.org>; Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr32924003lfc.201.1625935690648;
 Sat, 10 Jul 2021 09:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-3-olof@lixom.net>
In-Reply-To: <20210709234054.10288-3-olof@lixom.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Jul 2021 09:47:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3Pb1LxbXkTX6itxRvgaV9JwBaSyGmE8zXUurJ98M2Bg@mail.gmail.com>
Message-ID: <CAHk-=wg3Pb1LxbXkTX6itxRvgaV9JwBaSyGmE8zXUurJ98M2Bg@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] ARM: Drivers for 5.14
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.14

Ahh. You had switched the diffstats between pulls 2 and 3.

            Linus
