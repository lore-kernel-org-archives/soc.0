Return-Path: <SRS0=40XK=NN=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9788EC4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:11:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5486B611C8; Sun, 22 Aug 2021 19:11:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23BD961206;
	Sun, 22 Aug 2021 19:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23BD961206
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id e7so14553424pgk.2;
        Sun, 22 Aug 2021 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5WOhtJyCLvDyk28Uv6Zj5si2SYr4yFsA2nofOG2/o1k=;
        b=Wz0kZ27KKW6Mkr0Ljumz+UEeVmlScKBd3SqmrVBy6KUfr0wF7nyeSOKn17vo71LplZ
         oZ2FRQhL3WZekO7gvtgQDi99tK5ZmTJFqu8qfP7zzNuQVSAkx0+fxEkR//gcJ5Dh/X1r
         B6LyfFsNTSZv3XnjF0RInJ0sFom9tDOsnjcaZwD1/sKl7H70ggBXS1n/0xU9jRaJcL/j
         TzoxI0ObF11ea83IhP7yeEfwZAfd5SDKZ9WqS2w53TTFaqZqUJy2I/1aABEg7lw79ejV
         y3nfCNPkOcgLdIoeT6EmOETyueHNf5R7e29BP7/Xkw4L6HzEv4dmvvkMDtpbnv98FR4W
         VJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WOhtJyCLvDyk28Uv6Zj5si2SYr4yFsA2nofOG2/o1k=;
        b=phdjUnI1qw8RrvADgGuv55GuGv9jbz7UkclCBPPIPCWfl5tNWunix7pW6a7depzmBf
         GOB33X428SZUu4cIiYplolTzFjIG5L4yJr19zioVnu8m3oRUjqmAfS5kpx/b/zTBV/G8
         Q89upevaENbZSGIi+J7/prtbkRBkGxyZ/IIdItK8JaBcq5L5Jzc71fBc7wOER1RFD39K
         zj+cG0/Yu74IOqtEdDcbtmwaLBgSO2yhIs5aKSK0qY9x+B7aYcODZRXhGr5B0sXK/m4t
         tUALaudS3isactjT3fZdw9c47do7Hs7dzDPUu3dPOzQ2xDJswDNyWcZP/xqzS5DtaZVR
         ndCg==
X-Gm-Message-State: AOAM532bMZpGy4Or5O/wk+KV9MMNV3VyYeohXk22hew/PudISZGcHZGo
	rt2I0tQXvtMtj0w4T7eB9Jc=
X-Google-Smtp-Source: ABdhPJxYC7o83eBX/pP5vI/s2sm27ag7i588rxJM1xgfgu0UDLC/aq3mqIR7U+jtN3rxmI4KNTSelA==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr28947680pgg.88.1629659470822;
        Sun, 22 Aug 2021 12:11:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u9sm15542103pgp.83.2021.08.22.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:11:10 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Ravnborg <sam@ravnborg.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Sun, 22 Aug 2021 12:11:00 -0700
Message-Id: <20210822191100.3714613-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-6-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com> <20210806204446.2981299-6-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Aug 2021 21:44:36 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> Add bindings for the Meraki MX64/MX65 series.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
