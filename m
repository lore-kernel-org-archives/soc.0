Return-Path: <SRS0=R3qi=GY=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C7CC433E0
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 20:33:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6853D23A58; Thu, 21 Jan 2021 20:33:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3292E230F9;
	Thu, 21 Jan 2021 20:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3292E230F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f171.google.com with SMTP id 31so1932367plb.10;
        Thu, 21 Jan 2021 12:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y0S3quATANmRYZMvtPwUreObi+9qpRrv12aNAKhmXgc=;
        b=UP4iYk4fOv7kU+ktBFUVpsdoQXKlUfZWjPscDYF/D+cPiJeX2KMZuVkJPN44CQeCXb
         0uHZy5y1cMJaNqtcdRdU2+TYfxPVyv44pFnlzpy+c8RzO9ezt0pV7NOxfUl5y5eG90fs
         QwN87/Y0G+FWE5pYzo0Zso/GNu9epyliFeRtn+zDFWN1P7VpSPwKbwGgh/E7pGvswfo3
         iZiXy9YZEiW/U1fRq0IA8QoN6kyDvm0g7be1ilJZq2E3YLAriCkZ4T/2eqba9F3W6+a8
         sHImmXaTbx5R4gtyGYrwAh3ozxkl/3lpqR/Mo2+M0jJLXFKjaZOX76TC4imlEO1ch6YP
         wA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y0S3quATANmRYZMvtPwUreObi+9qpRrv12aNAKhmXgc=;
        b=rMkEX4vePF67kF3IxYEJLKG7rRjT9pGWrJyE4MR4xigUkHsZH8RFu1huq9cgE3K0w5
         J+Nce7ug2GR6KU1Sg+7WN2HfJAhxkqTy+mObD10Lgq7uxVM2SltQE+mVXiOlN6LRN1H8
         S502RxeuvdJLN+bZTHu3H6Juh67xXdTPpcn3bj6tRtWYPgMBSNJpjF9zwDBkvD9nkzRG
         CkOG77WQOIsdHKB7kr4xkIQSkqWzZoQAhQwEUfrxsZXafGodGQcZGa03ApCpUb+MX2Eo
         xSTN9PCY+crwwZMMW7Vt9EF7wqpnDdZU2RQ94qb91fmY611hyhGTAnDaFL9gBQIu2TW9
         Jn7A==
X-Gm-Message-State: AOAM531KkujOL7Qu5auW9JcM4xJWo+LnmAvEsA+uPD7vJc0aMcO3ft4g
	JpjsGjgYu9y9+dGnspRquqz4TePqJvo=
X-Google-Smtp-Source: ABdhPJzutSKQ2vtpPJ5XAdjkPlu9B10J58bPcDegHVqAr75XSqRHC6X5WbN5T2o4xWE2AP6M2nNxYw==
X-Received: by 2002:a17:902:9a02:b029:dc:3481:3ff1 with SMTP id v2-20020a1709029a02b02900dc34813ff1mr1463045plp.28.1611261188031;
        Thu, 21 Jan 2021 12:33:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q12sm6305667pgj.24.2021.01.21.12.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:33:07 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom maintainers fixes for 5.11
Date: Thu, 21 Jan 2021 12:33:01 -0800
Message-Id: <20210121203302.3639841-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121203302.3639841-1-f.fainelli@gmail.com>
References: <20210121203302.3639841-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/maintainers-fixes

for you to fetch changes up to bb5ff8c28e296dd7101accfd3fed9475cac7e4bb:

  MAINTAINERS: Include bcm2835 subsequents into search (2021-01-20 10:47:20 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs MAINTAINERS file updates for
5.11, please pull the following:

- Stefan updates the BCM283x to also include the bcm2711 pattern to
  match files pertaining to the Raspberry Pi 4

----------------------------------------------------------------
Stefan Wahren (1):
      MAINTAINERS: Include bcm2835 subsequents into search

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
