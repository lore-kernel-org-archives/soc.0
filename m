Return-Path: <SRS0=Tjl3=37=linaro.org=bhupesh.sharma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E5FC43217
	for <soc@archiver.kernel.org>; Thu,  1 Dec 2022 06:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3462FC43470; Thu,  1 Dec 2022 06:13:51 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63B14C433D7
	for <soc@kernel.org>; Thu,  1 Dec 2022 06:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63B14C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id o1so917265pfp.12
        for <soc@kernel.org>; Wed, 30 Nov 2022 22:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SB3gC4suE9YPw/HdIjJak1brWf67yOqLimdACoUU9r4=;
        b=CzzVq06oV7Pdxm/1ruc8JF0zzekOTzYP98yiYsArXG4hAprtojgD1rgvlF7u6Ap4GC
         P+hviaXrjREUUyvWixb/y6sXenDhv5tVCXf0jygUC5lXfe+NtJiF9isMpX2HMbbLkXj2
         XIgv5vIcmF1vZEyzHZkK4N9poPoaSKepXnZJftMHgpc5AuAQcKC8vydRClVyoijwJIN9
         ma4jNbnCn7AANmoIty6/ZWFfAcci5Ms9yZtOOu3ZY7utKNM50PJbqeqV4icgG9evdVAT
         nLbzBlbk0mD1HZHAoNwMBI9kLJYa/YLOQ2PkP/p4Dj8S7Z4IR7nTJNvmImrqpMhI1wf6
         mknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB3gC4suE9YPw/HdIjJak1brWf67yOqLimdACoUU9r4=;
        b=F1KAAdLRtQ75mv1a1NG2vQKHDuLr7n6RbTjXmUOW0UJv8kxTzxDak3WgojypXJqlEg
         zcg/nVzQonrmUraFdLQBeWX+6pwj5aWlUFxE3pbqZNyTGzaGn+3y2HmH+WVcGfd4wqoZ
         tvae1MnBzHpiz3H4Nddw2+YJYZ2kkhdKa6qjzKTO5zirXPiXFmiwPtFThTc64whspMSS
         P+33zMLHlycQIiWUQW1x35z7WwTnIOxxcVXw7qLi4HgnKT0g9jG4l5nfv6Dxs4rnoTR3
         szezteBnV0P0oV3fRGHhxTMLFr7r5hJ6V+cavQmN09xOA1rTu2n0Ds22BUXsa4l2PfWB
         7nXg==
X-Gm-Message-State: ANoB5pnELBvCsyI1BivQdETmAUSijDBRxh0TthFUcx8L+hnzymT3NUHy
	zLDpyJC67FU14UqITCGKRvS1s4ue8kp8jw==
X-Google-Smtp-Source: AA0mqf4plg+guamA2LI4DZbHwFCpvgc9DXFjNXyQOAYKUa1x3avYx3FABXx0z730eyAKI5iPILHTMw==
X-Received: by 2002:a63:1f63:0:b0:460:ec46:3645 with SMTP id q35-20020a631f63000000b00460ec463645mr59618735pgm.92.1669875228613;
        Wed, 30 Nov 2022 22:13:48 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c61:2814:3292:e917:48a4:d54d])
        by smtp.gmail.com with ESMTPSA id a10-20020a63d40a000000b004771bf66781sm1829753pgh.65.2022.11.30.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 22:13:48 -0800 (PST)
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
	a39.skl@gmail.com,
	krzysztof.kozlowski@linaro.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 Interconnect driver
Date: Thu,  1 Dec 2022 11:43:35 +0530
Message-Id: <20221201061335.2440853-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Qualcomm SM6115 / SM4250 Interconnect driver.

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
- Rebased on linux-next
- Depends on the SM6115 dt-binding and driver patchset, which can be
  seen here: https://lore.kernel.org/linux-arm-msm/20221130103841.2266464-1-bhupesh.sharma@linaro.org/ 

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..993284676c0c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1336,6 +1336,7 @@ CONFIG_INTERCONNECT_QCOM_SC7280=y
 CONFIG_INTERCONNECT_QCOM_SC8180X=y
 CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
+CONFIG_INTERCONNECT_QCOM_SM6115=m
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=m
 CONFIG_INTERCONNECT_QCOM_SM8350=m
-- 
2.38.1

