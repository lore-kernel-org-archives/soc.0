Return-Path: <SRS0=7l46=JQ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDC0C433B4
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:21:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 641AB611CE; Mon, 19 Apr 2021 15:21:45 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A1B6113C
	for <soc@kernel.org>; Mon, 19 Apr 2021 15:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A1B6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f54.google.com with SMTP id v19-20020a0568300913b029028423b78c2dso24270618ott.8
        for <soc@kernel.org>; Mon, 19 Apr 2021 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
        b=lmsoshBWCDGMUKrNLB9AlLYCqcSmgLNDLL5NNR7cwYziJT6id/hqIJtURNpv6/t7gp
         9m4UtjONinFZkMm+YVacJ6efnbcDxgkrtFvQwmu6vaNRP4jhAy+IiyCpYYsgJ/bti/gz
         ZNs7gDhFXXNEk2ABZVcBqgbSnP3frwgkrBTVkeZbtlI+tQzSkTLz3EOiZtVxU5+Mx0vE
         7e6SNQ9Ci7nhSvRgMuviMAVJQErhLDBUueAFTcgP1EQHE36JhnDEIHOcH9k4QB3K5+tR
         Vk+yJusQaNXgTfGN7mYmrzZ/JMl/FZbdj5DqoJrWjfp4i/KXpyDXe3O3P8EfakPmngqz
         E9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
        b=Rp7pVmbyk0nPg86W+vKtBrvI8GBtkTWpa+AvoVzjVJmgURW8nvJ/cP9pdxci9YOQm2
         9lcrl/0whf4kOtNL0ZW0qHazosbeK7PKWSRy3VipshrNn/6OiILjBERmxa6/luYbJmez
         qfX2aBNyZ8BO0xWng4IxtkToxvDoayw08mk1lCVQwUq10Xlr2nFfY5Jg3NcSnDcxV5AU
         SuzLzKhlxtj9lo/BiyXcLxzGxK7OCcZnWp5WZP1ngk3DLXymQAIp856YfnD7TmKHDWEw
         6SAuZ6RadzRV81CcY9av9TwCBBOkp7R0Y5wL+f+0LWL0RJLan+x/IeIgwFu6JSYJkkPq
         cTig==
X-Gm-Message-State: AOAM531hpxFu63Dk0clY4RPBGZZUBxXWUFkM+yo0C7hWtGWMyNuZnqHv
	qHJ3mo7mfAU5vWqp500F6911lA==
X-Google-Smtp-Source: ABdhPJwvTvnVMh2WJXmsPNvKt0j8k7ttDwSes8duCvTdlZhTFqE07cJvD154/leTHrPv6Rh2ogPGxg==
X-Received: by 2002:a05:6830:1f12:: with SMTP id u18mr8412677otg.132.1618845704569;
        Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t19sm3622469otm.40.2021.04.19.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
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
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.13
Date: Mon, 19 Apr 2021 10:21:43 -0500
Message-Id: <20210419152143.861934-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.13

for you to fetch changes up to 7de91b665600c96b1fc66c4c5a679db275c0c674:

  ARM: configs: qcom_defconfig: Reduce CMA size to 64MB (2021-04-13 21:21:22 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.13

This enables all the hardware support currently available for the
Qualcomm SDX55 platform in the qcom_defconfig. Due to (current) size
limitations these changes are not done in the multi-platform config.

----------------------------------------------------------------
Manivannan Sadhasivam (7):
      ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
      ARM: configs: qcom_defconfig: Enable SDX55 A7 PLL and APCS clock driver
      ARM: configs: qcom_defconfig: Enable CPUFreq support
      ARM: configs: qcom_defconfig: Enable Q6V5_PAS remoteproc driver
      ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
      ARM: configs: qcom_defconfig: Enable GLINK SMEM driver
      ARM: configs: qcom_defconfig: Reduce CMA size to 64MB

 arch/arm/configs/qcom_defconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
