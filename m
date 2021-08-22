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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E9EC4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:07:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7C9D6126A; Sun, 22 Aug 2021 19:07:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2BA61250;
	Sun, 22 Aug 2021 19:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD2BA61250
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so4403442pjx.5;
        Sun, 22 Aug 2021 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxXXhh0DEqjiPk1bf4TGcus3ngVBbA5mFl/MCDhfwBQ=;
        b=MLptEgfw0gVbD2H1/ibOdWn1rw3SMv+6nXCsV+5RBRBP2zY/bq2myNmj+tNlYHZK4n
         Cu2Yk8jFsHhhZFaYzuTf4yuq/Lj3lNiIiDPCRTr/hS/FhsTLtRQPFrfP512rkeqmpIJJ
         WrJ+1l2/43sZei+NGQtCnkLh2sEQe2tGdfOILUy3A1/f0tZBv6go1Fmbx/l38VyuIFoy
         ygYfJaVI68vmPzPfG1GxNw+88nmTIiIBU+dakSy6PqipHMi+cgEsswbuPl2CklJV6w4M
         COcG9RN6jlI4I0iw5FXFu4Wcg7oBKKF4S8nRyRjvkUQ0NY+DxJf/eJsRqjqALD+Ry1Di
         6nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxXXhh0DEqjiPk1bf4TGcus3ngVBbA5mFl/MCDhfwBQ=;
        b=CgFTWNg7osBnzk5jchr3JChuLI8cJ3WD0uALu+8FYcOKop6JDgfHhc2E8+G7jMCwaH
         TZGpX2TT1zL4Ftzp4Q7pQV0H3JFkmO18tqq9PRQfDNncBvP7YCvZKwKDvzO2rZl70eCb
         jEaZcEPhniOgRgVzIDcFA9QqyIkUoh8tn5uEMHLrtlH0tYak2lbLwfY5G73dMKJ8kGpX
         PuixV4iksuJK1FjPEWOCqKFZmnVir45qYLyD5h6V2bV4iR1gb63VkIG9JbmE7BbqWEzm
         rFwt6dxED7VfhntiO20p/k1F4/N5h4QU+iHDF6qC92ZTDXZCPhEjFy+mgsDy4i3B+nGw
         r7Iw==
X-Gm-Message-State: AOAM533Y8C0SuG8U+BHWYhOSJjG//Ysl9MmoniSO1TKI/JhspE6AiyCO
	ojY+pX755rkvBnVm3Giwtdk=
X-Google-Smtp-Source: ABdhPJwVjTddJ7AzPTybQWZeiR2U0S6mCXyGLOYG0JqbA7fWLv9Nco4FHAB1gSqfjAeO0hPkCXE2Rw==
X-Received: by 2002:a17:902:ce8e:b0:12d:ab00:2518 with SMTP id f14-20020a170902ce8e00b0012dab002518mr25396743plg.58.1629659241414;
        Sun, 22 Aug 2021 12:07:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b20sm12962871pfl.9.2021.08.22.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:07:20 -0700 (PDT)
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] ARM: dts: NSP: Add Ax stepping modifications
Date: Sun, 22 Aug 2021 12:07:11 -0700
Message-Id: <20210822190711.3714024-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-3-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com> <20210806204446.2981299-3-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Aug 2021 21:44:33 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> While uncommon, some Ax NSP SoCs exist in the wild. This stepping
> requires a modified secondary CPU boot-reg and removal of DMA coherency
> properties. Without these modifications, the secondary CPU will be
> inactive and many peripherals will exhibit undefined behaviour.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian
