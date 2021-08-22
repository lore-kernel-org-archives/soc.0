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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A15BC4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:07:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F37C6128A; Sun, 22 Aug 2021 19:07:45 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1584C61250;
	Sun, 22 Aug 2021 19:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1584C61250
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id n5so10533180pjt.4;
        Sun, 22 Aug 2021 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=feHXKMgHM6nYe6wa8RO2hvQpcDXnS++8l8lp6sQROGc=;
        b=Xl98lYIggRtOCv1ckeczoKeUIxykxz/JHPJoBZagg1FuCw0CwY4t+xMfhLDijyK9/r
         V1q6xQ8vKMMLT+msfufsXQlLRuJrH3zP4evso6GfY4iM5iOl//A0uYD0iB1qvXvxiMUR
         t4rhgYLqymNG+xmk35xwynK1IJ0Tb56+Cx7sWuRT6ZejjlRYMutK7m5EIOdTzhiq3jBJ
         lIJhIb1gol5OOYlvybhGhwXQIP0ScYi3r0sXpSTb+wucLTjJzNcH4PvR/ueuDwwF0N28
         wbNdMxwRQLVqDVyi7WdZ0G/TSNzbbzdNqBCDNpPKyO4sphWn+s0DssG46QRZA9BMMCw0
         MYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=feHXKMgHM6nYe6wa8RO2hvQpcDXnS++8l8lp6sQROGc=;
        b=hdJcLFqhwuZN1J7/3GaAZ+NNqaUjRV3D7Pjdt1a1nYzbY4H7ZLoEZtic41m2xXT/60
         AM5j3quV4IHaG/a18ivR536wydcMWirCsHG2jrI7qlGd0xY14Madxdb2vxLwAHo9fAFY
         3MMSl3kGqQCMGHJV0jJdnaUAOvZMXVHbGN9dfYyphXAFa463EbLlPNfkF4xG/lUfEGE5
         nDDHrgPhMqaqNC0xmgPbZQ75oSU8wdyzcUt/ER0JDk7L+8062x9/eUlc7XgX6RM9I0OH
         UgF8mUgKrZFcCuUBeqdgdUezrSltUnTwMGHQLmSGdTG/yeC/3USgeNOIj8ZXpj54Inuy
         s54A==
X-Gm-Message-State: AOAM532i0CPAKA5CnPKnIT9Hf5OwbuIhj4OD47jtstSbcHqXqypk/sl9
	K1kJ7Ry9EB2RoxMHLTDZtJg=
X-Google-Smtp-Source: ABdhPJz65Y2dES7lBGoxVxSz5Wx2FGiSa75pqG5UphJ1tSbo7IL/TeuCNVFCXhvGXYv7lt348umixg==
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id q2-20020a170902b10200b00134a329c2f8mr727569plr.71.1629659264718;
        Sun, 22 Aug 2021 12:07:44 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x42sm13212111pfh.205.2021.08.22.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:07:44 -0700 (PDT)
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
	Sam Ravnborg <sam@ravnborg.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/5] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Sun, 22 Aug 2021 12:07:34 -0700
Message-Id: <20210822190734.3714140-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-4-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com> <20210806204446.2981299-4-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Aug 2021 21:44:34 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> MX64 & MX64W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
> 
> This patch adds the Meraki MX64 series-specific bindings. Since some
> devices make use of the older A0 SoC, changes need to be made to
> accommodate this case, including removal of coherency options and
> modification to the secondary-boot-reg.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian
