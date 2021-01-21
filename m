Return-Path: <SRS0=+tBH=GY=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CF7C433E0
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 08:34:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E92423998; Thu, 21 Jan 2021 08:34:58 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9940123976
	for <soc@kernel.org>; Thu, 21 Jan 2021 08:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9940123976
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f170.google.com with SMTP id x23so1526842lji.7
        for <soc@kernel.org>; Thu, 21 Jan 2021 00:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lS8yS4z5gTRHyWYZ/MorqH00QDK2F6AOgR3jNZjO6uw=;
        b=BPXcee2xlc4t3zVun2eTfkyri06k5pl6h7fkauTSz0bMHzX51jxkZGvUWY4HmCBHfU
         Uqos+y9JB+nfRQXjsyU+fk7JyjMM/PI+94oZGRP4bEToOrt0vz4OgIUj2WqYPU5MTQ2R
         5YzLNlb/3NrRjd7nZOfVCtQD8MZLu7Ift+AacsLu2R2thwngH4IxM/2eABKE3/kiP/kN
         6RmQcR/yIW31FDZQrU8qJ+ViMK58pM+f5C80rGqK/lkl1AvWmMwXGH5by8rSwK8cs160
         mTcFLMuvN9xyAMiVc6emqDMHJrosXy13tNeBMWbkFJMQ5iV9aHlUZ/zzRRq5Ok71qehj
         cVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lS8yS4z5gTRHyWYZ/MorqH00QDK2F6AOgR3jNZjO6uw=;
        b=pISfzjxalCLrAj49EDbrpAuQJGIOXrMUadf9pJZ9BJn4lg/b3I5E/L3Tgz8VKuAemT
         W8IPh+DGN/EC9LDUF7HpDfvyV8eI7c9t3mZzDA7dvpPBKoyUSncIJE0CoOvUcyZBUc+3
         8b/FM9xcwjHcxVasiuDQpIBj3jZWt12V6DO+IsDkXrbxhcmq8q1WHunsq1PK21HM4WtW
         62Tw3fumxJE/vVe6BptvS8ilY4C+rr0bSBzCsyXPbFXTq5tGfEyBFx7aR47i+ZdRxdj5
         H2Bty9KSVy/g4uTcHZ5CHqzTy//bMGn1gth8oLz+osFHB8OiNWx8Q9VJrz6ETUSCo6QD
         lSEg==
X-Gm-Message-State: AOAM532Wa0bKnRsHnbxVQKYeoT3r4Bk9cPxeoARGIXdYzD6/1ORnIQhe
	b2N/XcIn7NJTg8ZJI7C3YoU20qL8v2egA1WAkZBoQA==
X-Google-Smtp-Source: ABdhPJxMfoLva9Z9+4Vk5RdQNogIN4B9DKEC7RABIHA5mu0hvaAFjmZSPKffe1TCkudstO+9cv1RdOfrQh93Tq/e4jQ=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr6291564ljo.368.1611218095600;
 Thu, 21 Jan 2021 00:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210120124812.2800027-1-arnd@kernel.org> <20210120124812.2800027-6-arnd@kernel.org>
In-Reply-To: <20210120124812.2800027-6-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Jan 2021 09:34:44 +0100
Message-ID: <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: remove u300 platform
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 20, 2021 at 1:48 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Ericsson U300 platform was one of two ARM929 based SoC platforms for
> mobile phones in ST-Ericsson after the merger of Ericsson with ST-NXP
> into ST-Ericsson, the other one being the ST Nomadik.
>
> The platform was not widely adopted in Linux based systems and was
> replaced with the far superior ST-Ericsson U8500 in 2011, but Linus
> Walleij kept maintaining the code for the whole time.
>
> Linus continues to use the Nomadik machine, but decided to drop
> u300 from the kernel as part of this year's spring cleaning.
> Thanks for having maintained it all these years.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/lkml/CACRpkdbJkiHR9FSfJTH_5d_qRU1__dRXHM1TL40iqNRKbGQfrQ@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I was planning to do this but you got there first :)

The reason I cannot work on it anymore is that the device
requires a special signing server to flash new kernels and
I don't have access to that, and we never created a U-boot or
similar for this device so anything needed to go in through
that flashing tool.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will you queue the patch for ARM SoC?

Yours,
Linus Walleij
