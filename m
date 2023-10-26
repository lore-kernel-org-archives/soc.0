Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C8CC25B48
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 17:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E9C9C433C7; Thu, 26 Oct 2023 17:41:30 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B491C433C8
	for <soc@kernel.org>; Thu, 26 Oct 2023 17:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B491C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso187977466b.2
        for <soc@kernel.org>; Thu, 26 Oct 2023 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698342087; x=1698946887; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ITpuqAIYuX9E93fc5T+jENg/qhVTutVfi31bFRSkPpE=;
        b=aX3Vf2cjOqDHt12gaP1oeWc/r4tLBnfaDhlMwwEVFhrLLv+q7Y8MyVvtPbDr0vVASa
         eZ6/UO7v7kq0w7qnlLFf172THmyMptCNtCUvMzgfFqUPRUd9v9MtgSU4RYzYemII6CWQ
         yMa0z903Ui15B3uMDxh0Y5NTtcsNevTMeukto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698342087; x=1698946887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITpuqAIYuX9E93fc5T+jENg/qhVTutVfi31bFRSkPpE=;
        b=dng5ppckN0m6hoU97NX42++kY7Kn2SHkMwn9D5sdiZ8rmZ1IHhy6+eVwVftveoatKm
         YZI6bM7OEh1qQD7riF4x24JE68WrsReL5FgY9wnhjm9/f2KSB5Raysh4g5ep4qRrTYTN
         PfYZ+ZT/lTbh+Xegqyush8FVuLwl4uKcer0eAJR0WhOxsviHEEnS62CtAjeKuEwyYBXS
         5P3KI87wsQ6t2he5zEclGpG6OGMUStRunD0umQF+JK/OUlyLgVWkCdHxGG+H4UuNhCjl
         l2MvVlRE6T33u8eNXyAa/vPtggrotJgzcfsQBYzTW/3JelehkbOU+xWbCENXju9l6MHc
         AF5g==
X-Gm-Message-State: AOJu0YzYsH3he9btLbXbcFFGKBLDmqmWEcKiDgIxfC+TYR9gOozV6+0A
	2zQoyRthCy7lNDn6zF3cILO6y1WEwMjxvoHNIfubkcZe
X-Google-Smtp-Source: AGHT+IERKxwSNJb8SDKM3Xt7YiMsOIqoak2oeSpxorWMIERYBvz1RXTKWsmlX+pTfzjlmKWl7IbHNQ==
X-Received: by 2002:a17:907:9707:b0:9b2:b9ad:ddd1 with SMTP id jg7-20020a170907970700b009b2b9adddd1mr262947ejc.28.1698342087093;
        Thu, 26 Oct 2023 10:41:27 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906529900b009b947aacb4bsm12093129ejm.191.2023.10.26.10.41.26
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 10:41:26 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso1893278a12.1
        for <soc@kernel.org>; Thu, 26 Oct 2023 10:41:26 -0700 (PDT)
X-Received: by 2002:a05:6402:206c:b0:53e:ba3d:acb9 with SMTP id
 bd12-20020a056402206c00b0053eba3dacb9mr382618edb.24.1698342085802; Thu, 26
 Oct 2023 10:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
In-Reply-To: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Oct 2023 07:41:07 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjjY4h1TFir3V3DWSboF4=7buYezo-ZiTvQmMDeAK+30g@mail.gmail.com>
Message-ID: <CAHk-=wjjY4h1TFir3V3DWSboF4=7buYezo-ZiTvQmMDeAK+30g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.7, part 3
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Oct 2023 at 05:23, Arnd Bergmann <arnd@arndb.de> wrote:
>
> ARM: SoC fixes for 6.7, part 3
>
> A couple of platforms have some last-minute fixes for 6.7 [...]

The "last-minute" makes me thinkyou mean 6.6?

The 6.7 merge window hasn't quite opened yet.

                Linus
