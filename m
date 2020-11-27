Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C77C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3BD20B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uo5l7vzw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koz+rTEI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA3BD20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxP2TjN1uR/MRVASZJFwVkg0dep2GOcfiLDHRzrxsjM=; b=Uo5l7vzwyL1a/9zyAIuVjJ7gmU
	4Y2GLPTKDvw2Vqn7r4bvggHKDkouZIG+cLGydaOzqsQNR81GSjh7PBPciS5pluQnmSua5z3fkBu1f
	gPSj1wGVhETROmMCMeqZm8LeiRvmJKZrKC2um0mF/JlDUf0lCF/dE++6Nx17NHwZeDYllWgWxzrft
	BPWuQydLvkBDIIwGaQTV/DN7Sojk1W+whmN8EK+DkZ8kSQkQ+IeHggGohA+ZloI2e/vQYaHTDEIHw
	cNrNY+khJbn5YmjOpjTp7f5QNs2WJIABxfaLXMlUTK8ViUd1hZjVJjvPyz4gFRIJR76PEy5MMD6In
	x8geGKfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyG-0005NP-Ud; Fri, 27 Nov 2020 14:43:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyD-0005Mq-Ut
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 3so3015695wmg.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bf87zhRXj1rB+Q0/Jbp6kaz21nB1VmzfJGAWcV08pV8=;
 b=koz+rTEItqetq/eUpUIOGTf2gtphqXfcldhFP2SUliEtfI7lCgdq+qyTToo6numRV0
 WJ2arQnN9Re2cT+qH9lNEyrHML0BE2fScIK/IBGHfwiBYNXvSsRALvgOy56dmB/Mxc8Z
 4w8ctPmgmAyDo4wvcG5VDA6TX42dwy1afOWoQwSosT7lP3CaajIPkTadWCcH6mFfCsJY
 9hN/Zpb5zjavnOFdRX10EOCrP9dKiDsAVReXQaCWMzxtrZCVHMzCPbGvYhOeukD9txKL
 1n49WYVCxBlCdtrh/RVDBkY7BvMpCvmkc2Mq5BHgEl/nlQEDRzcEpMknSYV9dP5g0mqo
 z1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bf87zhRXj1rB+Q0/Jbp6kaz21nB1VmzfJGAWcV08pV8=;
 b=MvtIV5OYLhuFfdaSb9hZqIS/adt2UhTBpxSQ7WaH4Cp89pdSp+9by3iOJQDY1mKgCF
 9/FkFa3XNwEpNPQokeGArPI0cKKSDtoT0VuTO2CNnPoDkPgv8Yg+nNeLewhPIWyrPhJy
 0e4Lww+/DIVdizT/jriYL24XG7O9bz0wqjoLnAJjUhnmrBJtpENJqcv9HcSb85xaUL0B
 WM5IjwOzDTWAHu2w1XzzCIhfFXD2ESOZsgkRsm57lLcnX9QSKmgDioVVVLXkXs5fUpQn
 yisqmB5ai0GhnfIauAkP1u3hpgxWehpl+16T2ewXhSMTA4ax1n0wDKe+fqsbGix59m8v
 uKWQ==
X-Gm-Message-State: AOAM532w4C30SA++6WKRa6VmA1QAXh8sTDR08njXAzIP/WZaP3NAfd5n
 uzTyHTL484kCiXZpP3SYd5I=
X-Google-Smtp-Source: ABdhPJzzWo2ewKAb9VDawTiZppvz/xBeR51gfT45me7w/214qIt65/PViSk/oq+lk89ZZDcaDkisUA==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr9635757wmd.6.1606488212258; 
 Fri, 27 Nov 2020 06:43:32 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i16sm15265995wru.92.2020.11.27.06.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:31 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:24 +0100
Message-ID: <20201127144329.124891-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094334_072806_21D037C0 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127144324.uZgjGfo7zABh8-g53MLIg44v2BiMwhJZ5lOMgg81kHo@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-dt-bindings

for you to fetch changes up to e36f9381420b28e1785d7900d4c1d9db6149cbcd:

  dt-bindings: bus: Convert ACONNECT doc to json-schema (2020-11-26 19:05:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.11-rc1

This contains a couple of conversions of bindings to json-schema, as
well as symbolic names for the various memory clients on Tegra20,
Tegra30 and Tegra124. There's also a couple of fixes for Tegra194
pinmux and ARM GIC bindings. Finally, a new vendor prefix is added
for Ouya and the Ouya game console compatible string is defined.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt-bindings: memory: tegra20: Add memory client IDs
      dt-bindings: memory: tegra30: Add memory client IDs
      dt-bindings: memory: tegra124: Add memory client IDs

Peter Geis (2):
      dt-bindings: Add vendor prefix for Ouya Inc.
      dt-bindings: ARM: tegra: Add Ouya game console

Sameer Pujar (3):
      dt-bindings: dma: Convert ADMA doc to json-schema
      dt-bindings: interrupt-controller: arm,gic: Update Tegra compatibles
      dt-bindings: bus: Convert ACONNECT doc to json-schema

Vidya Sagar (1):
      dt-bindings: Fix entry name for I/O High Voltage property

 Documentation/devicetree/bindings/arm/tegra.yaml   |  3 +
 .../bindings/bus/nvidia,tegra210-aconnect.txt      | 44 ----------
 .../bindings/bus/nvidia,tegra210-aconnect.yaml     | 82 ++++++++++++++++++
 .../bindings/dma/nvidia,tegra210-adma.txt          | 56 ------------
 .../bindings/dma/nvidia,tegra210-adma.yaml         | 99 ++++++++++++++++++++++
 .../bindings/interrupt-controller/arm,gic.yaml     |  9 +-
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 include/dt-bindings/memory/tegra124-mc.h           | 68 +++++++++++++++
 include/dt-bindings/memory/tegra20-mc.h            | 53 ++++++++++++
 include/dt-bindings/memory/tegra30-mc.h            | 67 +++++++++++++++
 11 files changed, 383 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
