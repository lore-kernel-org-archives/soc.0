Return-Path: <SRS0=kpNk=JG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1094AC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 17:50:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D8E076115C; Fri,  9 Apr 2021 17:50:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC20F610A6;
	Fri,  9 Apr 2021 17:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC20F610A6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pf1-f176.google.com with SMTP id m11so4711685pfc.11;
        Fri, 09 Apr 2021 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yF4adJ/N2MJB/B2dgo3LBF/vMMqYbS0nkm1kg+A3XuM=;
        b=D6kKemq6EnpKrfWIvgpsEpTT028RfRz8+6DpFobJX56oYxynu6JztyCv21GKK9cZwp
         zWR7dKvJ+HkzBlB7FPw12mbiwdbPyRv/mYwrU0oymndu4ideXQBIlgQg5BcFAO1khr0z
         SCk/SsOggGhGTsXlAjF46q5n8J7EKG4NU6Ujs0APlhJwQ3Hjr+BfYKNtm5U1iy1V39Tq
         7bIzkkeN3T4RgINNe7h767S/MmCeMvDCU22jFdReisRbQdunslojnlCwuT7qtCz1q32J
         Wx1aw0XDSmb9U/PhiwYUcc92L8DRP5qOpq6gXbYjfMYYOAwzYuHv9IIrnr0blo0y6vMv
         FyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yF4adJ/N2MJB/B2dgo3LBF/vMMqYbS0nkm1kg+A3XuM=;
        b=Gmpq9RJc1S8vfwj6FiCjvfZGBsTBti4DNG+CPzFiL4U0SJwLCdEz2RtmIAv1qZ9MKl
         SdYYGiVnyqr4FfX1tZYkBuHA0vg6mP4qHiHzvCxwtmco0VB/HJYHfZRM3Ou1VN+O7RjQ
         sIpBPKawkzVZmtLShbknwJrfU7U2S4gr0+x6yP+iqNb3G3eDvykR9t1n3f0112aVyawO
         h/cIVefYXXKWus7XVJWRsl25X2C/LQ80/DMEWpt3KHrQV0xlTZWsPbR7aF3l+QNYsrX3
         qBKC8vhmXh4fDKClTWdSNkCCFj9QDJjuKmws0Bi4j/apVi1inuuM4vXNCGcWNBRSZm3J
         M1YQ==
X-Gm-Message-State: AOAM5306MKKtpqNGc1eI0UUU0XNqydwwyUeY/lI8TaWcRG3Rv2hT7Ks8
	W2QZt49laIdz45O6CPgeE/kH9myd8Tg=
X-Google-Smtp-Source: ABdhPJxHp+9xc6/QzyQflTULgUDZZGa7gN4SxfnVzrVYepgzPZ9jzUjK7LdxsCV2el2gWwpUEvezVg==
X-Received: by 2002:a63:eb49:: with SMTP id b9mr14099271pgk.318.1617990621940;
        Fri, 09 Apr 2021 10:50:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126sm2878493pfv.138.2021.04.09.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:50:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom maintainers changes for 5.13
Date: Fri,  9 Apr 2021 10:50:18 -0700
Message-Id: <20210409175018.3051283-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/maintainers

for you to fetch changes up to 0072f6c37f02071821eb2135b80daa404d783704:

  mailmap: Update email address for Nicolas Saenz (2021-04-09 10:47:17 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC MAINTAINERS file entries and
.mailmap updates for 5.13, please pull the following:

- Nicolas updates his maintainer email to a kernel.org address for
  continuity

----------------------------------------------------------------
Nicolas Saenz Julienne (2):
      MAINTAINERS: Update BCM2711/BCM2335 maintainer's mail
      mailmap: Update email address for Nicolas Saenz

 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
