Return-Path: <SRS0=SKgf=JG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077EC433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 16:20:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 397276103E; Fri,  9 Apr 2021 16:20:04 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB616105A
	for <soc@kernel.org>; Fri,  9 Apr 2021 16:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB616105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f54.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso6266519otp.0
        for <soc@kernel.org>; Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
        b=aVZpBRiKxfu6o8bbFEYy1QbykTLEAErhJvGuCGgjOX3Fa2GEwD26OMKFfc8NiMxtA3
         k2qp8MDK5mH4lQcx2rXxcAwcZZ9iZuMSE6s55NZs3EYvWxk3xqYdosBonhAsboVhQk1l
         vK7AG4OdJsZbJXeXrxE4Jhe8vnZOhrydv+yMeFdohKtekcWWCSZaWcZDFxcrPfuJcUT9
         SOw/jdFcwG6ypFIGJ4w7ODC5ednYlQCDiqgQ26Q/DBoGDJVoLiIqFOxZH5z1YLzpExop
         T7yicxidbYcFTjxVzS10SWgQq2Y+jwjvrf0Y1TxTw0zdl+CsErSQOkDZ1GY7uK7TqDxc
         0wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
        b=mFcLYSJv4zvDBtlXXXcf2Tc1x818Ex8WHj+BBqNnDrbqkNXYApyFbLHhJkql1QkCne
         DTqpTuF4aBkAvU1WfzDy/AAfTYyy6SeDw1ecV4bx4MhjlZkFDC3X+0s2aXqcDRNbgGm6
         vY538wMa02Lq7qobJg0AEFH4ZVhbjphWQcAgDBqbD9hp+nm4BYxkBds007UB/bdVmcNi
         i8IsiVs2Zc9SGOtHx+kjgr18q77UVqJLa4z/YSZ8jl7Fv9BTuVBiZPi0L20yOrlzfUT3
         tP1EdF9UiIT8Zda6y60x5IsxpJX+BsMFTVck9SokGby5wwCM2XuxiPwtPYCqJmaHZmtX
         QPGw==
X-Gm-Message-State: AOAM530iMizviD9eDucmEcV+TO0a63Ub8vOF/tWl2Ml6q+URSmfEZ6tb
	dyDDqqJ8AK/eoizyR7Q4o+RxyA==
X-Google-Smtp-Source: ABdhPJyDIHwsloXBmHm5h0+dFlF4DCbzbUar8r1DMnB35mHiyaOrEdxe+e8jsdjUofCoC2sCmRqOWQ==
X-Received: by 2002:a9d:7288:: with SMTP id t8mr13278669otj.132.1617985203262;
        Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l71sm594235oib.30.2021.04.09.09.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:20:02 -0700 (PDT)
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
	Stephen Boyd <swboyd@chromium.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Qinglang Miao <miaoqinglang@huawei.com>
Subject: [GIT PULL] More Qualcomm driver updates for 5.13
Date: Fri,  9 Apr 2021 11:20:01 -0500
Message-Id: <20210409162001.775851-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13-2

for you to fetch changes up to 0648c55e3a21ccd816e99b6600d6199fbf39d23a:

  soc: qcom: mdt_loader: Detect truncated read of segments (2021-04-08 10:28:59 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for 5.13

This improves the Qualcomm SCM driver logic related to detecting the
calling convention, in particular on SC7180, and fixes a few small
issues in the same.

It introduces additonal sanity checks of the size of loaded segments in
the MDT loader and adds a missing error in the return path of
pdr_register_listener().

It makes it possible to specify the OEM specific firmware path in the
wcn36xx control (and WiFi) driver.

Lastly it adds a missing path specifier in the MAINTAINERS' entry and
fixes a bunch of kerneldoc issues in various drivers.

----------------------------------------------------------------
Bjorn Andersson (5):
      dt-bindings: soc: qcom: wcnss: Add firmware-name property
      soc: qcom: wcnss_ctrl: Introduce local variable "dev"
      soc: qcom: wcnss_ctrl: Allow reading firmware-name from DT
      soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
      soc: qcom: mdt_loader: Detect truncated read of segments

Lukas Bulwahn (2):
      MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
      soc: qcom: address kernel-doc warnings

Qinglang Miao (1):
      soc: qcom: pdr: Fix error return code in pdr_register_listener

Stephen Boyd (5):
      firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
      firmware: qcom_scm: Reduce locking section for __get_convention()
      firmware: qcom_scm: Workaround lack of "is available" call on SC7180
      firmware: qcom_scm: Suppress sysfs bind attributes
      firmware: qcom_scm: Fix kernel-doc function names to match

 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    |  7 ++
 MAINTAINERS                                        |  1 +
 drivers/firmware/qcom_scm-legacy.c                 |  4 +-
 drivers/firmware/qcom_scm-smc.c                    | 12 +--
 drivers/firmware/qcom_scm.c                        | 89 ++++++++++++----------
 drivers/firmware/qcom_scm.h                        |  7 +-
 drivers/soc/qcom/mdt_loader.c                      | 17 +++++
 drivers/soc/qcom/pdr_interface.c                   |  2 +-
 drivers/soc/qcom/wcnss_ctrl.c                      | 15 ++--
 include/linux/soc/qcom/apr.h                       |  2 +-
 include/linux/soc/qcom/irq.h                       |  2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |  6 +-
 include/linux/soc/qcom/qmi.h                       |  4 +-
 13 files changed, 107 insertions(+), 61 deletions(-)
