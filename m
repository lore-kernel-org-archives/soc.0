Return-Path: <SRS0=Klnk=Y5=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B54C04AA5
	for <soc@archiver.kernel.org>; Thu, 25 Aug 2022 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07796C43470; Thu, 25 Aug 2022 09:57:11 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1665C433B5
	for <soc@kernel.org>; Thu, 25 Aug 2022 09:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1665C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id m5so16855814lfj.4
        for <soc@kernel.org>; Thu, 25 Aug 2022 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=yPQTjek19dVxANcg2e3WvPol3YwRVRICz8w3fymbirY=;
        b=ahhl9xUT7wWMaxQJsVd/s12OzETtJzJFtjCcd2xC/A415hBGBmjvEelSL4KaeG/5eQ
         QPgCLbWagwJn/qtv5HclgmhTZp1Pxh2R0Igvz1AZDiggkWJaXnY9IGDKU1GNf1mYMn0I
         gLXLBva7qKA62qcxMVcJEj6T25tv1rCywpWodT4//PHvXItxVSoC0d/XbdtB7wDOTWMH
         61pnT1doMDledkZQYI4TfOlH9Z8TNhnjo+NvkshX9szI935uLCkZC4wtYNu9mEprOUL4
         E418SN71jLRgA8NCwQRv17MkCOhL1c0svsGewijZZbdMCHc7QTV0BoJWCOvYeg8hLq0G
         yitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=yPQTjek19dVxANcg2e3WvPol3YwRVRICz8w3fymbirY=;
        b=YVIS5+e8T8G8T5PXYyE2Am89sybHK7LNzRb+q6tFraNRd0kcOCHnEWSm9HuvLxooMG
         XbKGVqKh05t5j22S+H8PwEyhByq3IE97R7nNX0uPJMAbsPTcbb9+JRdMVM4UMuPcSZxB
         77MjxZh8ESrBXejGQzrFhtWhZ6h6uZ423sAEQogOaen0ndXAxo+KSCDrjvKQOBoqFV3J
         WRhoadV/r8M0RV49+jd8tL5wJOm0ue1U33mWTxh/gCzFxkKdZHRzJuXHVO8c4kBShfoj
         8pazJjnJWRQ/vNkldylqeRKfN3Q8N8VYSs0J/N6AcnmaqfKJBd7lcwtQK6YPKifGMpdO
         Z7Ww==
X-Gm-Message-State: ACgBeo1WZQCyqh8zH8rnwa2TGQmHI5F3i1LK9LHZixzOGifksvKUrseE
	1YGhSy7I67QHUflq3jDQdka4nQ==
X-Google-Smtp-Source: AA6agR6d5FacAMHe4GmbVd8uFGIcTWuWpvV14leXcjzWEufYUIWFu+RUixDMXPJq3HROWsi5uM+tqg==
X-Received: by 2002:a05:6512:39c2:b0:492:d15f:d246 with SMTP id k2-20020a05651239c200b00492d15fd246mr1022150lfu.517.1661421428010;
        Thu, 25 Aug 2022 02:57:08 -0700 (PDT)
Received: from jade ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w25-20020ac254b9000000b0048b06f34566sm414602lfk.76.2022.08.25.02.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:57:07 -0700 (PDT)
Date: Thu, 25 Aug 2022 11:57:05 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Fix TEE system compiler warning fo4r v6.0
Message-ID: <YwdHcdEUib7obbbW@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch which fixes a recently introduced compiler
warning the TEE subsystem.

Thanks,
Jens

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-fix-for-v6.0

for you to fetch changes up to eccd7439709810127563e7e3e49b8b44c7b2791d:

  tee: fix compiler warning in tee_shm_register() (2022-08-25 11:40:06 +0200)

----------------------------------------------------------------
Add a missing include in the TEE subsystem

----------------------------------------------------------------
Jens Wiklander (1):
      tee: fix compiler warning in tee_shm_register()

 drivers/tee/tee_shm.c | 1 +
 1 file changed, 1 insertion(+)
