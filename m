Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AF0C4361B
	for <linux-devicetree@archiver.kernel.org>; Thu, 10 Dec 2020 10:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2603223D4D
	for <linux-devicetree@archiver.kernel.org>; Thu, 10 Dec 2020 10:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgLJKdw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 10 Dec 2020 05:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgLJKdw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 Dec 2020 05:33:52 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2F4C0613CF
        for <devicetree@vger.kernel.org>; Thu, 10 Dec 2020 02:33:12 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id q7so2108961qvt.12
        for <devicetree@vger.kernel.org>; Thu, 10 Dec 2020 02:33:12 -0800 (PST)
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
        b=pUCwAulArS4QTElrHLuGJXNO9U4Mwpc4YlteI71Bg/jR9qyLK9XnjBC5moshU4pqAe
         0l81i3P/sBk11enQtbwmSaypOlerTs3OHYUvPTlUZfYMUN8GSolBQhT7DXaJK6dPRDe0
         5kpl7UwmS3DNYdJt6/3yVC4GeUFOAvPXDhOpAosiD27wyVSGpYFSevbpm9/NFscZ2uG3
         r/hrtXwaAhDmKey5IlJuKwbRo5ASWhtY/Q0gHC3MFkTt2VmJH2aGPnAm0jA6d/y9tCI7
         7Oe/lSMXNN6NBx88F9zk2WJeL/UVAveqkDycgvIDZpFaOGaE3uPS6mG3k56tKKUJ875W
         81WQ==
X-Gm-Message-State: AOAM5314po1PZ8L0S1Po0T6kjTbXZmlYBvnIxwLGW6mumjg98vpqO/l/
        MWeSBtrvhfw/+wAUO0Hx3/q3r3zfZxjbV6RBkFRuFg==
X-Google-Smtp-Source: ABdhPJzZGRjhEeNNEDGAWAw+JmsON7yXLlAyf0iR1s+9MtHGwvfratcRgIz5ZM01Ii2KY29VX/Ss2pqrNPcIr18iTC0=
X-Received: by 2002:a05:6214:140d:: with SMTP id n13mr4614903qvx.45.1607596391428;
 Thu, 10 Dec 2020 02:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
In-Reply-To: <20201209163536.GB566058@robh.at.kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 10 Dec 2020 19:33:00 +0900
Message-ID: <CAFr9PXmuCJJ0LXTcH56Dv_ddePaqLtVFVgeJdv7hVN7yRRyj-Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        olof@lixom.net, Arnd Bergmann <arnd@arndb.de>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20201210103300.q3p3VESn1UNKkj-4LEk5jFOo2ziEf9R5yiPnkzRSNwY@z>

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
