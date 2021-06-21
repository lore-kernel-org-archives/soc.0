Return-Path: <SRS0=OjpN=LP=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1C7C48BC2
	for <soc@archiver.kernel.org>; Mon, 21 Jun 2021 16:50:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D05D6112D; Mon, 21 Jun 2021 16:50:17 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B58860FE3
	for <soc@kernel.org>; Mon, 21 Jun 2021 16:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B58860FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f50.google.com with SMTP id v11-20020a9d340b0000b0290455f7b8b1dcso5448802otb.7
        for <soc@kernel.org>; Mon, 21 Jun 2021 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
        b=Rn08BY9/tYgwbs9DDd8jLwNfj2gQyf4LDzySwhwTWXAbeKIP+wo18+4NObUz/okt6s
         NV/KlHs6rGvDguY4LJjdbXfskE6WEsFQR/XsX7r/KhOvz2pk+oS5FRnCpnICGmj3G1hV
         x2FY8fqhOJ/4m7S2os8EJw67MD9yvxveBcXngBNjSHzNU6g/Z6dRp1rEQoc0jLutvXeH
         g9R7sIlIbcH3flzX0bsGtHA33dwnUEeR6cwP/3lkVgH/AjvyH3NpJ+ljH0ajwLDz/KPp
         7f/qunNM0hserXrYdNjXrwxF0RyNN1EXCS4dk+iOOHnxvbk3JyVln2ceeR3njHfZRR1Y
         hxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
        b=StLh4KltTeckbrvbi9tWapJX8btObN/udr/PWkFSsOs7RwFMLnSR1KT0LQLNN68MgT
         42P170SE9oeeiISn3BjlWPi5s5CYzblgkBzHTtACjIlymtQRynUTnoEtrsoA0ppixlrE
         YdnMFEuJhQnivRJf9Dh3uPyuFZzO926yU4FQNbyOEfBhCRs8RhOzMAOW8lUD2juGdEuY
         oeIwDssoB0wItWUY0/XMC3Q+nE44UuhB+9kZRpMFhPI1QWrpXoWb/m15n9Le+QtewARO
         Gq58XRWhKeZsS+La6RF8eVq7JFYOQ1oMsQ/Wl4Pgo7IlD4Fgmt2TpNi8yV9AJE7y2cqa
         GBjQ==
X-Gm-Message-State: AOAM530Ws8PsTVb08tOS2Hg5Kh2cIOanU7pJ9DY1uLIEQJvg17MQAke9
	HyiMtauI7L+WLIRD72uNM6p1GQ==
X-Google-Smtp-Source: ABdhPJyvKQhJHOmA0cSNzv4OzqARvZ+VxAzloXXJh95f6t6nKTRaotVwmPFGPRaJkBxjih1bg71zhw==
X-Received: by 2002:a9d:346:: with SMTP id 64mr21834506otv.320.1624294216372;
        Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o6sm3115098ote.81.2021.06.21.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
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
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
Date: Mon, 21 Jun 2021 11:50:15 -0500
Message-Id: <20210621165015.943060-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14-1

for you to fetch changes up to 8ae030c34dce4f5764e945b325e8dc4d2adef044:

  arm64: defconfig: Enable renesas usb xhci pci host controller (2021-06-15 19:19:58 -0500)

----------------------------------------------------------------
Additional Qualcomm ARM64 defconfig udpate for v5.14

The Qualcomm Robotics RB3 Development Kit has a Renesas USB HUB on one
of the PCIe busses, which requires the releated driver to be enabled to
provide functional Ethernet and additional USB host ports.

----------------------------------------------------------------
Vinod Koul (1):
      arm64: defconfig: Enable renesas usb xhci pci host controller

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
