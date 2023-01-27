Return-Path: <SRS0=QMNa=5Y=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBC9C38142
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 10:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BD70C4339B; Fri, 27 Jan 2023 10:59:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50898C433EF
	for <soc@kernel.org>; Fri, 27 Jan 2023 10:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50898C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id fl24so3175680wmb.1
        for <soc@kernel.org>; Fri, 27 Jan 2023 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyx4vfyj5nu/u1Po9IGUR29avEnBx5AnQT3m1xKjVu0=;
        b=QepVfE39TZNYo9tVulpHd3SA1DkTfbJOA3N23Yw2yDBkN+oAWevQ3Zy2znn88IFwnG
         9dNOlbxLhInpUhO7uUwDWz0eKSv9icZfUaMore7F3kI4oI5rJhctMffM0orWeVvmUakq
         6rofYN16/KI3DZ9SZ03U0UzVcwBLw+5eqG2WAkvfM1P8A9PPbihRgvtf2N1Q3XhnujSg
         IM6gHwGvl4MTaABOMMG6N4DgjqRMrOU72eQ0bC3F5rJQnQRkA7hjezdIcL1OReDBIWaR
         JGmI7GvvINu+FvZM7eNsThU1nNgASLSeNeJGy53vA9mS5XuNCM27EioIqu2Rgi7YZz7B
         f9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyx4vfyj5nu/u1Po9IGUR29avEnBx5AnQT3m1xKjVu0=;
        b=CDno8opFlQByII5mr5uiAlUxKGh+WJM3Pmb0gbhsbb+Af9mwK/QwqGoP8lTS8HGl9E
         LbUU3Mny0e0oWTQ7n56Desc5RKmXNS/iByq1CBtfPUuMjrn9fh7FknPW6Rq3IYkcUPnx
         be5MQL4xRs4YHS5SvYo3I2VOKHqVHpnUT8NobyP36QsQZKaMawM1zrFJLl18MBs+e4ft
         Cy4RXhDy95ERgK5DqlSiaDFNWLe9QBU8MYQZTTWhEy/OMy+eVfpJ9TpqstFQVkjdpTrx
         pEDS+B8rplllE5JxymMVy7GADvW8RadTewWqS7Dq3KWjK43EbGrK1CJopU89RZk2yTcL
         4KVQ==
X-Gm-Message-State: AFqh2kpbPid6p9Rzy59ovzg8DjzrzNJh+bCCbJbXEdUqCWrMk1tCE+k2
	gh2ZfR0eNjDYgev669KACjkZ7w==
X-Google-Smtp-Source: AMrXdXtwivjRPq/b7n7Kn232v28RTtcW2gNt8ghTdi5/saSeBkcbBlc+tl4SknBhbgB+co1gh6ca7w==
X-Received: by 2002:a05:600c:3b9b:b0:3d2:392e:905f with SMTP id n27-20020a05600c3b9b00b003d2392e905fmr38391793wms.24.1674817178564;
        Fri, 27 Jan 2023 02:59:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ay6-20020a05600c1e0600b003db00747fdesm7447827wmb.15.2023.01.27.02.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:59:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: amd: drop inactive Brijesh Singh
Date: Fri, 27 Jan 2023 11:59:35 +0100
Message-Id: <20230127105935.99174-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emails to Brijesh Singh bounce ("550 5.1.10
RESOLVER.ADR.RecipientNotFound; Recipient not found by SMTP address
lookup").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35385df2302c..028df656196f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1099,7 +1099,6 @@ S:	Maintained
 F:	drivers/dma/ptdma/
 
 AMD SEATTLE DEVICE TREE SUPPORT
-M:	Brijesh Singh <brijeshkumar.singh@amd.com>
 M:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
 M:	Tom Lendacky <thomas.lendacky@amd.com>
 S:	Supported
-- 
2.34.1

