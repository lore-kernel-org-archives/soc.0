Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328CBC63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:00:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CC821221E9; Thu, 26 Nov 2020 21:00:36 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9E4AC21D7F;
	Thu, 26 Nov 2020 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606424436;
	bh=gkrNoTrGXJaU09TB6ndRsOqm5rK6NwVPWw9nalG6YlY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=K8F804WDmMH4hgRmp9woF9+julHdxKIdj9flkMXzGVMAVF25Q8T7nqke91Y6/bNcI
	 FufLoq9f9IfoMFNgq66LVYIjUx7HA7GfJjhpoucMSFSntvplxzChYPrxs9jdxh+upw
	 Gbtk3S5vw39V+g06CU/T3VBytowwwiN9Ok+Xjuu4=
Received: by mail-oi1-f169.google.com with SMTP id l206so3521583oif.12;
        Thu, 26 Nov 2020 13:00:36 -0800 (PST)
X-Gm-Message-State: AOAM5306bQpAguIPbsEcHCwpaUyclWv3U/4w+GmaxOo4T4OHq5IhIj2Z
	XBYDYS2LIsgzAjaVxTQrwjHGhq/1QIoP1Y1M8Yo=
X-Google-Smtp-Source: ABdhPJxUL+bKxCpM2oSi4hUIKHrfPqlK7dIOlD33Ejyn2Y07VR80SEo3VKEniJXbZ0SLW1Ymu8tP98tUOzCk5YnQ1KI=
X-Received: by 2002:aca:3c54:: with SMTP id j81mr3020525oia.11.1606424435952;
 Thu, 26 Nov 2020 13:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20201125120134.GA1642471@jade>
In-Reply-To: <20201125120134.GA1642471@jade>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 Nov 2020 22:00:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2CDp0KwCZjffA78fXUqOfAkvUb8Q=R64830fvvn_WG2w@mail.gmail.com>
Message-ID: <CAK8P3a2CDp0KwCZjffA78fXUqOfAkvUb8Q=R64830fvvn_WG2w@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver for v5.11
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org, 
	Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 1:01 PM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this small patch which allows the OP-TEE driver to work with
> ARMv7 based single CPU systems.

Can you rebase that branch onto -rc1? I had started the arm/drivers
branch early on top of that, so I'd prefer to avoid a backmerged.

For the commit itself, shouldn't that be marked as a bugfix and get
merged into v5.10 instead? If it should, you don't have to rebase
since the arm/fixes branch is already ahead.

Also, it would be nice to Cc linux-arm-kernel on the pull request
in addition to linux-kernel.

       Arnd
