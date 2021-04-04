Return-Path: <SRS0=bnFl=JB=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC87C433B4
	for <soc@archiver.kernel.org>; Sun,  4 Apr 2021 16:48:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F46D61365; Sun,  4 Apr 2021 16:48:44 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CC261364
	for <soc@kernel.org>; Sun,  4 Apr 2021 16:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9CC261364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f180.google.com with SMTP id n140so9673037oig.9
        for <soc@kernel.org>; Sun, 04 Apr 2021 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
        b=m+Dn/sje6Lm6a8Ehtytn3lZkENyRULhfOhPDdgsZ5z5oYte0AnICLQSi4Bn5AdL58J
         +CoBQ9rs7KPatBG7fG7ZPx2mjLoSPG9Wu69hmQ4aHlNu/3WDiuA8GHZ9YlnnXqi03msD
         NJeibO4qVVZ9kILn5yHlBilZaKEr+nCuhC6VrRC2BBVgJNVLrto/F9ubLo71miMNh91a
         ZAnFBP6xLNBGfnC8iShC4eNZ7IM2XcAKsPTbhvjCkK52gO8PtlXhfmUTkXhZLdcyk1xW
         hNjOsUmFSN7nP1FTsI6Z5kJeHZ6pDR0PeF23x1Dhy77+eeZDK04njiNWvlu5F/r6bKXf
         Picg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbpeT+Mek+XfamFPZmReFCDXJFtqrtaG9wtcXHbtspw=;
        b=JOhcx9kk143Pr74r+JaBi3VGqcqRwkKPpajXgU6bre/6tbRU295waLGbg5K+VRnv+f
         11gHYTstsKRrQpKoSEBir5O+sofXQdLHnA5ymqy4SXCzmTFp4GMGAtu1vjZCb2WFC147
         aOqEKX4dJy5rtfn4TPhrnVrNuvyxaHgjlCUp/7AsTu9efsQiO2sGUOP4VY2c8RxohLlb
         Oliz5OEZxiUCnrHb6uALFKped+1Jjdgw2Jd51avP8pJ2cTKlx4Ys9GQkF0B4p7SDK1ku
         /U+hVdbBQdea4wRrxmlk34xyjNT+UXIg2A+21StPWVYjJHJBVitQcVmGwd5lgerZWs/y
         9ZOw==
X-Gm-Message-State: AOAM533dIRGKK3gyQa+dQOS6eWL+4w5vAl8mxnMnbCCftfZhbibl5BGX
	P46n6cIL4UP0c4ir9xfvSYooJA==
X-Google-Smtp-Source: ABdhPJy3Mi64WupJ/Hgn5dxMjnN3uch64bKtgIU0ITOjLlU9jvRjq65mBzceXINQyD0eKQZUQgC1Pw==
X-Received: by 2002:aca:e0d4:: with SMTP id x203mr15938867oig.76.1617554923162;
        Sun, 04 Apr 2021 09:48:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j72sm2672556oih.46.2021.04.04.09.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:48:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpate for 5.13
Date: Sun,  4 Apr 2021 11:48:41 -0500
Message-Id: <20210404164841.712845-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.13

for you to fetch changes up to 1a0252abb6ff8312f28d4d8bc2b115ffa9c5d6c6:

  arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC (2021-03-08 10:45:28 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpate for 5.13

This enables the SM8350 TLMM and GCC drivers, needed to boot the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
