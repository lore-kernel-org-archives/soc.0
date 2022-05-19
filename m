Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA4BC433EF
	for <soc@archiver.kernel.org>; Thu, 19 May 2022 00:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99D18C385A9; Thu, 19 May 2022 00:11:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A681AC34113
	for <soc@kernel.org>; Thu, 19 May 2022 00:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A681AC34113
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id i40so5016184eda.7
        for <soc@kernel.org>; Wed, 18 May 2022 17:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vsD2gYKrmncZIFDAn8aAbR7fYyev8iCUSUiE3JDCdXU=;
        b=P0jtfwqAMPHT2xnb4oXs4LhGOxLbgS997dRSMqdpa8FJC5k/GFSAVU9Yc2/LmG/j8n
         rh/DxTEiJMcGLKUFwMTf05V0C5sDCGHBiVi0EUYUET3Nogln1aE30E8MC5f/LzjQLWPe
         FdrP0JqfJxp2uDiy6tmn3Xwvfzfk0HItC5DFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vsD2gYKrmncZIFDAn8aAbR7fYyev8iCUSUiE3JDCdXU=;
        b=IuJWL5Zs5y1hctyoP/L5GqF6WSdh6UPceK+qYcEVc4TeH6lt9KLYcQ0UbVcasrf0e0
         dAlYZPqfFCGctscHvORYvuDXvVKKgtysIOoNGM71+q7dRoUTD6JFyEqoZlzz7/eDNgpl
         ThxIhpHkO2vOM2lS7Kcqc9MbxWBfS0JM2C3CxQx0enq3zdVINeKuYGnuLmyslWX0yOGm
         i2F8Bu9bC8gEm8MN/Xnfwljw42eoDd3pNhQTFl3Ya1/ywqgrmhHtAlAGHi0VMQARzz2J
         tCdPjWBVvk1XlzLgity9+Qj6WpDQoPe5bRjnQnUk2n2y/7DF6x3xncpwHG/NTqG8xi1A
         +7wA==
X-Gm-Message-State: AOAM5324/1teO5m/ejc8FpS9Ykw/P9D8dLpWUnbfaezJBRkSmyC6vYnY
	eOuVuuf8uyuXjeuNkCgQtftl2VKqFV5wnBIO
X-Google-Smtp-Source: ABdhPJwjuWp+0qTCZ2Y4SUPxWB2HGUm1C9wTvQ5ZWG9LcA+KPi/NWet21eUfyStFCnYIZ7g379e6qA==
X-Received: by 2002:a50:ed12:0:b0:42a:a8d3:12c with SMTP id j18-20020a50ed12000000b0042aa8d3012cmr2454446eds.337.1652919068708;
        Wed, 18 May 2022 17:11:08 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id z20-20020aa7c654000000b0042ae4dea360sm2024224edr.63.2022.05.18.17.11.07
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 17:11:07 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j24so4895078wrb.1
        for <soc@kernel.org>; Wed, 18 May 2022 17:11:07 -0700 (PDT)
X-Received: by 2002:adf:ec08:0:b0:20a:d39d:6ab6 with SMTP id
 x8-20020adfec08000000b0020ad39d6ab6mr1650614wrn.442.1652919066859; Wed, 18
 May 2022 17:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 May 2022 14:10:50 -1000
X-Gmail-Original-Message-ID: <CAHk-=whdu=QVt=_rviX-5-txb4haxNW-zTc8cFpjsjsemt72QA@mail.gmail.com>
Message-ID: <CAHk-=whdu=QVt=_rviX-5-txb4haxNW-zTc8cFpjsjsemt72QA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.18, part 4
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 7:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I'm sorry for the lack of a signed tag this time, I'm travelling at
> the moment and
> forgot to tag it first. The top commit in the branch is tagged with my
> usual key,
> and I can send the signed tag when I'm back on Saturday if you prefer to wait.

I've tried to encourage everybody to use signed tags, but for
kernel.org pulls it's not like it's a hard requirement, so no worries.

               Linus
