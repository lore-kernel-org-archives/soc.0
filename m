Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B62EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E171564E31
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E171564E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mESQHHDrUgwg8HM5ptlKfxSsip7S2u+fXbS9Q2RF7VE=; b=BOj2Mof1Q/pcMJOeLfvifgJv8
	lIVTr/hpwvWGwM5saiP7PBj2MiPie+ff7euDvu9ZQn+op30782x6eAs5QtPJC7bEOUUD1f52FJ3cu
	bMJNvVw9XIeldlmk0JxKeY3wiHdLywZNGiucWkZYR5G+jSYXv1XiJW0dxGPhquRRjPno8qvoT4dWj
	Vg7DNxPJyhR57Fe9p0t/kf2lW+mAL0QuUX83J/OpC2XJb/A3252eD51wfUgCaGFW2RAemprdJzJ7r
	MPO+sV9fY8p3KQ4vzad6UQ6ye7GFOuuGsNWl38b6J+AuX0Ry/sYRKPr2aYZl20hLlug32k6VNGO+B
	K0EyW5Eew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhmj-0004LR-7k; Mon, 01 Mar 2021 12:36:25 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhmf-0004K1-T5
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 12:36:22 +0000
Received: by mail-pg1-x531.google.com with SMTP id p21so11443314pgl.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Mar 2021 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C88FmiAqxDnJbB9m5EGVR/CJ40sQ0nT98Az9DhqgecU=;
 b=k25ODqx0AJ9FiPd1SEWkoupl4VkvfyH//7e4sw3S9SizNEvqDBmeG8PMTbrw8Wud2p
 jPT/5r8AUEOc+6GCoMClwE2m9U12dn/IyaSPGBhnWNegGzlei+RJ5Q0GhZ1do2ME2bob
 0valpUCI4R32euZNZJguYY2Uh3+rSnvly1/gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C88FmiAqxDnJbB9m5EGVR/CJ40sQ0nT98Az9DhqgecU=;
 b=iP1yho7IgM2SfEGbgxGWfeSHTQTkf9HqL9QladNHP85GPTLKT/hnAdOBHybZw6Fb96
 /otewsrM/eM/jYKkAkDtc8NsQuHZ/SkH6XdSZ+ty/wxiffHErO7xe8RdZWR5BrC3zS5P
 3aPMv3cIaYPNSGnDxzKQKEUcRwrMz6EBCl7/WKcmRSnqU8WESAHI7il7SUJDAa3Vl3+q
 HOqeR+nJyngn/cLkKG5OEfvKRmDFk0CfsdHv2AHC5ynHalBzny4q7FTi0Rfhayqmd5FE
 fWm8JUOhWIlVpU/5EDdKjtVtjUel7bqtZYQtQHh3fpmHRpjh/Qr7IWPI2ywpfyuPwSI0
 pLiQ==
X-Gm-Message-State: AOAM532bsSm2Yg3YDZpPL9xKU/4JxTXSnSai5FYHI/IuoVx28xWWVHW6
 uAUS70bq/8O1cLtW8fpifbVQUQ==
X-Google-Smtp-Source: ABdhPJy4edf/KQypinIj/0pMZbp3pGG1yVFbUE7VPL2CwLLI5GWeL1N/ukAkzUJwOZk8lI2iMzCeTQ==
X-Received: by 2002:a62:ed0b:0:b029:1ee:7568:5ab9 with SMTP id
 u11-20020a62ed0b0000b02901ee75685ab9mr7010492pfh.79.1614602178032; 
 Mon, 01 Mar 2021 04:36:18 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:36:17 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH 1/3] ARM: mstar: Select MSTAR_MSC313_MPLL
Date: Mon,  1 Mar 2021 21:35:40 +0900
Message-ID: <20210301123542.2800643-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_073621_981998_D0806CBF 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: arnd@kernel.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210301123540.mD6AbzrJIGdV0IZcB0J4k5bo78Rx9H9jinxqNrQoAws@z>

All of the ARCH_MSTARV7 chips have an MPLL as the source for
peripheral clocks so select MSTAR_MSC313_MPLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/mach-mstar/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index 576d1ab293c8..cd300eeedc20 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_MSTARV7
 	select ARM_GIC
 	select ARM_HEAVY_MB
 	select MST_IRQ
+	select MSTAR_MSC313_MPLL
 	help
 	  Support for newer MStar/Sigmastar SoC families that are
 	  based on Armv7 cores like the Cortex A7 and share the same
-- 
2.30.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
