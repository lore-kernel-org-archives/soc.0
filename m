Return-Path: <SRS0=ug29=ZB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B2ECAAD8
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 22:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63EBBC433B5; Mon, 29 Aug 2022 22:51:12 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87B3DC433C1;
	Mon, 29 Aug 2022 22:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87B3DC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id h21so7331335qta.3;
        Mon, 29 Aug 2022 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qqgceNlblAIt2qlcWN54Y+Zs8ElYRgsDr5j7qmyK9mY=;
        b=WUw7yZ3SF+VpOtPgIeDL06kNjDqQ2Ic4rTOnOIeOQ7PB+So8+WIFrDT1sGUfHFuRoU
         bVfaAwQOkhPwu4dpj6qX6clya0zH/mT9XqfB4ABsMlF0uJJAT2FhEDQlGm6iP0NB978h
         ZISy/Vc+c7GPnwEvUryPZJQ7SuSHkSae0nYVFZZU7uAvOoSpV9cby6ooJVWyzTHgHTMg
         gAZ++SfnLk9kwW/ugi8XAw0m8LUbQWQt5Fe0kA2Chgx+Og4HlpTku8Gx2R6pzgcy9gRR
         qiW9LOpRouI9FqtTAurJOBv9jyfQD54v4+bh76K5qn+E1iCgd+4p6YbHCDvx7sfX5XLZ
         gqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qqgceNlblAIt2qlcWN54Y+Zs8ElYRgsDr5j7qmyK9mY=;
        b=xdknfveLh2G0WF8c/bxD8VcqcbYUJStBs4L3WLWjB/VxwTFwHOv+ZX1DQ6aMiqsx6z
         oMJX3CUkhbs65qYpVKzM6GNFVXROCcmsNCPxuqBRntuBouK6XUoyLLMUsbtCFbJYWNoU
         7jnLN7txfIYciJfE0vDqWLJaBnYUPU5KM+ZFBOySnxxIwhtv/OYOGB3lvaAc9j1KSW0R
         9TuMuqhfQyUX0VkcHa5VGrawdXS94hUe7GQ04RYj5qdwSr4Ljcj5gLEtBaRhSrQp+1Qz
         SYFvmPpM7gbsbUExWsZ96XWDOisf2ceIMB7xEMUpcQoYWxkZPnWM+snjwb4Sr9fFbboz
         fcPw==
X-Gm-Message-State: ACgBeo3rp74X1oLZiRfAMFpswInOj/X6glCVfqWHL6lQiQKvG3uS9fvV
	Sqn/lyoz4XzTvfDlTWLUa3jedOJzzDo=
X-Google-Smtp-Source: AA6agR6/WuTZJ/SdskOgn8i1scW7++HKoY7GzfHnL1HdUr0wvlptDpXzGOKjAulHJpnfRexZ1hUztg==
X-Received: by 2002:a05:622a:18a6:b0:343:67b8:ff5 with SMTP id v38-20020a05622a18a600b0034367b80ff5mr12384199qtc.496.1661813470128;
        Mon, 29 Aug 2022 15:51:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a288600b006b9593e2f68sm4961102qkp.4.2022.08.29.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 15:51:09 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Liang He <windhl@126.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom drivers fixes for 6.0
Date: Mon, 29 Aug 2022 15:51:03 -0700
Message-Id: <20220829225103.753223-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829225103.753223-1-f.fainelli@gmail.com>
References: <20220829225103.753223-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.0/drivers-fixes

for you to fetch changes up to 1085f5080647f0c9f357c270a537869191f7f2a1:

  soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs (2022-08-29 10:30:22 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs driver fixes for 6.0, please
pull the following:

- Liang fixes the legacy Broadcom STB ARM system suspend/resume code
error paths that were leaking ioremap() and other of_* operations

----------------------------------------------------------------
Liang He (1):
      soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs

 drivers/soc/bcm/brcmstb/pm/pm-arm.c | 50 +++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 11 deletions(-)
