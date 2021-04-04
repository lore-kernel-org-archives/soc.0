Return-Path: <SRS0=bnFl=JB=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8DAC433ED
	for <soc@archiver.kernel.org>; Sun,  4 Apr 2021 15:56:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 39DE261368; Sun,  4 Apr 2021 15:56:07 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FFB61369
	for <soc@kernel.org>; Sun,  4 Apr 2021 15:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FFB61369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f49.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso9404768otp.0
        for <soc@kernel.org>; Sun, 04 Apr 2021 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
        b=izMvhpc1jRXqC7dJ9KVU9+snFnElat3KvdJSeLOkEbshx72AkDcQNZcVwpzfbQ6yhe
         KlMNIbun/WamNmPPEnTDnoazzQA5P7IsVp26Kic5NOatBCS7+DTwxLNA99ozkhgNy5Xh
         Ku/LO9Jl6nkpSjlTUq8ouQi5e5HGwHEMzBuqsB8M9u6CsBUec7Ee9pvc4lnvqxE4lBi+
         UJpCpIbl6vESIl5vJDmctkaL0EJxc8g4uVx1frR5/aYsRs+vj1ezfknwm2ocZF01dE/L
         2dXjxOtuAAUBmCZTCkWKunpvjSlTUX2lrcGT8b4/PHwKOWgrxsL+1iWXksbtfj61J6wQ
         U5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
        b=UgPAkaE0mKSp0PqJ/wXB9hbfhIKkVfE7GpMHKfBvv9Ds/QCQOgNPlaFAyaPvhB+REr
         yfyHwz+pUNXmDWI/d22gBdxIJiCrJByEYHl/M70AqtM/wa/p1rtohrgrxNphJbs6k28O
         sfbffGwwmLb8bUoFXUs9XUDz+h/RbM+12M3EHOEAVoGg2qWpHNwL2N29DtLK0OwB8viY
         WCpXLrI8TuB7ldtedikgdSZFa6tXhNDA7eKCcFG30vlp7YKMrdKg+FVEb/6KJ1ET0tR5
         /WvDWDtZ62w5HfFOHoIxYuzm6a0YIphZ1PYhT8vXpI4VnnnYmvLwberP4VWM9s8x5euH
         ghGg==
X-Gm-Message-State: AOAM532JcMgAk8VSMM188mw3cEicjw4xi+V0KDlFLVO0Qa0obb3HC8MR
	IrJK736u2CA/ZLVfzyQs2zSzZC8SPgxprw==
X-Google-Smtp-Source: ABdhPJyk6ebShuSTV1/Q5cVzDmoFP2NCnMoCHGwvY0MhfpEF3h+7b6/EUlW5vRxX6hA8hM4HAVl+fQ==
X-Received: by 2002:a9d:75c5:: with SMTP id c5mr18618113otl.334.1617551766232;
        Sun, 04 Apr 2021 08:56:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i4sm2609848oik.21.2021.04.04.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 08:56:05 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm fix for 5.12
Date: Sun,  4 Apr 2021 10:56:04 -0500
Message-Id: <20210404155604.712236-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.12

for you to fetch changes up to 0c9fdcdba68208270ae85d39600ea97da1718344:

  soc: qcom: geni: shield geni_icc_get() for ACPI boot (2021-03-11 20:22:05 -0600)

----------------------------------------------------------------
Qualcomm fix for 5.12

This bypasses the, recently introduced, interconnect handling in the
GENI (serial engine) driver when running off ACPI, as this causes the
GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard and
touchpad.

----------------------------------------------------------------
Shawn Guo (1):
      soc: qcom: geni: shield geni_icc_get() for ACPI boot

 drivers/soc/qcom/qcom-geni-se.c | 3 +++
 1 file changed, 3 insertions(+)
