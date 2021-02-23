Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9BAC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1423864ED6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1423864ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=74/oNQZ0WbuoQgmB97K3BtpVjYl1XJx9NmmM2IG491c=; b=tFPOwKz0a2svaX4Ryso44qWrT
	NKSPsJU8yIbHZlDpRl+MpvXCJyT4rK9rBLOps/izmwoUgTwy1HG6/kz8P+cdlMrIGkm5MkLW1UhS5
	8jxiAFigvM9Q3uC0fq++vk8U1o/1vFMUeeGsv3FSzloZQ5tqBTsgGYhMLEuNU0LYTPeAYYgHhVY41
	XNIqaAh/0RS5+KQz1jzL1l9bPPQpaLh3sTkUpcChM+BXRB/p/V7XsXivfHTIhslmibGjZf2ZSd7Ou
	hZRT6GbhV0010RTDEUeE3ulhnCEtyw+/0TKJTDi9wutlvVlp/XeTchHps+FIK11fVnoV4OrcKLzBw
	sHAnwrdRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER3J-00071a-J0; Tue, 23 Feb 2021 06:20:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2k-0006p1-19
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s23so1193553pji.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
 b=krfujBl0J3RTa+9MxhJ1pPz8nrwfBTvIuo2aMFitjGAWxGPWV7xeKZzzG+bMU+3iUy
 Mc5Us7xmjCKRjKJsudStwDXQ5GMoRh7bmyzyoFgQlsU0Or3Ww9ad+a7WksQ9IzdZLbay
 MULJZM57YvPqTgUTD2YUj/28tKRa7nzcg8ztI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
 b=IwQChVTHeUcREP7atpZLR6hop1TwjtLlI/jykB1qOTqxAHDx5ltMNyR+gPS7S/uf/A
 HKTnfx8VEZloYlBafrMoN+VH2N0NoBpvvdgtuwkf7bkhGrrUSNCdnU0ffvD3eT50JIhl
 INx3org11mA35gNBkBsFNNRrLjM8oNQn4SIotifAvzUBL+6mopqqbMA2t9khFk8OaQ2j
 Gg69gx4FHWsGjKnaq0/58r9WvWmkxlE+s/O2m9WH+6ZDLcBRrEYraPgPDOcLh8LIgl6+
 U1lemKcyzPE7NDtV2yDYIyyLTLGRyQ0neD8KhG42I8Oc7xTxlENmaS+WHTFRCLM23o+Q
 8Cag==
X-Gm-Message-State: AOAM533mkKN5Wr3z5PaxWjGuj74c5MlMPfaIo5YWcx0FaQndKIcSCt7J
 2u3LHDbmYA2Hw8kfmXM4mPM1zg==
X-Google-Smtp-Source: ABdhPJxKcQ0XdzH66RpqYbTQ6lbBZie3kabhudXrxsFNyvw+rqjI5s3m5LdmnSloa1eUTFccWA5bRQ==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id
 i10mr26715766pjl.152.1614061171969; 
 Mon, 22 Feb 2021 22:19:31 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:31 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 8/8] ARM: mstar: Add OPP table for mercury5
Date: Tue, 23 Feb 2021 15:18:30 +0900
Message-ID: <20210223061830.1913700-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011934_254354_00D6330F 
X-CRM114-Status: GOOD (  11.45  )
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
Message-ID: <20210223061830.ygo3b-C2s5XcKY66d-q3fuQlR_IwQ0-Xeu4T47xPC0w@z>

Add an OPP table for mercury5 so that cpu frequency scaling can
happen.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-mercury5.dtsi | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-mercury5.dtsi b/arch/arm/boot/dts/mstar-mercury5.dtsi
index a7d0dd9d6132..80a19bd23c9c 100644
--- a/arch/arm/boot/dts/mstar-mercury5.dtsi
+++ b/arch/arm/boot/dts/mstar-mercury5.dtsi
@@ -6,6 +6,42 @@
 
 #include "mstar-v7.dtsi"
 
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <800000 800000 850000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <850000 850000 880000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <880000 880000 890000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
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
