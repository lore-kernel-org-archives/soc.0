Return-Path: <SRS0=Y1pW=FO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAEEC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 10:33:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC0DD23D69; Thu, 10 Dec 2020 10:33:12 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFFA23AC4
	for <soc@kernel.org>; Thu, 10 Dec 2020 10:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFFA23AC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qv1-f66.google.com with SMTP id s6so2118582qvn.6
        for <soc@kernel.org>; Thu, 10 Dec 2020 02:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6nfEy7jb4JxUEN3UyBm4VG+qNR9wioZAF6quKu0rvhQ=;
        b=UivoiDMfsRAwmZ/ZLGjUImJpkcyCQo02ymzAKS7rp6+ceFp9V1DnsjBzxirP4Rzt/4
         9Im9/toCJyxJbeG8opl2ngddMKgyKT2+mtJrcAhNkmvalLFxOcT/uivTCNjhnid7buqU
         QsRW138BI3fo1Ts6x9aGLtV7zE/rhkvEj3emo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6nfEy7jb4JxUEN3UyBm4VG+qNR9wioZAF6quKu0rvhQ=;
        b=ltQEl7RbMGqnPy7zvOAM7F6K7xudcVEXPWRiJF6niPEylEmz0scfq64v51g6hkCSOT
         4iQhKE8op1O+1b1+9BSRmwpG8hpqqT5V7PP0m84uWLD5vMGfuvebLW57JN3mQzHT1rEz
         nd6EOO5rmbGp7pMQL41SLwFgznxpcTAa/6ajh6jpg3j923h/gR0BH6jYte9dSotkEc3p
         pTlOv7UTdKiokQekF3UMXxdPuknfao5jUZUkpi94yAxErHURwfTkleFBcM/RfgkEXBhZ
         h+D4wzy0spdKhBJZu8L3LTAKWbgengzA7qcI6pY17Gt5Cb0K9Z0/vHP7Ns41LjKA5a7W
         iN2Q==
X-Gm-Message-State: AOAM531uUGQb6zKGH6BCm5Yo3Fy9yFgwwxndxitr+bp+FJDv0UPl1JBS
	/oYG8VtDKU1hSfUmb1aCKyPUGeSwxgPFZ8zkqRMsmQ==
X-Google-Smtp-Source: ABdhPJzZGRjhEeNNEDGAWAw+JmsON7yXLlAyf0iR1s+9MtHGwvfratcRgIz5ZM01Ii2KY29VX/Ss2pqrNPcIr18iTC0=
X-Received: by 2002:a05:6214:140d:: with SMTP id n13mr4614903qvx.45.1607596391428;
 Thu, 10 Dec 2020 02:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
In-Reply-To: <20201209163536.GB566058@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:33:00 +0900
Message-ID: <CAFr9PXmuCJJ0LXTcH56Dv_ddePaqLtVFVgeJdv7hVN7yRRyj-Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, olof@lixom.net, 
	Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 10 Dec 2020 at 01:35, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> > This adds a YAML description of the smpctrl node needed by the
> > platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.
>
> You need an 'enable-method' string defined too.

The machine has smp ops set so I didn't think this was needed?
I was going to convert it to using enable-method in the cpu node but
the same code is used to enable the secondary cpu in all of the chips
with a second cpu so I didn't think I was really needed.

Thanks,

Daniel
