Return-Path: <SRS0=iMD+=LI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ED1C2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 22:37:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1246A6124B; Mon, 14 Jun 2021 22:37:30 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAED861350
	for <soc@kernel.org>; Mon, 14 Jun 2021 22:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAED861350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f169.google.com with SMTP id t40so16066266oiw.8
        for <soc@kernel.org>; Mon, 14 Jun 2021 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCJ52grF54rdbIjeFuKyZZnsyoX/3BIGPZ8n4IO8+EU=;
        b=yVdyGuqZ3P2THxRnUH1NVeJNDitDPrGgm6/asHmu4uKSu9CU8uueBcO1jESiTllD9n
         HBMLE5liDKsxv8JzRnN0wkk1Qi4rv4F9/AVmlZeUX8DYnHkqEcTh5OiOfcn66WTYOCe+
         Q+YZvAKHeb19iqenhITp3YUcGjtZIK2XB9zygnJcwNR/Y7TZ3lPrw0JAri6ACTHOJrid
         NKSXnH0jvLCVcBI7wwJTr4imHdMc/GJvKAPGXD9PDhxq5vkZz/Arkg+IfgpMTSCSUm1u
         6NS1cFCNE9AmgHpDyAr10QchJsI8+WXXVhXz93zlaHK1Upgfd5ReReMqOOgIiGlO1PZh
         i1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCJ52grF54rdbIjeFuKyZZnsyoX/3BIGPZ8n4IO8+EU=;
        b=cT7wxpnOkTSr53n7UEBGI2hHVrDgffcVlJ98m3jzRsj00xGET3Q2Ff2FcZb8GHqx3w
         amKbQDv2mKNq4LokDfyCBymSfmgwF34KS8DKfQd39i3sjkinwS934dtG/lb3NuwvmTw4
         eQTpOaY0iAfT4kexuDmAFQWue30iwCjsc5n86RQL3/oIO5m0dZWUORfpJybi/pzRFr3w
         fZ1ESAG9ZR08Oreuotc9vofw6PK/afCCuOUbpEUYOk/BE2rXvYCubsWD3gmetQ7ccVzK
         8i5WtkEKDHtVngnAvoMTWJw5So4vTFOnlZws57e8L2eVNgr5gEZpAC3oR0Kp+3ocwXks
         4k+w==
X-Gm-Message-State: AOAM530pV0sV2NbVrxYHf9XSwyn3svWrjWrqx8OuCS24nUjnwWj9nQl3
	MKJcKwDqo/Nq0PBaqHhz8mtmQg==
X-Google-Smtp-Source: ABdhPJw7GgHFPNAQq0T/ibBoT4T+raATRbZLLGZbjyCGm09WZ4aFwCM/2lFR0VaQmOeVGzbMJ3/Fng==
X-Received: by 2002:a05:6808:1511:: with SMTP id u17mr938076oiw.53.1623710248975;
        Mon, 14 Jun 2021 15:37:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14sm3640590oti.29.2021.06.14.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:37:28 -0700 (PDT)
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
	Martin Botka <martin.botka@somainline.org>,
	Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Lee Jones <lee.jones@linaro.org>,
	Robert Marko <robert.marko@sartura.hr>
Subject: [GIT PULL] Qualcomm driver updates for v5.14
Date: Mon, 14 Jun 2021 17:37:27 -0500
Message-Id: <20210614223727.393159-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.14

for you to fetch changes up to 82a6cbf007648e2c07c29a133cce060fc30aa48f:

  firmware: qcom_scm: Add MDM9607 compatible (2021-06-10 11:26:45 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.14

In addition to fixing a kerneldoc issue in the qcom-ebi2 driver this
populates socinfo with a range of platforms and PMICs and extends a few
of the Qualcomm drivers bits of support for MSM8226, MDM9607, SM6125 and
SC8180X.

----------------------------------------------------------------
Bartosz Dudziak (2):
      dt-bindings: soc: qcom: smd-rpm: Add MSM8226 compatible
      soc: qcom: smd-rpm: Add MSM8226 compatible

Bjorn Andersson (2):
      dt-bindings: power: rpmpd: Add SC8180X to rpmpd binding
      soc: qcom: rpmhpd: Add SC8180X

Konrad Dybcio (2):
      soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
      firmware: qcom_scm: Add MDM9607 compatible

Lee Jones (1):
      bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'

Luca Weiss (2):
      soc: qcom: socinfo: Add more IDs
      soc: qcom: socinfo: import PMIC IDs from pmic-spmi

Martin Botka (3):
      soc: qcom: socinfo: Add missing SoC ID for SM6125
      soc: qcom: smd-rpm: Add SM6125 compatible
      dt-bindings: soc: qcom: smd-rpm: Document SM6125 compatible

Robert Marko (1):
      soc: qcom: socinfo: Add remaining IPQ6018 family ID-s

 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  2 +
 drivers/bus/qcom-ebi2.c                            |  4 +-
 drivers/firmware/qcom_scm.c                        |  3 ++
 drivers/soc/qcom/rpmhpd.c                          | 21 ++++++++
 drivers/soc/qcom/rpmpd.c                           | 22 +++++++++
 drivers/soc/qcom/smd-rpm.c                         |  2 +
 drivers/soc/qcom/socinfo.c                         | 56 +++++++++++++++++++---
 include/dt-bindings/power/qcom-rpmpd.h             | 21 ++++++++
 10 files changed, 126 insertions(+), 8 deletions(-)
