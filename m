Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F1C83F12
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 00:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66337C433C9; Wed, 30 Aug 2023 00:32:21 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3E51C433C7
	for <soc@kernel.org>; Wed, 30 Aug 2023 00:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3E51C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcc846fed0so76318311fa.2
        for <soc@kernel.org>; Tue, 29 Aug 2023 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693355537; x=1693960337; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gzg4UEp9aD0VDjzsHgbVhYzgvlS+KiuyM3pgV5dY23Q=;
        b=CoMjiAcgCaF5vAgJKNQiaRKpLvcrZcHP1vpv7E0LrSMNANRdqDnDxlBhXRhaOZECjq
         uVvKTsyBQK5oiaiHkrkuJYLm5B+pNoiTvS0AzQEhBNas3OSSWpVhdmgObYKbRE/cciAq
         Ja83fqh2j/zXqEW65lGuwORVw3HIcpM0iGTgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693355537; x=1693960337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzg4UEp9aD0VDjzsHgbVhYzgvlS+KiuyM3pgV5dY23Q=;
        b=cbRIg+A1stTONTszN8WCXHA3eOwq0Nr+3PYpqBdssdhMQakJtZGf69FIiSrV3Cl3/z
         6D0eA8RLqxA6Mmv1PgA20cgiIgmLlZEDC2FzA+EqY8xLXhwqWzxJOE02a0kEBSwH8znY
         5yRA6Y2WKBLLsw5wFILgw1Yu2EyJ0tdstomS3ozqVisSJLYZEIDd8MRUeE0FeEKiSzbi
         OcwHQhpCS0TNMjupykuJhx0GcPErh58eXIJoTByxEMnNkwj2NmA223zj09Rekw0XhFig
         6j6GsZM5UumccWrtZnlKARPfFZ+vFRFLPYtJTjZK19LmMzjxCKL4NJsKgIbVMM1BN3en
         3lGQ==
X-Gm-Message-State: AOJu0Yxi/XPUy3lzyJSjYfo8SMTMEH3i7XZtQ4VKByHvkX3E8gYyvxve
	BC5VTgD3pAKUlgwTUEtLzcW6eIn5s7yJkZBhO+xv0j5L
X-Google-Smtp-Source: AGHT+IETIDa/GUB5VbqZL39fi1m4SO4WqvkaWdiKKTKUtGpdd/y8g0lcii/t/mHtBoysaLd8qBuZqA==
X-Received: by 2002:a2e:b172:0:b0:2bb:b528:87b1 with SMTP id a18-20020a2eb172000000b002bbb52887b1mr513120ljm.50.1693355537346;
        Tue, 29 Aug 2023 17:32:17 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00997c1d125fasm6569012ejf.170.2023.08.29.17.32.16
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 17:32:16 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so19959466b.3
        for <soc@kernel.org>; Tue, 29 Aug 2023 17:32:16 -0700 (PDT)
X-Received: by 2002:a17:906:2092:b0:9a1:b5fc:8c56 with SMTP id
 18-20020a170906209200b009a1b5fc8c56mr412325ejq.55.1693355535843; Tue, 29 Aug
 2023 17:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org> <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Aug 2023 17:31:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
Message-ID: <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Aug 2023 at 17:18, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Please don't use random letter combinations that have absolutely
> no meaning to anybody else, and that aren't even explained.

Side note: at least to me, 'gen' is short for 'generate'. Looking at
existing kernel naming, that's how we've used it (lots of examples of
that from different areas).

Do we also have "generic"? Yes. And because 'gen' does not mean
'generic' to anybody, we've typically spelled it out - as in
asm-generic, but also 'sound/soc/generic', or in fact a _lot_ of other
examples.

Because we really aren't that close to running out of letters.

As to the 'pd' part, it actually has a fairly widely used meaning in
the industry, but it tends to be 'power delivery', in the USB-C sense.

So I really find that short-hand actively misleading,

I realize that the SoC code has used that shorthand internally, but
once you expose it like this, I really think you should do a much
better job at naming.

                 Linus
