Return-Path: <SRS0=WedL=ME=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1727BC07E99
	for <soc@archiver.kernel.org>; Mon, 12 Jul 2021 20:11:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF2EE60FF0; Mon, 12 Jul 2021 20:11:51 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F5F611F1;
	Mon, 12 Jul 2021 20:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F5F611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f51.google.com with SMTP id d9so24218476ioo.2;
        Mon, 12 Jul 2021 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OxPIiCu8t6BRcFmXlg/qwdKH0Oy9r4vjSImMHgxaBOg=;
        b=WVd/SkbpidapBP71wpHMjT8EOyGKuF6nBIz6KEqYE/o8J3VW2mY5oMfvcxLOtYBe6w
         b4zReDKNTbeYsLlPqE6yV+I8VcxZZFO8vQoc6lmRpEHDpXId7FoH1NR5tUScOI4xPb4d
         VSja06GhLuOrPSjRqk5stU8e1pzQtHl9NPCyfSR6rPCUzxXHimbymkDsis45GYkSYem9
         Qs+Up6BNG+bY8u5o0AXkibxyCpBHQ2ZTytcNCT3v3ipyF/Ab5A2lsgbZ/5+OESzcwYNN
         xCb4W4pBWEem8jUtvEIkXjEvS1bY73ASP8YOakf9DUWuoQD7Dh0933rCHoNqh5GKKggA
         BzqQ==
X-Gm-Message-State: AOAM533MAE6P1VU07+Piq0u8QRSNcBKJmCTa0GZNoRk6vEQH4kleSGH0
	ZIvMFVuGu4FFiQbrSxGXaQ==
X-Google-Smtp-Source: ABdhPJzW6AFfFMICizJP5QMZjYZ9nJPabK3GBmxZyX2c4V5/uCYFdnz9UEb+6IfxFpZC/aQOCQm8sQ==
X-Received: by 2002:a02:ca41:: with SMTP id i1mr657291jal.70.1626120711261;
        Mon, 12 Jul 2021 13:11:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b25sm8792990ios.36.2021.07.12.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:11:50 -0700 (PDT)
Received: (nullmailer pid 2408523 invoked by uid 1000);
	Mon, 12 Jul 2021 20:11:49 -0000
Date: Mon, 12 Jul 2021 14:11:49 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, soc@kernel.org, olof@lixom.net, devicetree@vger.kernel.org, ulli.kroll@googlemail.com, linus.walleij@linaro.org
Subject: Re: [PATCH v2 3/5] dt-bindings: add vendor prefix for ssi
Message-ID: <20210712201149.GA2408465@robh.at.kernel.org>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618205533.1527384-4-clabbe@baylibre.com>

On Fri, 18 Jun 2021 20:55:31 +0000, Corentin Labbe wrote:
> Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
