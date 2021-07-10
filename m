Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7759AC07E95
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 16:45:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D46761355; Sat, 10 Jul 2021 16:45:31 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C8E61107
	for <soc@kernel.org>; Sat, 10 Jul 2021 16:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C8E61107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lj1-f180.google.com with SMTP id r16so13990786ljk.9
        for <soc@kernel.org>; Sat, 10 Jul 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LccKoa1zF1Ue87qbczvb+yg8Tc9aMl+Aop1Gel1Zx9c=;
        b=O2rBjXyzWsIJVf0JQAX3asSn1W5GsNf2YvRAj4999quiWviTiUb2LwFQTnmx7w7OD8
         Z186pcU6lv0FdMdCYP5TLYoKSpqifwnIMGHTAfITbnhSYPBdsALl5I8WaxIbE1GDLeNB
         UeAOwHMHcUI+qvE3Yy5tYxXcyNPm/x0yWofbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LccKoa1zF1Ue87qbczvb+yg8Tc9aMl+Aop1Gel1Zx9c=;
        b=GKEhdnjfVl+nLcxd8s93ZRJyoGyd6y+InxuhqT0enTl8Eouy4UCZ55pR3VnNaQQIjX
         IVBhimvPYaoqlhvw115UmPqD8hbcWbapTJdhofxAbIYKrhi7InC+oO4EFjh0l0H0n5dV
         hssz8Rg04UwJrda/zuT3zLdV23DjpKDtseJbkZnRvVZMP5+QD3PS3JssC1TRI2/zNOmw
         CcoATL3mB7gzJIsvcyCg9oczU0SV1tp+B9FMBM8Bdjl577UyOnki8gfylfaBYcy0ghUS
         VeNRX31bxXD+EKJXl4IB9RnRlDe5pRkxLejMLMEYT5z66KweOiRajTKahLEC5yb5LAHk
         1lDQ==
X-Gm-Message-State: AOAM530sQdBjt49NZzxsUfVuxnx90QxXIXT8HKXuQH5KVvC7bAeP3dQY
	XrZKEJx98ZKdk48OCNO09Kum+cqBsrZcVZVb
X-Google-Smtp-Source: ABdhPJwnOEYfvmqWJqtNqekJNiUT6Ut5AzqH3GFI/vnLLpMVuBa3egk172aFNt6DPfgeJGd4GS5PHg==
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr13644391ljg.131.1625935529006;
        Sat, 10 Jul 2021 09:45:29 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id w16sm924402ljj.66.2021.07.10.09.45.28
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jul 2021 09:45:28 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id y42so30651336lfa.3
        for <soc@kernel.org>; Sat, 10 Jul 2021 09:45:28 -0700 (PDT)
X-Received: by 2002:a05:6512:2347:: with SMTP id p7mr3528712lfu.253.1625935527966;
 Sat, 10 Jul 2021 09:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-2-olof@lixom.net>
In-Reply-To: <20210709234054.10288-2-olof@lixom.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Jul 2021 09:45:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
Message-ID: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

What?

My shortlog matches yours, but my diffstat isn't even close.

You show 554 commits, but then your diffstat as not a single file from
arch/arm*/boot/dts, and says:

On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
>
>  97 files changed, 8428 insertions(+), 5174 deletions(-)

while mine is very different indeed:

 552 files changed, 24060 insertions(+), 3691 deletions(-)

I suspect you got the diffstat from something else entirely, because
mine looks a lot more believable and matches the commits listed in the
shortlog a lot better..

              Linus
