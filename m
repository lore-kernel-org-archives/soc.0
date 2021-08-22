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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E58C4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:07:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 755D361354; Sun, 22 Aug 2021 19:07:00 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD396126A;
	Sun, 22 Aug 2021 19:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CD396126A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id e7so14547142pgk.2;
        Sun, 22 Aug 2021 12:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QChRC5bsvV5GsGHtGsawsuaXm1RQ/2QbEQSA8oSl42s=;
        b=X7x1jGQ6jvPK5Ng6oNKbipRs+whc4v/ZBhTbx/hriXIHDKB+xOQ4xbLPAgFiFFp4q+
         5C6MUCmF/Ncg2S5j3TqDLO5Fa932Tx7097vE5q7QVAY8F4JHbFpItZzFFrsLdngit0gi
         oUIM/ZnA2J+AQhY85BjOofHjqLq4i9wJnvJxduNGNE+G7LNIZGiUywrT14V0cF9Juk6x
         keXb1B3FOnx1H3VAU0aq5EccZAkkebLqC+1uEZlDWTiy3w7bOxAH+heZrnzGQyWH2p3g
         2ZQzZpuYzVSRZzE0D2HExmpMvR9PxpFmuJErLapOShFXakB9Yh3L17wNIn1RGlRQR2vO
         w4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QChRC5bsvV5GsGHtGsawsuaXm1RQ/2QbEQSA8oSl42s=;
        b=fgKCHazusPIPmR0bzLbB7YU6qQxpjYLC4mFr23Qr0w0XV3j1RyrRDjAMbwhdSXiG6e
         zimAoZ69JEI/is9kg3MtJltUesJzSJF0XL4assxPSTQtZCHB7iOvtKA/CNpvFZFG20B4
         1O7hgANwoVSL+DC8o12+nkMLLt3sQJCYE/OXO8WsI+yYWJ5vOXIZIpmKLHhAXyV3gHoa
         1/Po622cQuKmXnvXSKHOe9rby0tMFM32F8RT5mhmFXkN4DKHK6BRYrZPJFa69c/ebC+X
         E60tIaXxA8juQA5xYuAFxU0a95s2Us7EE1c8rbDutaYTHuLm+L9vaC7bMaz9Gaj1tsEy
         gMBQ==
X-Gm-Message-State: AOAM53348HH4BeqfgNQSkXUO6TlZ9g7hRvImGA6uRhyJBIxvf0MxUslM
	bboeKoQtgw817ynlUd/Ua6k=
X-Google-Smtp-Source: ABdhPJyYv9kHBYTe3Pqh1Lt1N0bT8OWr/15WQznm6TVO/nUMDch7ktyIiIRuPMQHNk4Ghq7FqLWqEQ==
X-Received: by 2002:aa7:888b:0:b0:3e1:6855:a01f with SMTP id z11-20020aa7888b000000b003e16855a01fmr30210507pfe.75.1629659219785;
        Sun, 22 Aug 2021 12:06:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l8sm16915842pjy.42.2021.08.22.12.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:06:59 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Sun, 22 Aug 2021 12:06:49 -0700
Message-Id: <20210822190649.3713909-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-2-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com> <20210806204446.2981299-2-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Aug 2021 21:44:32 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> These bindings are required for all Meraki MX64/MX65 devices. These
> common bindings include memory (2GB), PWM LEDs, AMAC, I2C (AT24), NAND
> partitions, EHCI, OHCI and pinctrl.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian
