Return-Path: <SRS0=Vbwl=PM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4204C433F5
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 23:16:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D3C661039; Sun, 24 Oct 2021 23:16:49 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3819C60FD7
	for <soc@kernel.org>; Sun, 24 Oct 2021 23:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3819C60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id n7so6113756ljp.5
        for <soc@kernel.org>; Sun, 24 Oct 2021 16:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7c8mDt5oU6grN/T27nlrN9m6S6mPoCForSkLbFys4hQ=;
        b=qm7X+j5P9wG5YV6anbu6txrHkdOtZrGzk1C5p/otJ90cVX2ViknRy63w2NST+aK1KR
         hkoVJSSE3lZuf0IZNeFIa9IPBtST8cTG0ssSFn8w9HJxBH1ovF4L4LKUgzMNMhIcVI5N
         xjyPA2x2ZyLJO48lKunCAsA1/4dlkCPMgmr33Ca4OvKlrQhE1Q80eSmJiMl44JB1OcES
         ePDBF+TAIkwyohEzFmh9rhkHXh3zOWpLjt0ngdsPfCJqolFqoaEbXJAGg2tw4s6BVj3m
         LIhEyxrkGLPhWF6Z7eTbNFsG+PT3F8nO9H+KqXGqKYn80qN11u4xRFnklv1rcGffqZQg
         vMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7c8mDt5oU6grN/T27nlrN9m6S6mPoCForSkLbFys4hQ=;
        b=awuYTYVd3qwkA6/jDOVPXvAtvmt7z1lEWWX3ZY7FMsD0M85pEaKzgrv3LkghHnfFjf
         vVGfnGnOmFECiOC5I4n5W1AbQjB5nxs+EcIF86tBsOH3qacQrIWx8cAM2AGAcro8yt14
         uFAAbdef1QORGQ7xvEOb5H+EEw1QouOUptDzb6/E5b71yEdrXo4XSvkKl7Ss0g98lVWi
         cx8qYwBhOI5GXnS1+IytROMz+bk+Y+ZFBfPh0u1D/G9eQhOSiu3QM61PThYjx0m2NvXu
         y3kvz8ZU0fGUvURXqYYuRX/NiUXf6Vpfrsw4MxenCyp3qlhhY9CoOmQPc3EWSwg4zLxr
         jHwg==
X-Gm-Message-State: AOAM533QWT1yt/T1HqCMuA82dpC7e9tvIGp62yzP0xPU5mqq/Q5lG7tj
	MtRQO6Vp/kHybXrmk0PDP+jpvSAtNAZ/1jyrYwKunA==
X-Google-Smtp-Source: ABdhPJzK8HuLWgNka0Gsm1lpjg1VBs6Cv75aRPFmVlFmVh5ohfE5x4WnvPYnpbTcdht3SFLyy7pXW+rG7G6BNzLvJfo=
X-Received: by 2002:a2e:98c5:: with SMTP id s5mr15404100ljj.432.1635117407175;
 Sun, 24 Oct 2021 16:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org> <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
 <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com> <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
In-Reply-To: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Oct 2021 01:16:35 +0200
Message-ID: <CACRpkdYe_f_iS9Qu5D63bSfH8+sFU2eHrbqTgiECo53s0VL3jQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 11:10 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 21, 2021 at 3:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > Please apply these instead:
> > > https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> > > https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/
>
> Linus?

I don't recognize these patches, no idea why I have missed them :(

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Arnd, please feel free to go ahead and apply these.

Yours,
Linus Walleij
