Return-Path: <SRS0=Yh/P=JE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B240C43470
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 06:58:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 644E3613AF; Wed,  7 Apr 2021 06:58:44 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28737610C8
	for <soc@kernel.org>; Wed,  7 Apr 2021 06:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28737610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lU29C-0000fR-RY
	for soc@kernel.org; Wed, 07 Apr 2021 06:58:42 +0000
Received: by mail-wr1-f72.google.com with SMTP id r11so6502129wrp.8
        for <soc@kernel.org>; Tue, 06 Apr 2021 23:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LchvM2u0iW5KufEGKbahHHtTCv2rOtXQ3p5uFrGxVE8=;
        b=dw96ryNWDZ8bx8hMTUD1Y7Qb+Tvl9wbdeX3N2/19ifGvDhFDn8QsVrwbKB8v36uUw5
         bUfRi1CB2n5g7lbK5ISIHgeqtB8QmvChSMUJLIUEUnP31RUwdblunE7/yvlbxqZIpxyj
         iLpqH4atlSOQJjcyiLP51bLewaANbCWVhXR5ScLBVPEN8tIsLzhZcS6CCrbbaduNSsSn
         ZAEYzoBTRoh13hjXLxFW5HyetTK5eFdKUK6qrfUsUEHVpxi9Cb+9n7XDDUb1JzLUvJhT
         Xhm/JiwFmrisIEP8e7w3Vt/A0+JezxUM4AQorTN4lBqJVxVfUXsftxsroaOGpUuZOg1w
         vv0A==
X-Gm-Message-State: AOAM5313LGcvbDQ/+qA9DyIv2pPQJQboi9TbzUyidnSHi2y41faDnQtp
	4B7qe/NMgmE12fyiyiDJYbL9NH+EtvFyqPK7Xf8EtQB8Xd4gR4Gainj7E5HpvY/sv21CQ17XBFx
	dN0pbAEcHh8N9w13j1UharkI=
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2442780wrt.255.1617778721598;
        Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb0GNMb9BXI0hktJMyfEscPsHyz/GoH02QCojLY9kbR3X8bjEYRVjpos/mCtzqKkygNyE8ug==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2442766wrt.255.1617778721479;
        Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:58:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/3] ARM: samsung: mach/soc pull for v5.13
Date: Wed,  7 Apr 2021 08:58:28 +0200
Message-Id: <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.13

for you to fetch changes up to 6031008780efaada18087eba7ec84fe149f124a9:

  ARM: exynos: correct kernel doc in platsmp (2021-04-06 22:30:02 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.13

1. Update Krzysztof Kozlowski's email address in Maintainers.
2. Replace deprecated pwm_request() with pwm_get() in S3C24xx.
3. Correct kerneldoc.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      MAINTAINERS: use Krzysztof Kozlowski's Canonical address
      ARM: exynos: correct kernel doc in platsmp

Uwe Kleine-König (1):
      ARM: s3c: Use pwm_get() in favour of pwm_request() in RX1950

 MAINTAINERS                     | 24 ++++++++++++------------
 arch/arm/mach-exynos/platsmp.c  | 28 +++++++++++++---------------
 arch/arm/mach-s3c/mach-rx1950.c | 11 ++++++-----
 3 files changed, 31 insertions(+), 32 deletions(-)
