Return-Path: <SRS0=MqM+=QE=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7740AC433F5
	for <soc@archiver.kernel.org>; Wed, 17 Nov 2021 12:57:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4FD9363240; Wed, 17 Nov 2021 12:57:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28EB263236
	for <soc@kernel.org>; Wed, 17 Nov 2021 12:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28EB263236
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id z34so7992214lfu.8
        for <soc@kernel.org>; Wed, 17 Nov 2021 04:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=qZPa2mY28LffgzuxXGxY7bPALs0+EXJe+qkR4+Voe48=;
        b=Tg1ld3eB8x+kUnRoDQRjd5qR8rlRksu+KI9DjISMo9Z7rlYRGXkR9OEK7BTPHkw/T2
         ryHERoy4SzdFke9+rYxUKd4ESr1X2z922WpPou8zCIY431YvSOISZ6OJk7EbtUlIti6x
         VX63mpgfqgxt8gmFTv9OkCKC5Ka8hpQI7jRzs0Y5Y0Apci3HQZ4ZhRw61sfrAfzv8+eY
         aTH6DLIK7kq09kHOcKTJ1sAi5gOw3NLwXsiuNxBMvsNTiHB4BFVlke2ZP8Td94c8uRlP
         XZd5CMQ/3Iaux0VNL4MM7JMrPxtHUKTglx+H3CuHvhm4qtLfWBBv7/M1gcM7ptBmCI7k
         NOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=qZPa2mY28LffgzuxXGxY7bPALs0+EXJe+qkR4+Voe48=;
        b=dOGK5nRqbIuuElOAXTXG0/5HZyaxk+NrI1c6hw508MWYjsQ1SDOO30MTtKdX1udZ0e
         eayVsMZGOd1kbK8cdiNd66heZg5k6dblSe/dvZJERPG8NW8c4SVkY5FV7U2+tf6vMbUX
         +ML72GxCo1gkiKKWdRRYsOJjZfVAfO58dRwpImBWWqDJDNdlbiiQk+swJuNkH17gp3T5
         +Y98xSmMTaStOogzGuhQhIPhozHgaFCBeM7ZyRVjoygTW1AP7Oj++gGc+KTcpTGFGlKt
         hi4T4GPBDaz/ApUANDpLL6yo9DqYYxGPVcCTvo9Mi9/9U538e7ZhzGM4FeHECdsunVup
         TG+A==
X-Gm-Message-State: AOAM530DMU+zwJDCoxhA3qmt1B3I2ibWiNa4V0SQ55+KzN+MCGwOImKA
	NqDT7+YrVXfTUT+QqGcyFmkdgiiPzWbbeOJN
X-Google-Smtp-Source: ABdhPJyXDli2e3Wq9QBa6FI5+bRrg23v2EjYnJyqYR1ymOsyIaXeq8nY55BRKP8dU3mbdH1dnMH9lQ==
X-Received: by 2002:a19:7404:: with SMTP id v4mr14701257lfe.76.1637153869439;
        Wed, 17 Nov 2021 04:57:49 -0800 (PST)
Received: from jade ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u16sm1070197lfk.178.2021.11.17.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:57:49 -0800 (PST)
Date: Wed, 17 Nov 2021 13:57:47 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE fix for v5.16
Message-ID: <20211117125747.GA2896197@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix to avoid a possible NULL pointer
dereference in the error handling path of a probe function.

Thanks,
Jens

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.16

for you to fetch changes up to c23ca66a4dadb6f050dc57358bc8d57a747c35bf:

  optee: fix kfree NULL pointer (2021-11-16 14:41:23 +0100)

----------------------------------------------------------------
Fix possible NULL pointer dereference in OP-TEE driver

----------------------------------------------------------------
Lv Ruyi (1):
      optee: fix kfree NULL pointer

 drivers/tee/optee/ffa_abi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
