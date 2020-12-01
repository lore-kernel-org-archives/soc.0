Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70DBC64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:44:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 710762080A; Tue,  1 Dec 2020 13:44:01 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F0E20770
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ZKQNqj4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F0E20770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f195.google.com with SMTP id w6so1155047pfu.1
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QhVjwYmrLBjTere/8qkNqVKV4ikj/p2zvRp7BGZNQtM=;
        b=ZKQNqj4kph80u620UibIsXqnoxPNGtFGOt3TTEBC1XaRy09V888raF64Bhtgz6sOrk
         /xsiR+FATTTTccnyGAELk8Rpj6AtHWRWuMh2AfHFqkq5kWkU+ulQ/TWjrrDD6s7tRalu
         qw2CkzHrvL83jj/ehKW3ddp347z7u5c7ZQH80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhVjwYmrLBjTere/8qkNqVKV4ikj/p2zvRp7BGZNQtM=;
        b=P/vL7N1rUeZKI83pnWUaTx/uEsTULAW87vBI3LrDGhIXB8Ygw+ZNfyzYB1p39S5vtj
         DP5twNe+inxeNVx7DkxvuqDlWAPG5Dz7l/oXYanpYhnVvWyRjrOWOcokxUikGHsNb6Oj
         9L0/78wjhEe4HUOcRcom/20fYVp7P4Mn2mJjutoUeDUJ2IbMhaRxAQe9XFYFJXZa9x5/
         YARPzNAIc9YWZ9g2lGCr6mXSmlHEYBcbKTmKcmfB9okRjfu2NSlEZuN4sKfrMStxsJHo
         sDGbmEOyjexrLz57pXZAy+n/0cm5/tPM3t+/S1a7hXFTO2p9DEksxt1+C63+ev1GtGmv
         8E5g==
X-Gm-Message-State: AOAM531tFeYfYWVZW5N9lpIOIGPQwhVbF/lzlSRtypMqo5aRdGgGOpAn
	qUOfGdgWjNXxLZ+DArByJjBZxA==
X-Google-Smtp-Source: ABdhPJzSqLPkSH7u9yo7acIkChjMg0tnTuSVTqrelaL8V1sTewnWOzC6QPFtGj395NrAKbryp/7J/A==
X-Received: by 2002:aa7:8055:0:b029:19b:694:34b2 with SMTP id y21-20020aa780550000b029019b069434b2mr2601424pfm.2.1606830240351;
        Tue, 01 Dec 2020 05:44:00 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:59 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
Date: Tue,  1 Dec 2020 22:43:28 +0900
Message-Id: <20201201134330.3037007-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the smpctrl registers to the infinity2m dtsi so that the
second CPU can be enabled on chips in this family.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
index 02adb9fe9d3c..6d4d1d224e96 100644
--- a/arch/arm/boot/dts/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -13,3 +13,10 @@ cpu1: cpu@1 {
 		reg = <0x1>;
 	};
 };
+
+&riu {
+	smpctrl: smpctrl@204000 {
+		reg = <0x204000 0x200>;
+		status = "disabled";
+	};
+};
-- 
2.29.2

