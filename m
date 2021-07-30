Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E82C4338F
	for <linux-devicetree@archiver.kernel.org>; Fri, 30 Jul 2021 14:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D12A60FE7
	for <linux-devicetree@archiver.kernel.org>; Fri, 30 Jul 2021 14:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239095AbhG3OpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 30 Jul 2021 10:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238893AbhG3OpW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Jul 2021 10:45:22 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C116FC061765
        for <devicetree@vger.kernel.org>; Fri, 30 Jul 2021 07:45:16 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id t66so9688839qkb.0
        for <devicetree@vger.kernel.org>; Fri, 30 Jul 2021 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
        b=MZMNdU90T1mdr8f+FlrQaQK/8xRSpuWb+VLJYY04eQAnQjNSfuvvE2QrwqSops4AMK
         YoYRYQLiThc0bxkrK9iOOdLLSyRaxse1aXajornOiRMRdWKS5p4sY2rCHlwWqgP+HZyz
         zkt6k0YfRmN5zyErzIxLsFY5wJEXsdX68OBlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
        b=QRUFq9tRIzEMZx+fpn6JH/+3RIh8X7Td8GGcZQftywVMWHQ9T3WFYWcUQtHN7AP9KF
         1SNSJuGVUz7Qclg2icVUhtUa6aCWqPSm7DtRfuDibref9eRAfMRQPLb/uuhscj5Ve6jn
         CtHwTUqzlpDJKPjhEEVPtuM3G7A7LSDt4oDX83MBbgaGwHPtQbvd6/Ix7v1thyYkGpES
         4fqse11K7RZ/KyX3Rno4/V8pNIakkJL7oh0Om8vrzI0MbMcIVN9l7bZasbjtDX4KITVu
         75ITNjuSBxsaM00cG7Vi9Xah7ZMkHXpHRwnDbGRLNPOsDxsDXrl5lJE1ZrAss3f/MfET
         7hpg==
X-Gm-Message-State: AOAM532VU8zOCfRN81upxiKD/ghG4uvsWJGw6MbvqxiK38vMmH5/TmeR
        Eqh9nS1eDOielnQECrJQIDdJjB3t3W6CpsFVfPvVwg==
X-Google-Smtp-Source: ABdhPJyz3l2sQZ+SSXfddd6sETZFkOS5YZXDtdPgdR5B3eaKCu+XhEgm3upVc9TljLMB6v7V3xiiVDe05DNMJPnsckQ=
X-Received: by 2002:a05:620a:1242:: with SMTP id a2mr2651740qkl.443.1627656315951;
 Fri, 30 Jul 2021 07:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com> <20210730134552.853350-4-bert@biot.com>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 30 Jul 2021 23:45:05 +0900
Message-ID: <CAFr9PXkHfncDq=XybcTu-W=Q0ieFRSP5vvSk1nNz2F3jfoS50A@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To:     Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210730144505.7ZRfeKzQUcwzsdUvLe39fcnFPClvUPaL-HfbWewOxEo@z>

Hi Bert,

On Fri, 30 Jul 2021 at 22:53, Bert Vermeulen <bert@biot.com> wrote:
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +                       clock-frequency = <80000000>;
> +                       next-level-cache = <&L2_0>;
> +
> +               };

Super nit but looks like an empty line snuck in here.

Cheers,

Daniel
