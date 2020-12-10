Return-Path: <SRS0=Y1pW=FO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B001AC4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 10:43:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A8FF23D6A; Thu, 10 Dec 2020 10:43:30 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223F223D99
	for <soc@kernel.org>; Thu, 10 Dec 2020 10:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223F223D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qt1-f193.google.com with SMTP id z20so3270507qtq.3
        for <soc@kernel.org>; Thu, 10 Dec 2020 02:43:29 -0800 (PST)
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
        b=QPeyxdb+RQdKSf0SqzR7YYEyYCFQM4SN60nhtikdqV+Djwh+gJZoCdUP/Dph82UfNi
         3y+++sKq3alRUqLEaS0O+ZGj3vidkc4SxjgvSwXCBUKJY0NPBXgpx7WM9y1Tp3Z16qDp
         1JZJLGVpqVPEF6hfcp4Mqm8WhRSzoUBL2fcRquCqnKyxic06+lQt20anGPOqrOQcLWJ+
         JBX4BZAmBMQiVyS2t7x6Evq2urjAd1ZsxSiU69HzSvuFJKZQsUzUBVqDrL3ftcLXrBik
         IOi0pm69nvzEadZMjpJoAX9L2IbEt36Z6vV3w4qpB3KOVjN07R3rX/4EScbTQF5Vo8KX
         WtiQ==
X-Gm-Message-State: AOAM533M/FYcz09U8Bk13o4n9Thb6+RwdvSXYt4uxVPgmkzsdnDXbbC2
	tWdeCu+nq1SdQEcsTcE7X6RU/svloiG6pNueYroEag==
X-Google-Smtp-Source: ABdhPJy3bPoQAsDQ5caqqcvDV2zL3T+aJ9ttI6e7E0xNhqz+94xh6Lw9p9EWpi/WKJqy3Oa8sA1obBIg2dhDfLw+LY0=
X-Received: by 2002:ac8:590f:: with SMTP id 15mr8286163qty.249.1607597009028;
 Thu, 10 Dec 2020 02:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org> <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
In-Reply-To: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:43:18 +0900
Message-ID: <CAFr9PXmqS-CX2zrrKVy4FAF7X6J-CrDBe-NMBNXjf7S5oMo5dw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, 
	Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 10 Dec 2020 at 02:45, Arnd Bergmann <arnd@kernel.org> wrote:
> Daniel, please send patches on top of this series to address Rob's
> comments.

Will do. On the enabled method one I had a question for Rob so I'll
wait for a reply to that and then send the fixes.
Sorry about the trouble caused.

Thanks,

Daniel
