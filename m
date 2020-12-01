Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80674C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:44:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E6AC20770; Tue,  1 Dec 2020 13:44:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CA22084C
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="vpT3Woau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1CA22084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f51.google.com with SMTP id h7so780926pjk.1
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mfswc8PEaRtag64wvufOaanDCqQevd/LVNeXXXGVpMk=;
        b=vpT3Woau4ZWljZ1nCO99FgLu7buS9p6fLSz7J6xJT+ocVzNUie5zI31MXRs+6OCZ1R
         jV2WVqfd05kEbhnikrSi8OI0ATaYmS94opgt+7zLoS4r+gDlUtk+EA9gVLOkFBa9rsO8
         n5vU2AioWdAkQRqtivql3S5ah/G9lzjQ1eZes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfswc8PEaRtag64wvufOaanDCqQevd/LVNeXXXGVpMk=;
        b=b5ESoD7eMKGocmJvsx3NYLwKAieNQhSgmsVWr1jpFVwyV+BV42JBVyP3kwmGWYqsy7
         xy0OKZnx9/jeF19Y1/va5IP/jtdZZZIgLCdDdrJWjqkjBj+tjg4XeTNQFSvL03nsC6Va
         yEWvvgVYD3C19FoSQTAE6h6kXbrsEWdjBfPcPYuQlV8Xj+wx6rLJz39aOB8IGY1vI5zi
         8hLF91xHaDv8IGgHsXo71I5esUFlBw2lW/ON4NZm7QclYKiw1SCWLT+8f222viKn6C4s
         YTh5lj4KSjADvD7Lli3sYjq/UHwzuMn/c1jdI35gFXT1im1wj5Q6of9H3hZeP22FiHnj
         u7iA==
X-Gm-Message-State: AOAM530IALxQsb1z0oYUMOZJCUFFbSibhdtNwwzh41UDyCQn8+L3o3bq
	P36yk9Tv84wtExCygeQWW6ljfw==
X-Google-Smtp-Source: ABdhPJwnn6rmrGvU0u1/dzlVI7LKYNnPN9/BPUhuah7+Sf97+hAv2LvRqgmfqktN5dXOVn5IwRMcbA==
X-Received: by 2002:a17:90a:1782:: with SMTP id q2mr2835569pja.189.1606830243094;
        Tue, 01 Dec 2020 05:44:03 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:44:02 -0800 (PST)
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
Subject: [PATCH v2 09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
Date: Tue,  1 Dec 2020 22:43:29 +0900
Message-Id: <20201201134330.3037007-10-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the specific compat string for the smpctrl registers to the
SSD201/SSD202D common dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
index 0811220f0a79..7a5e28b33f96 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
@@ -5,3 +5,8 @@
  */
 
 #include "mstar-infinity2m.dtsi"
+
+&smpctrl {
+	compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
+	status = "okay";
+};
-- 
2.29.2

