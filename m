Return-Path: <SRS0=fJuS=5Z=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40121C38142
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 19:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24AB2C4339B; Sat, 28 Jan 2023 19:38:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40E22C433EF;
	Sat, 28 Jan 2023 19:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40E22C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id e10so5211762pgc.9;
        Sat, 28 Jan 2023 11:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UrkbSszXJHZ8V9zA3ukLAKg8MEmz/Fgwi89//fyC/M=;
        b=bBs6rWvadZ2bX9ERrgPk5PBWcuWxU9HeLJIR09Z7IcyZmidykNkXxsgsLAkGygAB/e
         jGSNRu9ZjKrQ9uJlMzaVV1SYHJ+j1ze0j8LUqfjeLlHzCJ8X1fhJW6HFt7Wndgtv9tv7
         T4k8Fe+X7Wxfse9vHWSVmQ/KpJX5gFRlDt23q8vT4Ihqz/N+lQrJ2AAoWarU8YSGJ+Te
         Yay4QHcUoIUoL0uawRmHIAfnmO0czK3I0bKzpqygdat09Ts9QkqRKSSczYrMXiarAdBi
         QXH86c/dYl07JhaRbnBLBiWBDqle4bgpPR05fxuOz2kGJT7INB2+PFFd9KlQF9pMwXTH
         X29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UrkbSszXJHZ8V9zA3ukLAKg8MEmz/Fgwi89//fyC/M=;
        b=5U+9BjZ597p+HZ4DHww4q+Lr2MDPguoHNrIubfPwcsRTUnOi6SXbeD5OH29rcMW/bE
         /4xCcB+DWhhuV8c4b4WwbTqqUn6ygHLk8FeX/UxFHTxrMPQZEJYECAcLxmEZFd98Qzvp
         VoAU6Bt9YfAx+M1YeZnGGuP/+IOlRmA/uJ0iVUvFl3S4D87Id2SYJQn8zEDWwgIydZA+
         4UYA7qrxIlXiSn3fTKh62PZkknkcN/7gpoYsbANtrXfjQPr+NfWc7v2fJScdFT+jM5qh
         latPDMgGmwykOfGa/KlyWu5SfD4lPsO6IjCjLTDtW85u70X2jGUOUuLMtBQccgfx8SjC
         fFqw==
X-Gm-Message-State: AO0yUKUmPvYY3AV7fOxzHYHWSco9kEIps3VhXzgtzSx2zaeA8eXDZmND
	7NaNFAO0BGU0SAbSpCMaABt/XCG/22CD2Q==
X-Google-Smtp-Source: AK7set/C1WGMNpRAk8Pd6Q0cBj9fUkAyiTdhoawcC36VCa8s2l/Iiqza0BjnINInBb84kFKu5c1uvg==
X-Received: by 2002:a05:6a00:1404:b0:58b:bce2:7eb7 with SMTP id l4-20020a056a00140400b0058bbce27eb7mr2522088pfu.10.1674934732187;
        Sat, 28 Jan 2023 11:38:52 -0800 (PST)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id x26-20020aa7957a000000b0059393d46228sm1654876pfq.144.2023.01.28.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 11:38:51 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/5] Broadcom soc changes for 6.3
Date: Sat, 28 Jan 2023 11:38:49 -0800
Message-Id: <20230128193849.1628945-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/soc

for you to fetch changes up to a46674396189d045993c7e4aed2c61b166b6585e:

  ARM: BCM63xx: remove useless goto statement (2023-01-10 13:46:59 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoCs machine updates for 6.3,
please pull the following:

- Dario removes an useless goto in the BCM63xx SMP bring up code

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: BCM63xx: remove useless goto statement

 arch/arm/mach-bcm/bcm63xx_smp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
