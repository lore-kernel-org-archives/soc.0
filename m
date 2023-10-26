Return-Path: <SRS0=oVyb=GI=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BF4C25B6F
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 09:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A27A5C433C8; Thu, 26 Oct 2023 09:22:26 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79A23C433C7;
	Thu, 26 Oct 2023 09:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79A23C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a87ac9d245so5005967b3.3;
        Thu, 26 Oct 2023 02:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312144; x=1698916944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WYXhrqPv+yxcJyje5S7Nyo29EB+cd9y/YPgOVg+ufg=;
        b=psIhEmgOmspJ+IlPk7BN2K23GdK1I/9J7U9bwT2QGcYtrqb8xhQwjCtxStzLDKkh9P
         xVd22ugE+GaISPTWRYfAtqGarEj6a/7Hr2U6CqTZqh3dpZLbwlK2SfpGztWkcStXr6QP
         +cIltIJ9KaLMc5NddR7pPgGNSalha+hAjZD7BmNWeDfz1A1DnF47m+U182I4hQNkCDlx
         IFwdhqKX+fcAp+hy9RCZPg55CiS3eUNSXOX2FrIvOlI7M1h7Rkif/k9SVPCOR4EBQnoB
         jIBx/JcPFZqpV0mDcYh5tZffVfvRzhnHI1yfyULqhXgzr6MquvOOGmUYwYVK9awBdjFt
         yc8A==
X-Gm-Message-State: AOJu0YxgGra1EGvZ4vpJRuVLnUFU928u5VHPjn8t1d/W2O7c7eUHQXjC
	UbWQaqe0l9n1LCd9nORYf5ZEm+tq/1Y8rQ==
X-Google-Smtp-Source: AGHT+IHOb90R+iSpIzkwWvRP9dyc5LWs5yeABOgFydW4FY2FooHdGK0S2zqqctcpVwC9GDVJw3BPhw==
X-Received: by 2002:a0d:d84f:0:b0:5a7:d133:370d with SMTP id a76-20020a0dd84f000000b005a7d133370dmr18738027ywe.16.1698312144157;
        Thu, 26 Oct 2023 02:22:24 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id y83-20020a0dd656000000b0056d51c39c1fsm5799204ywd.23.2023.10.26.02.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 02:22:23 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7afd45199so5193497b3.0;
        Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
X-Received: by 2002:a81:a090:0:b0:5a7:baac:7b34 with SMTP id
 x138-20020a81a090000000b005a7baac7b34mr18072832ywg.28.1698312142181; Thu, 26
 Oct 2023 02:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231018052654.50074-1-hch@lst.de>
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Oct 2023 11:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Subject: Re: fix a few RISC-V / renesas Kconfig dependencies v2
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, Oct 18, 2023 at 7:27=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> this small series sorts out a few Kconfig dependency issue for the
> rich set of RISC-V non-coherent DMA support.

Thanks for your series!

> Geert suggested for it to go into the soc tree, which is fine with me
> if I get a stable branch for it as it is required for further dma-mapping
> work.

As Arnd asked me to send a PR to him, I'm queuing these in
renesas-fixes, and will send a PR momentarily.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
