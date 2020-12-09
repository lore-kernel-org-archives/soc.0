Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765E3C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 22:52:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A61E23A22; Wed,  9 Dec 2020 22:52:29 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002E23770
	for <soc@kernel.org>; Wed,  9 Dec 2020 22:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C002E23770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f66.google.com with SMTP id o17so2502254lfg.4
        for <soc@kernel.org>; Wed, 09 Dec 2020 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LoZxe45tfXr4/FDvc4CABuzQn5OyKXJcb52tHgb8yL0=;
        b=byRPSi/mKwHLY2fdQcTNrRj6YvGbp+G5DCe532S8h9jvM5zGWe6bGFkBgJLn8a8efh
         wNR1E46A1xONxrnSS6D5a1rIQTyJswuGS7bQtK2cELi3Z4KHz3Uv0BX+UljIjb4CQ0pD
         OkiO0DcVdNYHZ9vc4BJEeAjyOABQDyJ8appoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LoZxe45tfXr4/FDvc4CABuzQn5OyKXJcb52tHgb8yL0=;
        b=oXnxSEkUTStTqOX6jyIjJSzgvVYAZABmgihhU5td06lqHHN5HxJOQi/V4ZlzV6seDr
         EBpLMQl9UU+T8ul5KMwgXGqsH1eV+8LWwRJ2Sxq72vasQIpw7NW+Bp62A9bOg0lYIlx6
         Kc19oOFL6CajTCNeGYFzbh1p8JUq2g2IViSGqeVAD2ivDamBaQBWtny+EP9RHbx+XXY9
         F6gcCgi3JIXTZ8u8qvB95i12BdQYcQZ5SF/Q/E56vTHYUn3b7zj6PnvQx1SEZeyvBJ38
         mll0FT3weVictVBRMfLZXHUDPPRKbwETbSPWpgf6JfUyEe7OntinpkCFPJZNArlGuimL
         4sKg==
X-Gm-Message-State: AOAM532KYYgos3ISpHGfh171MzDkmbAGTRGO1Nwe/FpSNJGwG2ktnyjE
	O36Rx3BByIkF0R58MkxNML6hSTx6IlDEqA==
X-Google-Smtp-Source: ABdhPJxqMI7NTmrrqK90oxkrHWKslL18zmix4fCGAmRRbT4lpEZcXdgD7g5caI+FxsPFjpVKmUDTdg==
X-Received: by 2002:ac2:46cf:: with SMTP id p15mr1634747lfo.628.1607554346845;
        Wed, 09 Dec 2020 14:52:26 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id t5sm307723lfc.79.2020.12.09.14.52.25
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 14:52:25 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id r24so5406628lfm.8
        for <soc@kernel.org>; Wed, 09 Dec 2020 14:52:25 -0800 (PST)
X-Received: by 2002:ac2:4987:: with SMTP id f7mr1565679lfl.41.1607554345273;
 Wed, 09 Dec 2020 14:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
 <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
In-Reply-To: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Dec 2020 14:52:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgkby5F6EpGxN3kXaxf8YPkXKb+873hSE7Ly+zEJZrXrg@mail.gmail.com>
Message-ID: <CAHk-=wgkby5F6EpGxN3kXaxf8YPkXKb+873hSE7Ly+zEJZrXrg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 2:07 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Stephen Rothwell just pointed out that one of the fixes I added today
> was missing a Signed-off-by. I corrected that and uploaded a new tag

Gaah. I had already pulled, but since I hadn't pushed out, I undid it
and re-pulled..

          Linus
