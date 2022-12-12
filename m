Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231D3C4332F
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1E3BC433EF; Mon, 12 Dec 2022 18:26:59 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE4A2C433D2
	for <soc@kernel.org>; Mon, 12 Dec 2022 18:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE4A2C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-vs1-f49.google.com with SMTP id q128so12114012vsa.13
        for <soc@kernel.org>; Mon, 12 Dec 2022 10:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xEeQjfOgxbzzuaCvVlasz+hixVSsIOY5Hq7uOvYrjTw=;
        b=G/lMCGnwSgD2+sFVg10enKajkr8vBOrkI8HGGYzC+7tFr+yNjLAXYB+AROvSybglDN
         L2S66nnGmj59HcxJFOg5xBV5CTxSOE76KQUQkMiaajTd6cAZRHZ0c0oqz59kck42LTCT
         obxUBb4la276ogjOC/Vg6+xoJSO2uChD5M/mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEeQjfOgxbzzuaCvVlasz+hixVSsIOY5Hq7uOvYrjTw=;
        b=cyVw3ahxgvIae7t1DKmIFVBjPjA+Uqy6bt4KHyWiIJqDOL13zrkwcf7n4fS4DU0d80
         Z2QM+Iwwe/RVtI8E+xwq32HyI+d6mo8HBlmidoOYwHtDCx+JrPZwDo30u3GolIDTz2jm
         wIsL3lPnGzjVNX6YQKdCh1dvPQyTUQ015PReYgPgFt2Q7eby6SyxdSkW9Ve6yW/Mg3RL
         AIQ7xiRlOyxNm1qEIC4f204Y3TRwUeGueH+hUcCbAKBMTyVbaiYHDYz3PR5DWf+o+NZi
         8wCTkipuwt+ozmTtDYO6KJrPm14hLMeVPRDSRbWaNQBu29R1ESRgE5jhaGjMx6TJk7OX
         T3bQ==
X-Gm-Message-State: ANoB5pk/SbOcO6IiLOBiJSQxJpQHjw++Uu14oY8dfKQKXgLUAE0gw8uc
	U3zmr3dGmXi8HiWLi+myhlUCvaKLiadix2ns
X-Google-Smtp-Source: AA0mqf7Vkeplshrrgs5SGUmgkkpJ7GgDO8ZZeUh2BvjCI3l/h4lIz3eJlReo30S0JAzN9mvt0eu9yw==
X-Received: by 2002:a67:c984:0:b0:3b0:a5ce:71c5 with SMTP id y4-20020a67c984000000b003b0a5ce71c5mr7792496vsk.3.1670869617154;
        Mon, 12 Dec 2022 10:26:57 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id t30-20020a37ea1e000000b006eef13ef4c8sm6206049qkj.94.2022.12.12.10.26.56
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 10:26:56 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id c7so2179515qtw.8
        for <soc@kernel.org>; Mon, 12 Dec 2022 10:26:56 -0800 (PST)
X-Received: by 2002:a05:622a:5a87:b0:3a5:47de:a214 with SMTP id
 fz7-20020a05622a5a8700b003a547dea214mr70877944qtb.304.1670869616205; Mon, 12
 Dec 2022 10:26:56 -0800 (PST)
MIME-Version: 1.0
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <02be69ef-cfae-4455-a428-f95517d374cb@app.fastmail.com>
In-Reply-To: <02be69ef-cfae-4455-a428-f95517d374cb@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Dec 2022 10:26:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgy2kMzPGturhFGethpnzWBX8Guzna98tSOorNpM0ZEEQ@mail.gmail.com>
Message-ID: <CAHk-=wgy2kMzPGturhFGethpnzWBX8Guzna98tSOorNpM0ZEEQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] SoC: DT changes for 6.2
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 9, 2022 at 9:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>  - The Apple T6000 (M1 Pro), T6001 (M1 Max) and T6002 (M2 Ultra)
>    chips now have initial support.

That T6002 is M1 Ultra, not M2 Ultra.

                Linus
