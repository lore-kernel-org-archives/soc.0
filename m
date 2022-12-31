Return-Path: <SRS0=K5CN=45=linaro.org=bhupesh.sharma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0066C3DA7D
	for <soc@archiver.kernel.org>; Sat, 31 Dec 2022 12:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA53BC433F2; Sat, 31 Dec 2022 12:49:04 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 101D9C433F1
	for <soc@kernel.org>; Sat, 31 Dec 2022 12:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 101D9C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id w37so15687701pga.5
        for <soc@kernel.org>; Sat, 31 Dec 2022 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8DXWGlRQXwEWsvjY0axdM/4CSvGdmhgjoXDmsx5XAE=;
        b=GKHfIO5/zPApXtAUOUA0aOVIZUwLAURpCXBHgDj1NR1eDpPZ8kJqGc9kYxtnJ8J6n0
         G7VioD9KKPNReKRZffb5YWGKGrwy7MKl3bL1EccIOeRJVGChBnOjTxOTdKusj1dAVoka
         lOL7EYDnoTSZwvhuUp0IvnnoufI2Gr390XZrZpzt8yzHrOuSQG1e2YC56zmxhAYmVTkA
         E3+HowNHFYPE/naF/0ShWsCbZHz2o5P478U7NMHJ17JVORUMQtc0IwnOS0FdMIDjmkQS
         +eFhB5UlvXPh8sHVCVIEuVaWIp38bOx52PZLr62+JWbPvPc/wGIH1Wbbq4N/oAOAGnp4
         csUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8DXWGlRQXwEWsvjY0axdM/4CSvGdmhgjoXDmsx5XAE=;
        b=YUxk+GrtfsOEyeax/VtpHcKdh1thdfTbYl5bw4bXH09hq0FtZFzU1Js7is1RAhymb7
         cRNDW1ph9WtvoLO5AuMwuMgQxrhWkRK+/6BxW4fqE5+1a9FU/x8pMneyNCvhNlHY7K/D
         xHSAio1pWAIjpeYlqBENC8gWymEIIqxEGU0OamEiTR+3eYzwSqY/SvIqCQud4+QKOXen
         hgQ+8B4lei4Hco9mv2DGbJdsCBG8kEoGbgiUKRxspC30AIB1ZXRPBGebz4ugBBodZltu
         KEJl7D1HLoBn7BmfiFlIQ8IndPA4Kliarl5DjRYOJFtNulMQ2JqrPTONxQFAeJyJr92v
         mMGw==
X-Gm-Message-State: AFqh2kogjdoBXgpzIIzlxDZD5t1D9LMgBC9AHxexMIOQDGwhlrsiFlGa
	Cm+d1GUfGKOUVMgOnpIZ8Q//Xg==
X-Google-Smtp-Source: AMrXdXt4c0FpjWbTrXvCfeqQQBQwRmV7yv8JVygcOx12CA48lg1ae5I7PrwtSe5VDyzE/rqRXF7cSQ==
X-Received: by 2002:a62:b619:0:b0:574:3cde:385a with SMTP id j25-20020a62b619000000b005743cde385amr32875759pff.32.1672490942302;
        Sat, 31 Dec 2022 04:49:02 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id r29-20020aa7963d000000b005750d6b4761sm10337204pfg.168.2022.12.31.04.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 04:49:01 -0800 (PST)
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-msm@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	agross@kernel.org,
	bhupesh.sharma@linaro.org,
	bhupesh.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	konrad.dybcio@somainline.org,
	catalin.marinas@arm.com,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm EUD
Date: Sat, 31 Dec 2022 18:18:52 +0530
Message-Id: <20221231124852.3283597-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the EUD (Embedded USB Debugger) block is supported on
several Qualcomm SoCs upstream, enable the same as a module in
the arm64 defconfig as a module.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06da..c43aeb936d9ad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -922,6 +922,7 @@ CONFIG_USB_SERIAL=m
 CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
+CONFIG_USB_QCOM_EUD=m
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
-- 
2.38.1

