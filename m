Return-Path: <SRS0=CdpJ=KG=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A12C433B4
	for <soc@archiver.kernel.org>; Tue, 11 May 2021 19:00:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0BE6611C9; Tue, 11 May 2021 19:00:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBEF613C3
	for <soc@kernel.org>; Tue, 11 May 2021 19:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBEF613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pl1-f174.google.com with SMTP id v13so11276060ple.9
        for <soc@kernel.org>; Tue, 11 May 2021 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1QNHHOT5/rxXgeedYeM4a2djt2oyHaG/EvVoGjfBbRg=;
        b=D3kd2aIiWfYa0HxlSPzNMFMD3VGm3LnEUf6eY+QgayueEVxDerAIkdgkipO8BqN5pC
         uffJ3xpxLMxd1UIdgb4e8TdhqV5jLiwVrLXS5YLWP2TrLrkeWreFYYMXXdqgwamzBWL8
         4nocSvHZNIGzTmudeIAgJ8KmhT13W5wRWMAnOkCC2Pmh/PhM5GabwejS9hMGILlHwtxJ
         vfNTlz7gHjlBbVE9SAP2UAka1LBDjPt8ZDuAPmvnQUAJ/Ta5a9mGxij1MRY7bFNKSA7y
         61nlQPA2MhZMUuRqrwN3PqYIViB0HBdTNnk1cYMWMmnWv4+snLtB7PQDdGN0aSon7x9G
         LD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1QNHHOT5/rxXgeedYeM4a2djt2oyHaG/EvVoGjfBbRg=;
        b=Aj0Kz4yM8Eds1+hFIdKUvybZoJvohOfv6c4B3cVxXPcgNfDVMzgCLbnvsOCdeLo4oh
         GH6B7Tuqvl0UbhzUaMeETjdU1nZUegfzki9j2hKGqeMracLVRMjixJ5U1O/VFMizMKSY
         Zb1LIqkVwXlNPeerMCQvBLt5vq4D3/hyXQ+d4BnEJjgqJPDgeA7ue6d6hd3+Rwdr//DV
         dzLTPTDYknVDyYqUNu4mNwrswOCtLnzgaZIcONjwcCJtSFLXQeMRLXte6AXegl/vh2vT
         NgmTd+IWvz01KZUg5Fx/V9TJHRvdIo+rJrcIsACC49pHL+d4bjwNeBIo72dB4UDYhvGV
         prJA==
X-Gm-Message-State: AOAM531YGdbL50J13m4OsPKT4Ur8pv0roIRii4NBjNzXfkOw+Sc+Z+1m
	OU8LZjQiXXF6gdgE5VgMib9OtbnBYPAVEQ==
X-Google-Smtp-Source: ABdhPJzpcayWkE4ql/OVzinUyg2mbTDgXAO7HnrWZLHKN/8hsfMISsWcximIO+6a+riDpVoMJcUaeA==
X-Received: by 2002:a17:902:d491:b029:ee:5aa3:7d57 with SMTP id c17-20020a170902d491b02900ee5aa37d57mr31433298plg.26.1620759655705;
        Tue, 11 May 2021 12:00:55 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
        by smtp.gmail.com with ESMTPSA id p11sm14954494pjo.19.2021.05.11.12.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 12:00:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
Date: Tue, 11 May 2021 12:00:54 -0700
Message-Id: <20210511190054.26300-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
will now act as co-maintainer.

Neil is already doing lots of the reviewing, testing and behind the
scenes support for users of the upstream kernel on these SoCs, so this
is just to formalize the current state of affairs.

Thanks Neil for all of your efforts, and keep up the great work!

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..1f64aa7de84d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1618,8 +1618,8 @@ F:	Documentation/devicetree/bindings/sound/amlogic*
 F:	sound/soc/meson/
 
 ARM/Amlogic Meson SoC support
+M:	Neil Armstrong <narmstrong@baylibre.com>
 M:	Kevin Hilman <khilman@baylibre.com>
-R:	Neil Armstrong <narmstrong@baylibre.com>
 R:	Jerome Brunet <jbrunet@baylibre.com>
 R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.31.1

