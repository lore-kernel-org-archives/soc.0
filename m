Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCBBC4361B
	for <linux-devicetree@archiver.kernel.org>; Thu, 10 Dec 2020 10:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 087FC23D69
	for <linux-devicetree@archiver.kernel.org>; Thu, 10 Dec 2020 10:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgLJKoS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 10 Dec 2020 05:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388179AbgLJKoK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 Dec 2020 05:44:10 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C15C0613D6
        for <devicetree@vger.kernel.org>; Thu, 10 Dec 2020 02:43:29 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id b9so3268089qtr.2
        for <devicetree@vger.kernel.org>; Thu, 10 Dec 2020 02:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HCXHdtmiujJrojUr10RP4Pb9dzIfVOToeT49LuGH/ks=;
        b=UGZc44LK50KqhqXQsFjm39B+rL98RRFWKa2cAbYIxUjv+cwLVW+6/kPmHLuJqecyGT
         Km5ihpsn9RqSobMcFcxoeYnWXsp+TZdsak67o5aEg5UJloaadciAVB1Az6Km88QiBU6o
         g1D0+qcgHgQL3qXSViLTBj5jHFPcIaVQDiyTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HCXHdtmiujJrojUr10RP4Pb9dzIfVOToeT49LuGH/ks=;
        b=atrvubhR96/HJfyiKHcyz5uojhNGZEZDYYPx/QBUDaOLuHyQmqQFfoIBEslMisrEh8
         ufejmi48hFWcBKqUElFRTYTW7NdE6tni6+gu1imP9cQf29CQJXpzh+zf4Fppi9ZMCi0h
         kghLYEf0ONsrQfjERaLB23UfH0weZNrg1RlXLFlXEV/XhX60b6qKgnVhWfoEFbI4Q1JV
         kDzkKijPHAYeUZg7SYBKWzEXbfsyLx65Py8CJzFDAr4ESXhDQRXlhElPX+FdKsf6ouv0
         sercxudgepUeyWabbKENGJh4sisKNriJPN4WdLmwkt536ciUA1ex1oIwTj3/2HcJlRiP
         fOpg==
X-Gm-Message-State: AOAM533lEHWjOjwEh9lWnbZ0dPQooiVu6xjq2pABkK7wBYjCyE/JFPyo
        mV54vJG0NJDxpl0WP4QnoaQ+BA8JU+KbAugEwacCig==
X-Google-Smtp-Source: ABdhPJy3bPoQAsDQ5caqqcvDV2zL3T+aJ9ttI6e7E0xNhqz+94xh6Lw9p9EWpi/WKJqy3Oa8sA1obBIg2dhDfLw+LY0=
X-Received: by 2002:ac8:590f:: with SMTP id 15mr8286163qty.249.1607597009028;
 Thu, 10 Dec 2020 02:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org> <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
In-Reply-To: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 10 Dec 2020 19:43:18 +0900
Message-ID: <CAFr9PXmqS-CX2zrrKVy4FAF7X6J-CrDBe-NMBNXjf7S5oMo5dw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20201210104318.VqEFViTxBQNyx3JEtE_bH3V7AtVtVzIIW17cOVmfC-M@z>

Hi Arnd,

On Thu, 10 Dec 2020 at 02:45, Arnd Bergmann <arnd@kernel.org> wrote:
> Daniel, please send patches on top of this series to address Rob's
> comments.

Will do. On the enabled method one I had a question for Rob so I'll
wait for a reply to that and then send the fixes.
Sorry about the trouble caused.

Thanks,

Daniel
