Return-Path: <SRS0=D+wk=34=linaro.org=bhupesh.sharma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F38AC433FE
	for <soc@archiver.kernel.org>; Mon, 28 Nov 2022 20:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E458AC4347C; Mon, 28 Nov 2022 20:09:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D732FC433D6
	for <soc@kernel.org>; Mon, 28 Nov 2022 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D732FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id 140so11594571pfz.6
        for <soc@kernel.org>; Mon, 28 Nov 2022 12:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ef8A7O2qxzSTmhR856PPdqttVXha7QPYjhgtijajRFA=;
        b=SIZ4d1BnQA8JU7BstQ4YLKZaDCIiOstCz6W5e4A3fNCKMrfKTx67tF0CgOS0XSFf7o
         JVwCqSoCtWg64tpkP/2KWQQQ+V69punEUGw2gV0+yqFHjEa/9Lo6xOGJtE4DpU+clX3w
         mWElfuZd7I3QnxVYaBUtlCb6s2iVgEkATfyCc/M6zt8TyKQkCKP3Cn4iI/X9vXA1E0/A
         n1u4Fm79OhrfuV8DPQ+SQ5AhjFDDs032y3/umeyxX4HELHd3Mr/Fx7y6IxxrxYZKswbf
         ZHYhpU+ECRk+OUNIEQSzWuoOnX2v0YwRl/FRIuH3JByKvcJB7np3mEQNp3WBbz07yPoh
         I5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef8A7O2qxzSTmhR856PPdqttVXha7QPYjhgtijajRFA=;
        b=7pUou8TkE/60ZI64qE8QKDpGyfUDacGqZn7zC+yG+GDzh94Rk4Fg4PwUkhITZNdVxM
         50mzMdRQ7QDWEqWwuZe1zNJbUDaSAHAGQwNpr6CYnXuxjTDpSQ/yKiAYCnA7faTcXwTp
         nDLE4aZqMb3eF5GAUNZ1w7gWgO+8EZHeHvOdJ6HZPpdcQmIeLeosKrjTX1bJyzYf7s53
         n9asTicjmhAIBR1ARyVsAETADx/YZYZi0Y9FQqapof5pg04ws99eKUyu7mdu8SZhm3mq
         A9cxESXKl0Vg9hQza8y83s3GQf/y6ZJf2FcgJ0eUYnNo5i4EYs1BaMZEoRgobvC+ACqf
         N0YQ==
X-Gm-Message-State: ANoB5plqkN+4lJbXUtp7/qxPzEEhC87I64JW+37VoCCIbkuWxHIhrXcQ
	cLXt5MFVIOaClYFZPry6/KvypA==
X-Google-Smtp-Source: AA0mqf5GWz2T7utKo5DSWCX6D1NH6Ua6s1PNODl5UGZhNdP31g+TwJcFYAlRAKjU5zfTWyPKoEKmeQ==
X-Received: by 2002:a63:4910:0:b0:478:27a1:8602 with SMTP id w16-20020a634910000000b0047827a18602mr4688389pga.9.1669666143166;
        Mon, 28 Nov 2022 12:09:03 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3b:2d41:78ce:bf75:900:30f])
        by smtp.gmail.com with ESMTPSA id m16-20020a62a210000000b0057564323987sm473113pff.139.2022.11.28.12.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 12:09:02 -0800 (PST)
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
	me@iskren.info,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl
Date: Tue, 29 Nov 2022 01:38:34 +0530
Message-Id: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Qualcomm SM6115 / SM4250 TLMM pinctrl and GCC clock drivers.
They need to be builtin to ensure that the UART is allowed to probe
before user space needs a console.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03b61f846a0e..851e8f9be06d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -560,6 +560,7 @@ CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y
 CONFIG_PINCTRL_SC8280XP=y
 CONFIG_PINCTRL_SDM845=y
+CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_PINCTRL_SM8350=y
@@ -1106,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GPUCC_8150=y
-- 
2.38.1

