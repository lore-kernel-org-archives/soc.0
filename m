Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E66C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB5C64E2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB5C64E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GKXpycLHJHuJL4Ii8ab+i8v3DYT174UZko5Rz8zamO4=; b=nmCm1hHMZyPpSZZZ/H37EwfEbh
	JBZjigb8Av023MF9q1DKAMuiPNaN1go4CNYrfpA5yb7EYHAWcy/3GbwFnWWprrGsoPF5KtBlM+/gL
	OvS/y5IZF5HZv2DhUOdE60YTYDhrvxeW1QFQFKyBxHsR5kQ5CIQXxpZg7L85j5s4ZogJOisj7c2je
	sbcWt3mFJexIqj1llJieq6loBBUmXoBZMpE7Pk7J3+3Y5dSJt1WmgYnCs/OyqRmAukt2vbIEyGm+M
	zGRId3gyzpMK1/zUzWj0QpcghZwbvcDAwr/42uk9fpcfLTjN8UneewkkPk/GCpGyj+ksgdhklLnQ2
	6B1pFqwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER2V-0006ks-Fv; Tue, 23 Feb 2021 06:19:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2R-0006jr-S5
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id o63so11744823pgo.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
 b=sz3vP7AGKlQXyS2RDXmywvZUnQ5EhPaeq8Lu5rtj26+LhGxR0RMTZIe3o5BF05dO7F
 nKjGu3Dcm1sk1k1v9AxCeajyOq1w4y3qbGdQBJDI4VVqV4AHe1DiYMEB8Qmd4XU5kKr8
 V2pK2mJwNswP51/9JYngQraTpenSNLTD32PE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
 b=ZKmXqP9V1uh1zBFqHvdpV84zACNU3VuiTxdQYzTqIn5DVbcbI3iCJxZ1NicMODzylu
 +Ty+kmg0c85ksslyLCslRJCo/cy0mevlsUj3wGRwOw9sj2NK8+3/DEup9WWoZfPURbqH
 D+ODhMP76bjXUc4DMb2O2y0le3Qzj260GIx9ciFCdNq3EWs4ycULni96FeDNNzMLDm21
 yXvTmtyIWilj+xFfgYLhHxowA1uio5EmMWGtvgGsraKTX6aOKZbiecFkTUC6+gzDbdnk
 bqB7apMeihPsw8Hvln5b3n42ssy+YiDf+107fUwGbV1codR6QsR4q/9cb5JlIZDmJ7Xx
 TaCQ==
X-Gm-Message-State: AOAM530N+05oOF6Q4qwTISCy3JeJKtOS7g0vH/hdFPxuI4933dixZ617
 IPyXuoqh21OOQiMbGyGDFi+wdg==
X-Google-Smtp-Source: ABdhPJwJaNbUqhV3I7tQ+drfo40Dil/MozZwGwWntn9HWDo9ZR71eAj9kODrgi7GuJUdcXT2cj5HBw==
X-Received: by 2002:a62:7bc5:0:b029:1ed:62d5:31f7 with SMTP id
 w188-20020a627bc50000b02901ed62d531f7mr968575pfc.24.1614061153493; 
 Mon, 22 Feb 2021 22:19:13 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 0/8] ARM: mstar: cpupll
Date: Tue, 23 Feb 2021 15:18:22 +0900
Message-ID: <20210223061830.1913700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011916_152633_E53A2CE2 
X-CRM114-Status: GOOD (  13.29  )
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
Message-ID: <20210223061822.LlcvSaljKBXQx7mY9aI9tiHIl0BF9mCA1rrwtTyhOCU@z>

This series adds a scrappy driver for the PLL that generates
the cpu clock on MStar/SigmaStar ARMv7 SoCs.

Unfortunately there isn't much documentation for this thing
so there are few magic values and guesses.

This needs to come after the MPLL DT changes.

Daniel Palmer (8):
  dt-bindings: clk: mstar msc313 cpupll binding description
  clk: mstar: msc313 cpupll clk driver
  ARM: mstar: Add cpupll to base dtsi
  ARM: mstar: Link cpupll to cpu
  ARM: mstar: Link cpupll to second core
  ARM: mstar: Add OPP table for infinity
  ARM: mstar: Add OPP table for infinity3
  ARM: mstar: Add OPP table for mercury5

 .../bindings/clock/mstar,msc313-cpupll.yaml   |  45 ++++
 arch/arm/boot/dts/mstar-infinity.dtsi         |  34 +++
 arch/arm/boot/dts/mstar-infinity2m.dtsi       |   2 +
 arch/arm/boot/dts/mstar-infinity3.dtsi        |  58 +++++
 arch/arm/boot/dts/mstar-mercury5.dtsi         |  36 +++
 arch/arm/boot/dts/mstar-v7.dtsi               |   9 +
 drivers/clk/mstar/Kconfig                     |   7 +
 drivers/clk/mstar/Makefile                    |   1 +
 drivers/clk/mstar/clk-msc313-cpupll.c         | 228 ++++++++++++++++++
 9 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
 create mode 100644 drivers/clk/mstar/clk-msc313-cpupll.c

-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
