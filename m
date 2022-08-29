Return-Path: <SRS0=ug29=ZB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F74ECAAA1
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 17:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF3FAC433B5; Mon, 29 Aug 2022 17:38:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4300C433C1;
	Mon, 29 Aug 2022 17:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4300C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id j6so3057446qvu.10;
        Mon, 29 Aug 2022 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=XY9inKqmVaCLls92mXVTAi16MJ9qjkEsAoCtccx3XYs=;
        b=ZgGzNEuh8kwaXZ7+bX5dJ+ebmYCW2loFE6sB5WfSKPAh4GTFIbpGlGjOH67eiRaX2u
         aXkEuv88e7lf6p0OD0t5p11b9FDMGrXcalkPPPFBGyzQbzHwVK231yH86M7mGh0TDLOh
         iqnqcwUaFMg2oZNtys1ZZfqMmvEN9LqGiLQMNia53E1CxBDLTwsXll4OL8VtmF0ye8fx
         dCGsGsD056uYehjUPiK8YTbyQI8Y9diyDP5oxA+Pcg0SPGss/dBUv8URnzqmYHF7Y39x
         hSFgjZp4ou7JSSFvt99h4kshad4Adz90yFrV1+X2g4iurupXx0lQzY80uOUJcRQVkBck
         DkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=XY9inKqmVaCLls92mXVTAi16MJ9qjkEsAoCtccx3XYs=;
        b=Ev59fatzqpbGsB/7X5RC9Clrt7inRGBKLC1s6bF77va9zObhhbWYZVJyLtP/Z+vo7j
         XEs4BDatn4+Rqp3iDih5LHL8xrK3Hk2gGqdZtGJcwNFj4yZHclO0T1rLUFsGaKbJX0c6
         pW2TTwWJ8EUuKRMlJZMBVKwzqWpfpncm0JAoWrSyfavO2xF521H9n1VigYG6rLIZhALh
         uDuaivw2gUJ5FvR4+krMmk4OT2t9oNAs12ydEFcmclMhI6paUfKm8gsw3mEOkeIlz9UG
         UoYJ/2K8jVNaCUbMe/Qy1y+zWFF2GLQNzcy5mDRiLgQsYJ9rk3jE0NYAHQwD1Dp3TUcb
         B8Tg==
X-Gm-Message-State: ACgBeo0iUdk91NRIgZlpxUD62XJ68OD5VKPgzgXb/ODRZT1DjpI5evW3
	arjorRUM5tEhIUvVzYjXXxI=
X-Google-Smtp-Source: AA6agR5EG+2/B/XlRzJpQwEhw5REbLQvUei/i1it83b7qs9gYftcNmpsLIg8nZePBJcTxOEp3g8dXg==
X-Received: by 2002:ad4:5cc5:0:b0:499:2b4:8909 with SMTP id iu5-20020ad45cc5000000b0049902b48909mr4832773qvb.127.1661794717714;
        Mon, 29 Aug 2022 10:38:37 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006bb7ccf6855sm6543583qkp.76.2022.08.29.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:38:37 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	krzysztof.kozlowski@linaro.org,
	arnd@arndb.de,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com
Subject: [PATCH v2 0/2] arm64: Kconfig.platforms: Group vendors together
Date: Mon, 29 Aug 2022 10:38:27 -0700
Message-Id: <20220829173830.3567047-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow up from:
https://lore.kernel.org/all/20220712164235.40293-1-f.fainelli@gmail.com/

such that we have SoCs from the same vendor grouped into a menuconfig to
be visually nicer and assist in selecting the specific SoCs.

Florian Fainelli (2):
  arm64: Kconfig.platforms: Re-organized Broadcom menu
  arm64: Kconfig.platforms: Group NXP platforms together

 arch/arm64/Kconfig.platforms | 52 +++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 19 deletions(-)

-- 
2.25.1

