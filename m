Return-Path: <SRS0=l92L=FC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6AAC63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A8782246D4; Sat, 28 Nov 2020 16:34:23 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F38246CA;
	Sat, 28 Nov 2020 16:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEF7WJXE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F38246CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f181.google.com with SMTP id w4so6748247pgg.13;
        Sat, 28 Nov 2020 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+wcHMfC9e46l75/edznzeGWqfk7GC3EcwU/4A/2dBVw=;
        b=bEF7WJXEJothrpCAMY82PZQcafjT15q0/BykDXhEFbC+UySdoOPQZtgfKu2FCcHzGm
         YG8tTX8JTLlmGuA5y89WB7LTfWkdORMgLJbKtEdpADsnW6knAKbLpSz4ivuJKeeocu07
         BnZohIKXsFb4jlHjpkBmyR0NqspjMGTrW/hUH2gKAmJYpr6x76u/2sEzw9IVQrA9LcT5
         f1w16UG/lgf7AaQqhYH2/SL4NoRxt6JB2Oxmoi8bN6ZqRiqnpSHc4v+Bh9tTeh7bg1wy
         ViWmp7avM2KGTDOEGc5OikisrMjW+ipLakflKYcwMUAGczcvxXL+GamP4D741SBv7tmr
         jK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+wcHMfC9e46l75/edznzeGWqfk7GC3EcwU/4A/2dBVw=;
        b=oKD04p0hH6GHuDwhKM7nl//BMgDpWX6U5U+4d/fRJGacfykSIWkfcbtyLWubOT7SDb
         owObv4CKmBMUl0t6EiN4pjok6LO0jmeecXyFYeick6OrdZ21yhsqKNrZh6urINAFnsmy
         GvYQREKqVhyz6paqxsDPHx6IjiOcztpwaBbzuMlC1oHTSBLEr3S5gvdjjRtLUYnqAj/j
         SjU4SXzHuEYfjKb3LRILlSEUCWMuWbYTea2yEZu5jGC/R7p8MBFTNPeXA3saZ3tkZF6n
         Dd11qPWJC5k3ktpsd5s23tMlnFx5j9jI6JQ5lylu5o8teFsT6cPjJNEUezKsxdQyLUuu
         +YOg==
X-Gm-Message-State: AOAM530a/GL4lWmlg26UbbMzLeZ1kgYCHQ+VeHFU5n/rQkMT4lKyGo4s
	ieaWpDTSXx2YRALTVulLj6ujTvWblkM=
X-Google-Smtp-Source: ABdhPJwCNbtf1bAnKuHk+EZfK4vuxIY5YZ/tbS8Uo1GHEG6oowtT30eUDilBSPln7NyffN60N/3BYg==
X-Received: by 2002:a63:b908:: with SMTP id z8mr10971164pge.396.1606581262559;
        Sat, 28 Nov 2020 08:34:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 08:34:21 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Lee Jones <lee.jones@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/5] Broadcom drivers changes for 5.11
Date: Sat, 28 Nov 2020 08:34:10 -0800
Message-Id: <20201128163410.1691529-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/drivers

for you to fetch changes up to b96c0546b5908268716ed9b1d39fc604413c630b:

  soc: bcm: brcmstb: pm: pm-arm: Provide prototype for brcmstb_pm_s3_finish() (2020-11-03 19:25:04 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs driver changes for 5.11, please
pull the following:

- Lee provides a missing function declaration spotted with W=1 builds

----------------------------------------------------------------
Lee Jones (1):
      soc: bcm: brcmstb: pm: pm-arm: Provide prototype for brcmstb_pm_s3_finish()

 drivers/soc/bcm/brcmstb/pm/pm-arm.c | 2 ++
 1 file changed, 2 insertions(+)
