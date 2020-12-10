Return-Path: <SRS0=Y1pW=FO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DC8C4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 10:39:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9652A23D99; Thu, 10 Dec 2020 10:39:57 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D0523D6A
	for <soc@kernel.org>; Thu, 10 Dec 2020 10:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D0523D6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qt1-f196.google.com with SMTP id j26so3130434qtq.8
        for <soc@kernel.org>; Thu, 10 Dec 2020 02:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2WFU4dR05ZGB+4ahSYpvkou90km6wj3qFHGpNOIG9M=;
        b=ZCaNzYwl7SUQuyXA717WC7IZendW6N96htJ/gjKsEIGCoZB1Ol2tjYR06fRUijr3FA
         5ISU/OS7u1Az8OZW/eMNZ9OyMnXLIt3fQebq1fqezHuUQvqK9+KckKMwxfVmd83nO9V/
         Kx92pP+6KrpJnV69lBueCksEBq0CNg/B/GMhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2WFU4dR05ZGB+4ahSYpvkou90km6wj3qFHGpNOIG9M=;
        b=NbGGKYwAzcSZZ8LDCf4Y88kbklqyEoYl654ARVfoDhoi34I3r+IZqVTbJweSRn64n6
         mY9kLIIz8sEFaYtUIhWZ4AXzJN/Fl/sB0kmStIKpLzw76lzxgxVvAMO2pGoo5Vf5R+U6
         zVmT0WB5xGqr5oc31FnaQaYFbc98y6B8uP6ejWJQcCcK2vEJWRWEYys6eoq4DrPF7I3a
         VamRGN9OpnVCajf0XqApmm5BO1YblslQc7Ny1Xi+ynIVp5+4LQtX4iymFusEYX5uhfvA
         4CRExaygtCePzsm8HTA8Ri7YQe1Zh9+Bdw8k2KuYFtTzXplojWUMf76f8X01aCod777h
         5Lkw==
X-Gm-Message-State: AOAM533C0q+tS11QipbxS7/kFYYFV/7OREMqkfPT9fcVzgURq3hHGOkF
	XXRJnrJ+zZJtip/o/vqO7LTJgYOONpncAuCrDxcieQ==
X-Google-Smtp-Source: ABdhPJza71bHTJCiyvRTTQ2YNcpXeu9wyUFDyS+bpZT9AnvgoplhU3GXEc+KIUKkz1TdBEplvPh0gJR6E49WgL8pWZg=
X-Received: by 2002:ac8:5647:: with SMTP id 7mr8312313qtt.148.1607596795854;
 Thu, 10 Dec 2020 02:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-3-daniel@0x0f.com>
 <20201209163409.GA566058@robh.at.kernel.org>
In-Reply-To: <20201209163409.GA566058@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:39:45 +0900
Message-ID: <CAFr9PXmwOEuHHA-kDeL1YS8bWvovrt43MXxyy1J+hGbXwPUFSA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar
 vendor prefix
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, olof@lixom.net, 
	Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 10 Dec 2020 at 01:34, Rob Herring <robh@kernel.org> wrote:
> > +  "^honestar,.*":
> > +    description: Honestar Technologies Co., Ltd.
>
> Alphabetical order please.

Sorry about that. I intended to do that but apparently don't know the
alphabet anymore..

Thanks,

Daniel
