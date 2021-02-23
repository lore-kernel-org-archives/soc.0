Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93544C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF6C64DB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF6C64DB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yXiQHtSTMsytDoSDQWSwGY3ypuhVfZRfpWwq4fClRdg=; b=ay5Wwl3QcZy5QFcciBcZIRiMf
	uvEHmcFx9j5bBoPr9QAloBDXQikIVBSF5y+mEsi6q/KNHdwO8fBGn+0yj/321aYj3IJpZAGEKTY1I
	VzAZ/ti0kOwJPt8RPr9sUmfVxbC38E8Wp3lgk7e56r2oN76O/hxGqmnY2lsRXd5dRfJzFLGFHUqKJ
	eADs9yEid4XbHsy3623rKug+VFrHeDjLtqdQOVXPJaXYFJxEb3mxaV10uumqV4+3xunBq9OUPhv/Z
	MeGYbdTf2fWK1M8VJetrDPArwD+oVFdUWu9FS/jDjNf+zYTXdhHzFbmr2Ul4lDF+F7HrOgiGvM8Yp
	LhrbzKnUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER3E-0006yN-7a; Tue, 23 Feb 2021 06:20:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2h-0006oZ-Hf
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o6so1176221pjf.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
 b=amHWH1xFUTFu36kpCUT4l9b90U0fBp3Q9fyx8iXV9r/xiRDq9pDWnJnL5GPlqLxbSj
 HR0yuPTyY+r+HwX+t5dEfOPeVRXaEaI3mggCZWThxuvElg0+eLqgqpVKAuTGcld4bc6X
 MHx5hnu+uT3f4oMN6r166FajTuyU6Mtf+FsqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
 b=M7NN0nBDTHviw8Uisdiw2YpziumcJQ4z85y0St5uv0wLb4Gq/fZ0agmO4IhPDsbHQ7
 PWEwMmzdPu9rh2lUsjgseebsVp9WmpsnAwK6/dsCexgvB0WeVjWiy9fy3hsArZX24U7d
 IW/NbgmvVft+kPJQ7Edes1VrsR1Fx8cFE5YH7tpw1gMRjm4wUjFYJS/Fwva/+vqFJkoQ
 Xdqx2k4woEsO1pekbVGnxKLXhYKuclktJVcN4TxcKQ6P825aLVtNbPMRv65oQAGYrdlT
 bxv6Qe5wTtXDPwjXTYhqdWRSRtYXJnqAuTLLe4QcOE/tArghtHpxdy9/IN17CGp9sEYd
 CVZQ==
X-Gm-Message-State: AOAM53271HBXVH821qHYI5ntKbLpxsAEbrxu0jviGWkMSqq8ffRn9wyb
 3qYNY79zok+VGix85/MW3mad2w==
X-Google-Smtp-Source: ABdhPJzKdWD/HPnom8Qx8jH6AAUN43gD8lpStgM44BbHKJBQkB14izYGXPrhe4CCETIu2OGeezBwGg==
X-Received: by 2002:a17:90a:7e94:: with SMTP id
 j20mr28131038pjl.218.1614061169617; 
 Mon, 22 Feb 2021 22:19:29 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:29 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 7/8] ARM: mstar: Add OPP table for infinity3
Date: Tue, 23 Feb 2021 15:18:29 +0900
Message-ID: <20210223061830.1913700-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011932_937984_D12B9AC4 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210223061829.kF6ZDxa8GMV4ZBOI5ohDjFjS2Iutw0PLuBfbG5yJgLw@z>

The infinity3 has a slightly higher max frequency
compared to the infinity so extend the OPP table.

Co-authored-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity3.dtsi | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity3.dtsi b/arch/arm/boot/dts/mstar-infinity3.dtsi
index 9857e2a9934d..a56cf29e5d82 100644
--- a/arch/arm/boot/dts/mstar-infinity3.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity3.dtsi
@@ -6,6 +6,64 @@
 
 #include "mstar-infinity.dtsi"
 
+&cpu0_opp_table {
+	opp-1008000000 {
+		opp-hz = /bits/ 64 <1008000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
+
+	// overclock frequencies below, shown to work fine up to 1.3 GHz
+	opp-108000000 {
+		opp-hz = /bits/ 64 <1080000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1188000000 {
+		opp-hz = /bits/ 64 <1188000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1296000000 {
+		opp-hz = /bits/ 64 <1296000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1350000000 {
+		opp-hz = /bits/ 64 <1350000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1404000000 {
+		opp-hz = /bits/ 64 <1404000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1458000000 {
+		opp-hz = /bits/ 64 <1458000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1512000000 {
+		opp-hz = /bits/ 64 <1512000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
+
 &imi {
 	reg = <0xa0000000 0x20000>;
 };
-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
