Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B60EC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DD12151B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zZb03JZh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ZKQNqj4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07DD12151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3rhdSCKrjEb4CcQz7drfjWhBkGFx5hsuihqESUMnArQ=; b=zZb03JZhj+4e4eHvn/5mt+UMk
	iujMRjPV1snHqjBhhHvzq/f+M8LZ9TvIIo0/FdvxbdvUYqRZYk+mNiBT/16lBrZZ7Ld0dsA2aEA2B
	JFx+OASCQprt7bKyNGPlbYJmelPcf8EaXyNXM9G0KODIZfBPjd7CouJz830MTFdH6n/DouKFA+CcW
	k/O4QIvBtLmNlZ+tin5virpQGIcTIhd9Em0TJrN7VfldXEldTPNYOgCouXHf9eWGEM0yUF0+U72jp
	y9l5grGR0DEBePenIzrr0pLF9LCnVI04mD4mqPtpM56Et8BjxTMw5mDgMYYxCExBmhDPeK/eIDHy3
	VYp4LKmEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wz-00074s-UL; Tue, 01 Dec 2020 13:44:14 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wo-00071J-3d
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:44:02 +0000
Received: by mail-pf1-x444.google.com with SMTP id s21so1118715pfu.13
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=fYBeayspXCW7uqMI3Hi7jrPbtvDHKOb3lQpwDoSQDp687rDO6SMIIcbnvMi/WZUa8u
 qyoytleYCKMtlS9jSqmJw9OWAQXnHJqJopld7N/MBh8GU3ErjoWXi5/vrct4V+FOmgI0
 MSJXNhjD/Vg3u2+0oliHc3YQL67H0s8YYDZ2F3kd+cDj+dlKZg1wodSuCFsUiwkev+Kr
 3CqXHrdbg33mtqEjo8e567vdVNi4qf6mlWimvMoX/6A1Jo9gjS9jXIp8qM6EXP7FYs1F
 44uI/f7fwoxJp+pz0Dkm+NzSJFOTYHmznSTzbXBuUBSv+W47ZUe3+9cWyjCTUqLONmWY
 wGoA==
X-Gm-Message-State: AOAM530Tm5zeBX9B9M0AMezqaRQtXPNIOmngAzHSm8FCqIiG/yOBP1Yi
 pmEbt0aMbyyzsSFn9j1JAXsJDQ==
X-Google-Smtp-Source: ABdhPJzSqLPkSH7u9yo7acIkChjMg0tnTuSVTqrelaL8V1sTewnWOzC6QPFtGj395NrAKbryp/7J/A==
X-Received: by 2002:aa7:8055:0:b029:19b:694:34b2 with SMTP id
 y21-20020aa780550000b029019b069434b2mr2601424pfm.2.1606830240351; 
 Tue, 01 Dec 2020 05:44:00 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:59 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
Date: Tue,  1 Dec 2020 22:43:28 +0900
Message-ID: <20201201134330.3037007-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084402_241106_31A16865 
X-CRM114-Status: GOOD (  11.57  )
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
Message-ID: <20201201134328.P77N8d1769FcEmgxWkpobZO08TMj8xDJMZ07HrZ2wGo@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
