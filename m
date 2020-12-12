Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B3C4167B
	for <linux-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA69D23770
	for <linux-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436511AbgLLCu2 (ORCPT
        <rfc822;linux-kernel@archiver.kernel.org>);
        Fri, 11 Dec 2020 21:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437713AbgLLCtd (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 11 Dec 2020 21:49:33 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC10DC0613D3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Dec 2020 18:48:53 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id az16so3103175qvb.5
        for <linux-kernel@vger.kernel.org>; Fri, 11 Dec 2020 18:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
        b=lOcZzWTS5jP44Aj5WSnu7Epwi9SIeLpdqG0g7vfXGzHB22bQkXbMPXEOWMrckkpM/q
         8/dGI+MZP9fHvUF4GA8nH3L32jW3q7WD36klvhRf13cEcqlfcQyEM9ypCA+KOXPrrvMA
         uosYL5WdTCiNn5dnUL0xOD6VgodW8s5Ow3BCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
        b=J8xYqv2j4SiBaQluWe7UxfO5so/udRQRdFN/LqQhZUcwzdDpxOiierHRuWjrNJ5bBq
         GM25IoMSWJYUn64k9LC8h6EfqgiigAECrAHcIICcvtBq9humvMHkv7eRURDuBYEN108g
         KkKopZHhi6vOQeRE+GC5nwHYwVG5IRtSu4GZVI6D175ZzbpbdLDh75asd5ynA5hBUZhL
         YOgE7GO8FRq53Vrmq3Qxp3+smnk7s0/9cglcwfaf1XEaublspRXrtx9i+fwD7OHHm0+T
         R/45UpiYxKzorc8rmFu9MSOcMJE4dsaTxt2a8X3h7aeHnaHvxd2iO1MDPhKOCZMy2GwG
         3t1Q==
X-Gm-Message-State: AOAM533Yk/gG7XYBF9STPalDjeYf3eTCWj7gCLasJYAdc10Hf56Mixgk
        Q0jOYpRHDGwtuQAUEv9mcPdM81NUZgjZnkU52BqU4g==
X-Google-Smtp-Source: ABdhPJwggpEKL14wC5+OproRa+ET7RUsSVcrTd8K7mQPC5vj9AIEfNRFdDaAkFcYA2Eg9tmZEAPR5tj7FGZTJZqZwuM=
X-Received: by 2002:ad4:43ea:: with SMTP id f10mr19617485qvu.52.1607741332882;
 Fri, 11 Dec 2020 18:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201212024643.388335-1-daniel@0x0f.com>
In-Reply-To: <20201212024643.388335-1-daniel@0x0f.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 12 Dec 2020 11:48:42 +0900
Message-ID: <CAFr9PXkz_3VNtQothDPdfhpYBOz_kHqykjftUn7no9yWzVrEnw@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: mstar: Unify common parts of BreadBee boards
 into a dtsi
List-Id: <soc.lore.kernel.org>
To:     SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20201212024842.ucmNY0TJwNoRnVHHTs-lRsLGXGM3EKv527dexB7Hm1o@z>

Hi all,

>[PATCH 1/7]

Sorry, this isn't actually a 1/7 it's 1/1. I forgot to fix the subject
before sending.

Thanks,

Daniel
