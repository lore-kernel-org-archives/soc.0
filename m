Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B781C19F4F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 17:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6D44C2BD11; Wed,  8 May 2024 17:22:39 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B71FFC113CC
	for <soc@kernel.org>; Wed,  8 May 2024 17:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B71FFC113CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e3e18c23f9so37442621fa.3
        for <soc@kernel.org>; Wed, 08 May 2024 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715188956; x=1715793756; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRl/m4RVKZLzWdBeNIFBLk9WHXC7qByJMfaYJzzbNPA=;
        b=Y5eSXGUexLHYZXvekZvv1YL2hBW1ZIsFyXWjJ2DTnXtyC5bLe+BSUt9JS5D7I/F+gq
         OmyzbAQP/lNMNEq0vxzJHukE1Fm2CWl2qHyXrt/FG8V5+k1Z7Hd2rYMG58cC45w782da
         QfeiEV4qxlQ2qZKJ1rDJtIGGiDAoFUKoh8pVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188956; x=1715793756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRl/m4RVKZLzWdBeNIFBLk9WHXC7qByJMfaYJzzbNPA=;
        b=bw7pXB6KEHNeBmKrCV3zVbM/SCxjhHYPLh0j4XFWqeQyGI/Bew4G23KSi7V6MeqJhf
         zLKiecdA8GZNInKmB2VMVjAG9D2QB9tYLjU39UszL5alXyq9AbqFzGa8cQVmBZDK8GRv
         vwCaOEerbqYVddBrt2hF4trnYciPLta8WOinjRlI1bt/7iYN21U3BalXXCmXMrM07J0e
         e7bhsa9exLIy8e6bqL+aQaCqDWwZxiortgkCsK+cmuaCuGYjcsXupNw5tHfg0sdwLslC
         TTocOPgCM68GdiZiFaT1vjW+jpFUhWnLhDSEtOqED4zfShJGKRFQiW7fGVkSJs9mHPP5
         +IAg==
X-Gm-Message-State: AOJu0YwTP5g5d/GZz1bnXj9hA4BSNPQtY4hOtkgPIbpuYc+y2/d3rqL+
	jsDfh1P1AdUC8szUpSYuU2w4lCnuDmJr0K1s/gt81LZe5uN8215OyZWbHN5XewdRabNYxwy8YkM
	w6wNCIw==
X-Google-Smtp-Source: AGHT+IF6eckSynLqNyYG9raG7vQV5ANWYRUeMEhGZHfDnpV6Z3VhAjPSVxKgSzUKHvSebZMW2loh5w==
X-Received: by 2002:a05:651c:1a0d:b0:2d9:f00c:d2d5 with SMTP id 38308e7fff4ca-2e4477b56d4mr24051501fa.46.1715188956677;
        Wed, 08 May 2024 10:22:36 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id z25-20020a2e9b99000000b002e1e76132b4sm2495570lji.133.2024.05.08.10.22.36
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:22:36 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f0f6b613dso5678612e87.1
        for <soc@kernel.org>; Wed, 08 May 2024 10:22:36 -0700 (PDT)
X-Received: by 2002:a05:6512:3709:b0:521:7885:150f with SMTP id
 2adb3069b0e04-5217c566c9bmr1897367e87.28.1715188955736; Wed, 08 May 2024
 10:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
In-Reply-To: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 10:22:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbpyM=Vgb8cM_aoRtZf7GDWq7Wa-cJ=J0DpVkfnd1PBg@mail.gmail.com>
Message-ID: <CAHk-=whbpyM=Vgb8cM_aoRtZf7GDWq7Wa-cJ=J0DpVkfnd1PBg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM SoC fixes for 6.9, part 3
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 23:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> ARM SoC fixes for 6.9, part 3

Hmm. Some of this already came in in "part 2", and your diffstat is
wrong as a result.

You seem to have done the mtk-soc merge again:

> Arnd Bergmann (3):
>       Merge tag 'mtk-soc-fixes-for-v6.9' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into for-next

and this part of the diffstat:

>  drivers/soc/mediatek/Kconfig                  |  1 +
>  drivers/soc/mediatek/mtk-svs.c                |  7 +++++--

doesn't show up for me because I already had it from your
soc-fixes-6.9-2 pull request.

I've pulled this, but am a bit confused about how you missed your own
previous pull..

               Linus
