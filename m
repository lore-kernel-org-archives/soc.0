Return-Path: <SRS0=j1MG=2U=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993C4C4332F
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 18:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D7C9C433B5; Wed, 19 Oct 2022 18:55:26 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 611F7C433D6;
	Wed, 19 Oct 2022 18:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 611F7C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id s17so10165620qkj.12;
        Wed, 19 Oct 2022 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VXrgBX1athzvXp2CtUSg3PyPqOmQvcygmGrhdJ9TK4=;
        b=CXNRLM4uIW2RwVKZenCERFTn5ZxEtBiN8Zv4ZX+r/g0929T3YrvLcCFFYnmhmRXQ7p
         cEzpYgdtDsIxkYvPUYv8SZFlWXbhbGQJw1A4jz7XF5msYK1EjPUXUX+Dj7gxYoIBdk2L
         gH1FaYPfLd5R92881SlVhIUlMCAkFEO7wN/4UFpxYenY+U4/zBlO8kBCl0cpe80cOinf
         kgdIpM1+3gZf4Ah4eeOnGZ560quUxryHmGpTfQJ7T6mzm4jLmedCUS4Wu2fOaIi8hfJy
         FUTywnROS1oMiQwiXt1FwCpeTjg1S+chZKZoZsHGZkvXXHDwV6FudxOc+rAGxPJw9Oe/
         7Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VXrgBX1athzvXp2CtUSg3PyPqOmQvcygmGrhdJ9TK4=;
        b=fBSuiztP23zoqA3sB82kx+QxrctUszOBkIlRR86zSgyK/P84wNzq7dknhub32uDJ38
         juDdbPilPS4qQQJHm03PY40pUOw+7M1iZNeb1A4ewXhPClXnN25Z+P1xIR59/Pr0LsmY
         4nUXqx7ovLJsscKfZeRMyLsTfXXb17Wj3PBEEkQJlVMTDywWiIRBz2BXyq04yRWJMgZF
         P5VLrp74dV3wKuG6iAkjCUTNEMmaimzLNKk+pLTEK/44IibdQjP0yRT8g8Ykeln4Sq9M
         9V+H+uEPUcCrPtL5LCWfUxG00EAAVaG2Ks6Zo+loexexUDvSX7vN/cq9WHAxnO8Yywmn
         d2Gw==
X-Gm-Message-State: ACrzQf3vN9MccOok3nf5kF6/qAyofdfXMEKn/YJKoNEXHVL6bJ1b7ObU
	6uizlxpnPGJRaDs0l6RRZIsTArZIXI0RfQ==
X-Google-Smtp-Source: AMsMyM5XJfamhe+nbnF5cuSjEhcUdBY4Zn0zeqBlvJO9XO1FWYhJR6sjZc+mZkCY6K/ezTGSbsRF/A==
X-Received: by 2002:a37:aace:0:b0:6ee:90c1:ea60 with SMTP id t197-20020a37aace000000b006ee90c1ea60mr6341008qke.215.1666205723860;
        Wed, 19 Oct 2022 11:55:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bp17-20020a05620a459100b006ce3f1af120sm5572657qkb.44.2022.10.19.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 11:55:23 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	William Zhang <william.zhang@broadcom.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom maintainers fixes for 6.1
Date: Wed, 19 Oct 2022 11:55:14 -0700
Message-Id: <20221019185514.750684-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/maintainers-fixes

for you to fetch changes up to 10f3f10f202109e3841c0c75add5a743ca197205:

  MAINTAINERS: git://github -> https://github.com for broadcom (2022-10-17 10:37:58 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file updates for Broadcom
sections, please pull the following:

- Palmer updates the various Broadcom entries to use https instead of
  git for the git trees listed

----------------------------------------------------------------
Palmer Dabbelt (1):
      MAINTAINERS: git://github -> https://github.com for broadcom

 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
