Return-Path: <SRS0=jISV=HK=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E112CC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 12:58:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A5A5C64DB1; Mon,  8 Feb 2021 12:58:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA3D64E82
	for <soc@kernel.org>; Mon,  8 Feb 2021 12:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA3D64E82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lf1-f44.google.com with SMTP id p21so22007748lfu.11
        for <soc@kernel.org>; Mon, 08 Feb 2021 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7e+2QeCZIF/RTfB76G03UV8gWuzCrr+kzUqC9Ip4Txc=;
        b=gzReHfoXRHqz/CxDxuG2pYbOxlcR4jVk00/Q4Zw0I6cpUCcnsdpwpdwOaFQQFWdfPu
         kn9HKZSWPPplowkmKTU3UD7RlQvbJcBete9noP9lTRoqJLJob5bfSSN1T5XSjD2c2L7y
         91WwEZyiXakAaS5CRwxzgnnCt3ir1R/p9GXjwn+U3wuneaN7UXtpkDWQruWn18fFxum0
         bhkplDDgMQOQ6o1XCpsoMYjRcOfxu1Lz2D48WT+q3FxcGqiH0/ToHWlljZj3hwNEBar2
         REr+wIWEnQTOS/klOAQGiBiQY160FCndNk0bQNTxioG+FudkESeuROt+ylsTRGrZ1TSH
         d2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7e+2QeCZIF/RTfB76G03UV8gWuzCrr+kzUqC9Ip4Txc=;
        b=SzPNjwo228KxEitf7RCAUShIRpTden0ZXErPGq1kxU45bQxa49FH897xtGtJVF5XSz
         APFpeW9hvKdmuJfVTMUTUKhGKP/d7cNgTvCUVXPZ5fF1dVWWNm80MEnFgpYx+abPpL+T
         xJkrPCAsi7RC6e5A4tMasyetX/inC3FTPxsYk8fT+kC7FRKoq3gEf1hiPD8yTuM6gcko
         lBEZKiyOic15xycBRv4QguA3tEoIiBGzxmrFZo8Riys2GEhfsOCkRlL+y8uj9C2uvG4S
         fRr6/hzS9h9WSYwS0KXX0MClSUKaKGgW1m+86F07t57//NTNdI8IN1Ea8evZ4CF0C4AE
         LBaw==
X-Gm-Message-State: AOAM533oJdBO37l9pmNdzu+ZUCe+kdm5MK4VINkRYqnY8ygZXWjzTatB
	3oRSBGjtORMBpwMUIc1SF5DBYqOulAxFxQ==
X-Google-Smtp-Source: ABdhPJwOZcoerPukFtmudmtjfPealVwCV3D/Czvysyzfg3fSeG7P0Go6A2Y9RIw7BD/9tR/W34X/XQ==
X-Received: by 2002:a19:6b1a:: with SMTP id d26mr1424486lfa.162.1612789135353;
        Mon, 08 Feb 2021 04:58:55 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id a7sm2087969lfb.308.2021.02.08.04.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 04:58:54 -0800 (PST)
Date: Mon, 8 Feb 2021 13:58:53 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE I2C simplification for v5.12
Message-ID: <20210208125853.GA288348@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this fix eliminating a stack frame size warning and also
simplifying I2C access in the OP-TEE driver.

Thanks,
Jens


The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-simplify-i2c-access_for-v5.12

for you to fetch changes up to 67bc809752796acb2641ca343cad5b45eef31d7c:

  optee: simplify i2c access (2021-02-08 13:42:31 +0100)

----------------------------------------------------------------
Simplify i2c acess in OP-TEE driver

----------------------------------------------------------------
Arnd Bergmann (1):
      optee: simplify i2c access

 drivers/tee/optee/rpc.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)
