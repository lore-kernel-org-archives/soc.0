Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2C8C4332F
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D651C433D2; Mon, 12 Dec 2022 18:20:03 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AB24C433EF
	for <soc@kernel.org>; Mon, 12 Dec 2022 18:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AB24C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-qt1-f172.google.com with SMTP id z12so6746110qtv.5
        for <soc@kernel.org>; Mon, 12 Dec 2022 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=onP/KvRHakbT+PgkNr+XHNC9YqsG/EczL6JiFabOL0U=;
        b=JNuH2HF8bPkdPJns9Frb/3hAu3RMH8AcPZSEHf2cYAzl573JYWDHKuLTUN6kTk/bk2
         28tJ7PF1hgzIxkq2dZd60fbM0WqtEb/LZVKdYBwuPk+G9ixslL/tLfsqY4afPuSGZ2uB
         j9r6MScd1LukX820XYEHD2XbCUUdgvxVKO5PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onP/KvRHakbT+PgkNr+XHNC9YqsG/EczL6JiFabOL0U=;
        b=N1TpnnxbJ4n0oyMHXjnSz9rloqw8mg8XMxiD79Z2VcqUZY1SlaItz+dgfZwDktueBY
         RU6UIgaWcoU4ElHqMlftkL6cZ7f+YhQK9NOxHJ8HFMJ6b45oLqheOuGJOnrrbEenBb09
         YJ4MJHRhqo0kLWcTK4E+3IWVGyWzITaW2LiAd6zTxgSp5jVyosHfZltHaYJE6IrO7o3+
         gnwkDkRjBGoWypnhUaGBMSvFn9Q02Rh3bYNJ7Z519cGpkA1nDHHCfGLiM6GKahMjvCLW
         58giD0YigZ4plN+i5GTl5QmJBmPnvtOaSufDAone+AYPDp+wnQyTtotbhY4222V7K9vA
         csjA==
X-Gm-Message-State: ANoB5pm3soK4rHsY+rc3yQ/1oOYx05krMANTG1gxWAMXx8C8FgB8bpiy
	rbeIUIJxGeKtnanqoGPSTU8KV5YtGsAcX1SL
X-Google-Smtp-Source: AA0mqf7j5fsZms0nTRCJ223DRuWrIYkbIOuq0V0Kw9pXKAmXxmj7W2FqBsWK3wFBp4ozm1sd7CWMYA==
X-Received: by 2002:a05:622a:4c13:b0:3a6:348c:5159 with SMTP id ey19-20020a05622a4c1300b003a6348c5159mr24146483qtb.26.1670869200277;
        Mon, 12 Dec 2022 10:20:00 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id b2-20020ac85402000000b003431446588fsm6244565qtq.5.2022.12.12.10.19.59
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 10:19:59 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id u10so8773085qvp.4
        for <soc@kernel.org>; Mon, 12 Dec 2022 10:19:59 -0800 (PST)
X-Received: by 2002:a05:6214:390c:b0:4c7:7282:5817 with SMTP id
 nh12-20020a056214390c00b004c772825817mr14226201qvb.94.1670869199034; Mon, 12
 Dec 2022 10:19:59 -0800 (PST)
MIME-Version: 1.0
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <07ecf411-70a8-4c15-b3ba-378072c14a02@app.fastmail.com>
In-Reply-To: <07ecf411-70a8-4c15-b3ba-378072c14a02@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Dec 2022 10:19:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg6u5hV6+O=C-UYkHZATN1b0kQYmoNaJ-EL8eQVBHQRjA@mail.gmail.com>
Message-ID: <CAHk-=wg6u5hV6+O=C-UYkHZATN1b0kQYmoNaJ-EL8eQVBHQRjA@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] SoC driver updates for 6.2
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 9, 2022 at 9:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>                            While this remains
> Arm centric for the most part, the branch now also contains updates to
> risc-v and loongarch specific code in drivers/soc/.

Yeah, I'll continue to call your series "ARM SoC updates" for now,
even if they technically do contain some other architecture updates
too.

Maybe some day the other parts end up being noticeable enough that
I'll follow your lead and just call it "SoC".

              Linus
