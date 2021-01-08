Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4910EC433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 13:25:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0DD8A23A05; Fri,  8 Jan 2021 13:25:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9592239FF;
	Fri,  8 Jan 2021 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610112327;
	bh=VcRV33p0SkKTn9rguv5A4ssyBu+kLEWSBXUNimM919U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Vi9eWm5JFShpbEfCPhCeJ8v2xM5Tfh1ABh6k5od2dRtLw73VeqroDaW6ZF2SvPdhD
	 ZigKQ3JqteqVkTisDdLJepNuTuZKUAI4KArKamQAomkKhJIDK+qQRdrU4mn7a09N3S
	 aWo9wsc3j3G73GUFt+XYyHUXJTV+vkB1InJHOz8ARvrVVPRYUo6pOSlHGLwVB+W80f
	 Uah87mD1shTGxt6JKXSeP9J0H2+FMq0kYhYQGqCzThF0b4996FcbBmup+fF5tvsYxM
	 H76CcmOIyfiKkl1jR+RczWQWERrBTpvSoAXffxniybbytw5vOz50asX5D8H/ghDOAc
	 Od0KQgG529Qdw==
Received: by mail-oi1-f173.google.com with SMTP id p5so11296045oif.7;
        Fri, 08 Jan 2021 05:25:26 -0800 (PST)
X-Gm-Message-State: AOAM5329fpRRN82fZ/bDzEOYvoTdSpPbrNpZ1gbgJYuIshp92jJCIG4x
	65InNwZZ50AJWf5oOfb6ruGdLTrF76Qbr8aMgW0=
X-Google-Smtp-Source: ABdhPJzFTHVAWCfzExdXXJfB4IT8mh06IJ+YPPJMRSSzo2Gqhb/3BZehi2e9sLq3sp/pdryBG/5BKZqI/DlBR98+W1k=
X-Received: by 2002:aca:e103:: with SMTP id y3mr2187363oig.11.1610112326237;
 Fri, 08 Jan 2021 05:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com> <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
Message-ID: <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
Subject: Re: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
>
> Upon release, we cleanup remaining resources/registers if necessary.
> This happens when user does not call IOC_BB_FREE properly and the
> function will do effectively the same operation as IOC_BB_FREE.
>
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

What is the benefit of calling IOC_BB_FREE instead of always relying
on close() to do this? Would it be easier to just not implement IOC_BB_FREE?

      Arnd
