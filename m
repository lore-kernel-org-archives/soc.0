Return-Path: <SRS0=W2KE=FS=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6E0C4361B
	for <soc@archiver.kernel.org>; Mon, 14 Dec 2020 09:27:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F39A722AAD; Mon, 14 Dec 2020 09:27:41 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7046022583
	for <soc@kernel.org>; Mon, 14 Dec 2020 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7046022583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f68.google.com with SMTP id a12so28410531lfl.6
        for <soc@kernel.org>; Mon, 14 Dec 2020 01:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mlnOgRlYfdWWAtF0jT9VPpITSWK8EzRly1RHNCoFmLA=;
        b=xr6HjhuGFyztbp4aNTyix9tdk+oG9PipBRVB5d1A9QYCuxTk5o8ERogp6kz9yPpsi8
         YbC8XV+qRfA0o7FFGZgtsBUWYBuTQn6U0MWTZWNKK9U211wBbXgLzPIaNPVgS3DlziX1
         7hYtnbfOlpkQmQbKfJXAZGTixMaMAD1htXm7z/4HEmErgO0dTe0Qro86Vmzr/DF+uE+e
         DNUCMqMQxNik8oltpgib0H1gb3pwpP2vxc5Nu4O+6cPj5zcREApt++HW4JDG7Nr/0blT
         MwGCQyUw2E6TtSJ1IoeRuwEkmobduSOksXdPhzaykVgeWO8ez3Xf5TPDYo5U9u/Ah74l
         U7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mlnOgRlYfdWWAtF0jT9VPpITSWK8EzRly1RHNCoFmLA=;
        b=X1hhriJ4ohDqR/mnbbccAa9fFjbqhvWEb0klAO8VG3HqNGjpYuv+qW7kfG2u6Xgxqf
         r4z6C0AJ6bbJnqhHduFQsdvqGkl7JfiIEYJSe/Ryg/7Uibth+nfGPraGIjqle/bxne2w
         EBCO1sAgRI27oYMZCR+/Us7cJo60L05DjD5BBbJeZYGtTZdp5QanV1fkPzGn1tJT/txv
         2SINRVTmEBi8pkNnKhUrE9uFcz3NriCcE8rCLF0y+PjBmW5JCbM/nHx4j8FqILyCMCEi
         qX8rjSM2y7PZDanGAm3qwiA3AgDPr1Zgeu0VnhLOBvYIgV8FLKYNXUCvHAwcAJPyd1NO
         o6cA==
X-Gm-Message-State: AOAM532yTTY84Skkv6RyYIkFcW55u1G56A8mXLwV44J032Yz7SZCFwib
	XxS+JsqiyzTEMynKRX8d/HbNQfenuOp9QLeQHUkbcQ==
X-Google-Smtp-Source: ABdhPJzGfF/vu7nSSKr0Z061mb6vkrp+fqfxWfVG1o+XueFjyYMpJ9Qse/CDkKG2bP6HvYJNDDf/q/VcH1TqwB7Wg4c=
X-Received: by 2002:a19:6557:: with SMTP id c23mr8730637lfj.157.1607938059529;
 Mon, 14 Dec 2020 01:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20201213225517.3838501-1-linus.walleij@linaro.org> <cc06e06b-ff24-68a2-f5f3-c8533118a34d@redhat.com>
In-Reply-To: <cc06e06b-ff24-68a2-f5f3-c8533118a34d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Dec 2020 10:27:28 +0100
Message-ID: <CACRpkdZp+gnJAo02OJkiN_KUX3bOPc2vzQGWHLZF2hQHvuQQkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
To: David Hildenbrand <david@redhat.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, stable <stable@vger.kernel.org>, 
	Kalle Valo <kvalo@codeaurora.org>, Pavel Procopiuc <pavel.procopiuc@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, wi nk <wink@technolu.st>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:

> > ARM SoC folks: please apply this directly for fixes.
>
> Can we come up with a Fixes: tag or has this been broken forever?
> (assuming modern boot loaders)

It's been broken forever :/

> > David: just FYI if you run into more of these type of
> > regressions. Actually the patch is unintentionally good
> > at smoking out other bugs :D
>
> Thanks for CCing - I'm adding some people that ran into similar issues,
> but not sure if the other bugreports are related (or have similar root
> causes).

Yeah we first were convinced there was something wrong with
the patch you made but I read it over and over again and there
is nothing wrong with it at all. It just alters the behaviour pattern of
memory management in some apparently drastic ways.

After a lot of silent crashes I finally got an external abort with
a reasonable backtrace showing the PTE pointing to this
modem memory and then we figured it out.

Yours,
Linus Walleij
