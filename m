Return-Path: <SRS0=em+u=T2=chromium.org=swboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EADC433F5
	for <soc@archiver.kernel.org>; Tue, 15 Mar 2022 23:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC0DAC340F3; Tue, 15 Mar 2022 23:44:29 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D698C340ED
	for <soc@kernel.org>; Tue, 15 Mar 2022 23:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D698C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f171.google.com with SMTP id ay7so951279oib.8
        for <soc@kernel.org>; Tue, 15 Mar 2022 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Nl6Jm5jwM/rVHzRNNh97f8PcjadQYjuZsAfdQpOQyA0=;
        b=LxYOO0RPSWJ4K6iwzOJRwfNMombgLBlr4vAwpGEOYkw2dzq1693vjR1qRS2XBJSKkt
         deml4CTSqowDWH2shKvpncOJLWwxHJRyNaiM5u4IJ6I563znsvqL6DE18GXoyst5m9GK
         8GAger7v6dWSFEZbx5zEg6NRCTe0yHq7Bm0cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Nl6Jm5jwM/rVHzRNNh97f8PcjadQYjuZsAfdQpOQyA0=;
        b=SPXt918TSBxIcDO5w7VD8z/OHH+xXdR+osW+5y7x93psxMXyLM+AfAfguOZb10MQQc
         gLA/IuzPOJ9SPjlpjhuRCfpU+WhUJFgiaqbW8XjizPwJk0Dk2KVsnIA2maIpX42NHo7V
         DOjyUM9IcXuCrfHZmv92U0Nfrr9/ye+gcrkMRD8eu/31nEd6i5bDsQwSzgECGmg/97Aw
         d33T49mPr7Ia12namvxihsUqwKbYEwLvqtPkyvontp5pZtDwS3ReaTNp/WOSyEC7JADq
         SLAN+nnQWZdHCELLzo9ylZNH/Lf8xHuY9YXHDcKk1rb8pKd/N+Udy/6dkmN5s62v/duc
         jQRg==
X-Gm-Message-State: AOAM530diHoYs8k/jaBLueE0UpFE6oUJo96W2wAxeGAXA67687HVmpph
	Dtm/Mml2qTGSxGVNv1QJTPt4H24yeJGSYZvJemDsCw==
X-Google-Smtp-Source: ABdhPJwATAVHk6WtwRZmZrxjAV5ap1yBhOFyk+oiJLjCOS2Plq9sWvEpEoc/wJjnOQ7el0ZklA7Lp4p8ATvjU2eiYgA=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2652734oie.193.1647387868162; Tue, 15
 Mar 2022 16:44:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Mar 2022 16:44:27 -0700
MIME-Version: 1.0
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Mar 2022 16:44:27 -0700
Message-ID: <CAE-0n50tDVmQnruVy5cvseQrH9dWjHWr7qAoLwDnAL=oS9AEzw@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] Clock and PCIe support for Airoha EN7523 SoC
List-Id: <soc.lore.kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, soc@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Quoting Felix Fietkau (2022-03-14 01:44:02)
> This patchset adds the remaining patches needed from the last Airoha EN7523
> SoC support series

Please add a changelog here, preferably with lore links to previous
revisions. It helps folks recall the patch series.
