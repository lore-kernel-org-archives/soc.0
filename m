Return-Path: <SRS0=Keva=I6=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD25C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 11:07:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B42F1610CF; Thu,  1 Apr 2021 11:07:32 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F201610CA
	for <soc@kernel.org>; Thu,  1 Apr 2021 11:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F201610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qv1-f54.google.com with SMTP id t5so779129qvs.5
        for <soc@kernel.org>; Thu, 01 Apr 2021 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
        b=IwfvFudKaG7ulKrhClM3/mRjUThVsffOd8fFnuhBPUkS35EDofF6DoNmO2uJl0ZJe5
         w9rFM1Svm6WR0jHPftrVEjfPU1eMR2oS0EwmA/dpM000mgQHQyWSWOa00XbSoRkoTy9a
         AmV8tA/1UITRcKRQzP+3RAU311ay+sDi2dTLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
        b=S7ilPEQjYbfQ9oM9MZMNPUoRnlO5yGEa7joxUi2dJ5iAFLmeFZJQe5O4/6PPQZCjGe
         iVBiYfPx4nzxgdtNBuFhR3TqsSb9ril4Ax/iW32sPdDzOu0RV90y0fIRTyT9eu42FP58
         Vcoq66hF68HTnrTFmkrdD1Xrn7Fd+NAE1oX0aK5iJOpRb50ATWYG4q2p1VDYPWCvVz1C
         R2W6562Aqxs2zQ1mr3soLhLIBLKyItltpZ+l3eOOsHcU+vapKyOAacNcmfbpHJYdyV9C
         T/7ZBUrePDHU+PFAMyCj43oXH1DDG2s2DdkXJDQt+RndJ8Xbg3+/fE6IQiyBL3s3C5hG
         yrOw==
X-Gm-Message-State: AOAM53232vDAlNB9yPOh8rheCyS01wHfLaGhdVwxUGvPrpbY9DvwtRWu
	OXKvSqtD8armw10m6yV5fN+jFrF9T8TmSp+EcT++kw==
X-Google-Smtp-Source: ABdhPJxPeLgGNYuUVol7wcn3UD700JCejRwjzkrn+bZT/fTLQdwdf0L0H88XiIRNF+6k69uJk/9V3D5PfwQ6HMp9Q6E=
X-Received: by 2002:ad4:56e1:: with SMTP id cr1mr7615297qvb.25.1617275251088;
 Thu, 01 Apr 2021 04:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com> <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org> <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
 <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
In-Reply-To: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 1 Apr 2021 20:07:20 +0900
Message-ID: <CAFr9PXmT-FUUu-yMBWCe52KDHUSF2+Zhr8wk-NdC+cW+_8prKw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Willy Tarreau <w@1wt.eu>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 1 Apr 2021 at 20:04, Arnd Bergmann <arnd@arndb.de> wrote:
> I found this is still in patchwork as not merged, and I have not
> seen a replacement. Marking all eight patches as 'changes requested' now,
> please resend.

Understood. I will resend.

Thanks,

Daniel
