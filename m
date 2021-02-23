Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CCAC43331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE81B64DB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE81B64DB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUh6xhwnM1HjFpabNcCNYQ/KHF4AwheEPY7RX2nOgy0=; b=gxerCya4nt9T5jQKovDUqH+7q
	8y9ks+CgGhs72Hb2QTx5cFOdk6wam+lUqfHWfh4JwJb5IssVeYVTkhjiJfEiY1G3WXlIH8hxBz7Ow
	4ChhD0nrF6/6dWH/DGR+/2l6ZnALc31CUu54mN2nIG0DnVLTkp59kabLYDDISIbsAq2yiXtB56Emv
	Bq+SgHeokBI6cEbBT7w2yN0RnlCWPAE1KNqpHh6t4UKoefVIC+P7XHW5HY/EQ1U/vMg0AS5VcS2bQ
	dW0ll2yftTau8Eh1P7UdESgZLseO4gBi9mteUarApf2odlWNifxqt8PpvMwapHkIrMot2hFoHpcQO
	wniWwXkVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER31-0006uh-4g; Tue, 23 Feb 2021 06:19:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2c-0006mw-Tr
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id a24so9192925plm.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
 b=vFAGl7k5isfUzWSj59UQ9XxA40uYRhdmVvNDxnrUzWu6FHtJTNyw0cqTm178md8yLh
 TsWHwYiOjHskw6l2yzhaeG+ZbGYvZa0EpXQq0EZx/4rJrMx5tPfnkcNq0l0o3/z67+mb
 8xVP02vET2/tQ9CnwLCfKQhhhAa5OMwo9v0pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
 b=twWqKPOb+JKVw1MoLiFrosLgUYMK9N7MJ8CoeELkZgU3KxmbB1yZf+HZbgC9qH6vwj
 TnsiVuts/ArGCHO3cMo166i/y4slqEXNlzskOuqCgq3GT13lZ9fhqGAJkWTNkeom9tM5
 UhyKGAybNQ88JtwJoviKoAmDCVADY0zWV4vR9V6/vx1TDfl2VCUUlx+4l2OQc7nqc7z9
 xHaCdziz++pdMdNIMu6XQZX/IErBla0PqGT4jkbn1WtuRsamY3V1o89BQ8kDj23+e1JZ
 CG8zZ1NI9JsvkYwevm8RL7NCAINmYx0Ze/MufHIAY53xiDdXpFw2e/0SVRfiC+jbL/WT
 DyvA==
X-Gm-Message-State: AOAM530+Ao9kdS0S5dh1kC/XgxOUgmLbszH843LpmTownpOXavr3vS65
 6hktsxXtGbTgtPEW1benJdptzQ==
X-Google-Smtp-Source: ABdhPJwBsHIBaGuLGftBLh9hMsJ/IeKYQPrHF8GpHwdEz++2TYtHeK9N5CQJHYgT51bxWKcaM54eIg==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id
 q69mr25034810pjq.108.1614061164948; 
 Mon, 22 Feb 2021 22:19:24 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:24 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 5/8] ARM: mstar: Link cpupll to second core
Date: Tue, 23 Feb 2021 15:18:27 +0900
Message-ID: <20210223061830.1913700-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011927_035342_DDAE3FFF 
X-CRM114-Status: GOOD (  12.42  )
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
Message-ID: <20210223061827.9oAY8755xBP3DKABSEVSHf7tQJP-DaSJl9Q-QVXmVHQ@z>

The second core also sources it's clock from the CPU PLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
index 6d4d1d224e96..dc339cd29778 100644
--- a/arch/arm/boot/dts/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -11,6 +11,8 @@ cpu1: cpu@1 {
 		device_type = "cpu";
 		compatible = "arm,cortex-a7";
 		reg = <0x1>;
+		clocks = <&cpupll>;
+		clock-names = "cpuclk";
 	};
 };
 
-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
