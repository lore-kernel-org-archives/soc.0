Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F2EC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685E620770
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATElxr/J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="vpT3Woau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685E620770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mZWhGEH3UgLQc1G69Ibh9xqRbX+6PI5HqT2/KX7BqUY=; b=ATElxr/J7S6YGWeGX15Sp8A/G
	5QripFloU1UCQpz29GQ7yBqH1tjKiJnnCQK/nh1vyt/8GJ2qH7FwiX4HUlf5mh2jgEZvl8kLWYRvb
	dqmJy0VbBSIWQOtXPfiq3a+/5DXMnC2FgL1mXCF0uIDt0SOkqhPh5ift8MzyCpHDlhuJV7mspoaRq
	sgmIM77h+2QaNfZCT9XxyxLFCAdCX/YWK9LA3fwVbk+lcXAJLnW9nPJaQlJ6SL7vdDxk9YguWZQhv
	mMIbBP9SgGX/mCareceTq1CrJsqLiNWxANv2mPKHVp5uU1denUgBsSE6g/4eCScZ4G0LuDQHTvnOk
	q7x1gb9cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5xE-00079x-WD; Tue, 01 Dec 2020 13:44:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5ws-00072a-79
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:44:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id h7so780925pjk.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=cy8myFY+iVS3goVGsYfjNuHabWbHMxzcgKurRXQ9QsZcLiqy2sn7Bv+knbcQURLFhz
 6ZxYbKmSdOnoTkrueoY/i7ZjNDW/ZmyNPrhMPRGZTDHXcSUDXDzPIbU93KViauzHg997
 sfcKQFuKSa8jA0gTd9D0l6yROZeKT32IoyXleILHMrJACBi5PbJ78w51B91WffcpQc3q
 47RO5V/X6Jr5JDOh+a4NFJVntt+8+gYqyoADf//IxbhzumOPiioOHkRl7OHrCLNIkITX
 yD2m2+RFjsX5QyKmNwyEXw98W/TG/3Um8hGUujfUYa4b7spDzLYfFupBgaNU546h6t/x
 OlnA==
X-Gm-Message-State: AOAM531W9b9SFemUwvwICMuMnq6/bGCf7BBRf3vyjGXAtKm3oF4XpC+T
 +om2MnjzGwCv5Ax5JGpk4/giUQ==
X-Google-Smtp-Source: ABdhPJwnn6rmrGvU0u1/dzlVI7LKYNnPN9/BPUhuah7+Sf97+hAv2LvRqgmfqktN5dXOVn5IwRMcbA==
X-Received: by 2002:a17:90a:1782:: with SMTP id
 q2mr2835569pja.189.1606830243094; 
 Tue, 01 Dec 2020 05:44:03 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:44:02 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
Date: Tue,  1 Dec 2020 22:43:29 +0900
Message-ID: <20201201134330.3037007-10-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084406_379441_26AAB864 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134329.8H-lgMQAW6t0Qy6je4DXPWL071n4g_6kWDIfszZ2qDM@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
