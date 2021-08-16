Return-Path: <SRS0=E6oP=NH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187D2C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:00:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF19460F5C; Mon, 16 Aug 2021 21:00:16 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8FE60F46
	for <soc@kernel.org>; Mon, 16 Aug 2021 21:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D8FE60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so22620545oti.0
        for <soc@kernel.org>; Mon, 16 Aug 2021 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
        b=alwKgKEVSmhx7VhAtCo6RC7luejxVz6EcoXZDb87WtX/dskllvt/aaVKwWLrXP78Ik
         rCrR+b1TkUREtNRoOl43x0dfUJkAN7BIG8u2QPl4I3f2Ki/Y6TBMATZ8rLp0HAirnxwj
         ePJtG1moMayyEN1BipWQcSlKiKyd6FryEmoxKWClsqA5VckEqrUYBC2Jz94l449g/914
         8Sv6M7xJ75l9IZkojPWfEuA88ad6ayVX0ISCCQp3VH5IPwBaWjuyA0DzNpB3zN0npCoM
         z9p6RmvRPAc0OVkriCTy2KTF7gUgVa3oQ3Sk3P5YP4I7nO5DjG+fuRpGX5cq9KFMq5mj
         QA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
        b=V7nHwsRd+4TXMjw8h+rGI6Np5El6uRE9qO7k8FAb5sifITWpl5RBjMlxorFC1AAXri
         wTt2LCltcblqn/e5YIX/LOK+w3fyCGAsSKULLw+Q6KJHHHHSFbhuMpPUnkftwTjhX+9O
         CBCahTsziicZcBy4dBGaGrI2hD57OAuNRtj+f5rEOG5WjhNIuAzSbsXMNmISaw/gAX4h
         tVOzsKTyKB+jH/02A0fZTMv37XSDeHa5BklQas1AtxD30zLF483gBR91Arwiw8JHmdC2
         o54BCVY2jTGEazpmXhYYg9pYGk7HMNzZEeixb9zk1uuTCOAFftekqLmA9Mts+HBDCaGa
         FbxA==
X-Gm-Message-State: AOAM532aIKTOGswL7bzK1Ni7Vc6YlTGYiGN3Mj4D2X9SIX5Ti6q1VFYJ
	T3RJiuY8GEkZmSm6fKfUtGlXHg==
X-Google-Smtp-Source: ABdhPJwTHQKU7QIjZBBDi7fDrFKPBlbD2lE2h7dQyUE+Vhbo6ljOH7uWpaKol+rYbaSvqCqbqIi5hA==
X-Received: by 2002:a9d:1441:: with SMTP id h59mr72685oth.15.1629147615944;
        Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t1sm88145otp.9.2021.08.16.14.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
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
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.15
Date: Mon, 16 Aug 2021 16:00:14 -0500
Message-Id: <20210816210014.577699-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.15

for you to fetch changes up to 20d7a9fb00ebc53e73d49df0048afb02ef92a635:

  arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver (2021-08-04 15:02:54 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.15

This enabled the MSM8996 CPU clock driver, enabling CPUfreq on the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
