Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ADFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C1661477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C1661477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HhGv+RwkxeYEXH0Aj0z2jbXZulg3pTzeLSP1tjBnSCg=; b=LFvnfvQ6kFHngCqizNgm1TzhY
	tmltwkVs+QY03WP7QU0JQ6XhwqWo9FcRv+flrIbuSmwt+v8ZNFdtiSwVOqUOqTfoqjAo69Qorvb82
	A3W38E7OcifC6y5ksnWx6JrJa7ZuTKNEl7p32A7g1sHW4MB++hlhU2owaj8zjjmnyYquFs9epq+Ew
	GRt8Y2AXeuuct/DHawnWzRbgYZ4W0I2DMNOlUg60G1j11krQ4Gxu6P1clYGWCcuHVmoSyLBOc8L6v
	jIcVu3sBr5y3HpUlK85suz7oUBCEvR4pJU3saKIicQdvXnFCsphpkgd06iJx1BefKGmxbgZRev3/G
	oP7kJg84Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZWN-00027z-Px; Fri, 29 Jan 2021 19:33:31 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZW5-000238-S9
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:15 +0000
Received: by mail-qk1-x72e.google.com with SMTP id k193so9861147qke.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UjJUcK0eKglR2tl7QF1+vtD7OR9nEVOsWRf/PyeTMJk=;
 b=CHwKYzHK9FxB/mZ0nAGkH39ZGKHXe2WcgZrmYQcnWRKU/0hkZ0bLMJ75HR1sI5PH4F
 kBzvszdHTtt3TeJRVVD9AVS5B6cvasZjfggskuWG+FZm4bcBI8IEUXk2jNWvoMNBpjzL
 3C5Rnhs9+tnPq6E4PuCfCLxwr/AbeVuIlqoNjyMeYiuKwvASuTr9gSZ+vMaGSxSJcaCr
 96gaBmyRYpYPGQuLhFRMJYjChieWlyowiKXzdJxqRDysukPn1r1JCZ3D7vWm5TZ1K/g6
 vKGKpMpsjB5SWK3xc/nEk6nI+OS/TPlQeYB/kXIjP6M7ZhzMCeIQ/RAl4ZLW6+vmHwYC
 r4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UjJUcK0eKglR2tl7QF1+vtD7OR9nEVOsWRf/PyeTMJk=;
 b=lBcd8UIORtvRWuiGM1vRq4vGZlrq8trw/7wmpJbblK5BermhnH2/v+PrD6MqZlS60C
 wAKdi9OQdbaxXQc8cvWJNGJP6xFIA3HWJBGkofCNbS15N5I842sXU5zyRst2FIwDFcpq
 gJ8JtXGFNDa4X9RnTetGQzTny2L5YkmbieYOzcEX0w5PF4RqjaQorVS3PVwogE/pTIWH
 IqoDg2ID33PzmNI7PnbF3ibnxWW2vgwKRA4BEivGwjq7xSRx/oFmluJcOE6dzfKkv2MD
 JnkEiRy+I2DhGvSKsu1rVyEV4UGyy4iGHa3GSO6L17E0kPdDnHKkS91/nzY5+aADea/v
 rjdg==
X-Gm-Message-State: AOAM532beqD1/ez8CrO2AJy9eMvhgJb6itKH4SEZ78o0NQBsQSosVmOT
 an+j1VDNqZAWkaaavRNmkbY=
X-Google-Smtp-Source: ABdhPJyI9vC8rMQ9ccCV59xv3EzDEvfasWpwShDIerPQPWPLCzd+mzLUgTYodzTpmygN4gX4sExDxA==
X-Received: by 2002:a37:a992:: with SMTP id s140mr5742907qke.286.1611948792010; 
 Fri, 29 Jan 2021 11:33:12 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u65sm6774578qkb.58.2021.01.29.11.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:33:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:53 +0100
Message-ID: <20210129193254.3610492-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143313_990687_DA8F649A 
X-CRM114-Status: GOOD (  14.06  )
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
Message-ID: <20210129193253.-zMDphlx5eTaMpzaQQ-pUoyeDr9o6_hNs4gnhuvrVaI@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-dt

for you to fetch changes up to 5b4f6323096a05870e557d841b209bf39e719440:

  arm64: tegra: Audio graph sound card for Jetson AGX Xavier (2021-01-29 17:35:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.12-rc1

Fixes an issue with HDA codec detection by properly wiring up the
power-domain for the HDA controller. This also fixes one of the USB-C
ports on Jetson AGX Xavier and enables support for audio on various
Tegra210, Tegra186 and Tegra194 boards. The Jetson Nano and Jetson TX1
also gain QSPI support.

----------------------------------------------------------------
JC Kuo (2):
      arm64: tegra: Add XUSB pad controller's "nvidia,pmc" property on Tegra210
      arm64: tegra: Enable Jetson-Xavier J512 USB host

Jon Hunter (2):
      arm64: tegra: Prepare for supporting the Jetson Xavier NX with eMMC
      arm64: tegra: Add support for Jetson Xavier NX with eMMC

Sameer Pujar (7):
      arm64: tegra: Add power-domain for Tegra210 HDA
      arm64: tegra: Audio graph header for Tegra210
      arm64: tegra: Audio graph sound card for Jetson Nano and TX1
      arm64: tegra: Add RT5658 device entry
      Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
      arm64: tegra: Audio graph sound card for Jetson TX2
      arm64: tegra: Audio graph sound card for Jetson AGX Xavier

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM
      arm64: tegra: Enable QSPI on Jetson Nano
      arm64: tegra: Add QSPI nodes on Tegra194
      arm64: tegra: Enable QSPI on Jetson Xavier NX

Thierry Reding (2):
      Merge branch 'for-5.12/dt-bindings' into for-5.12/arm64/dt
      arm64: tegra: Order nodes alphabetically on Tegra210

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 742 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   8 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 595 ++++++++++++++++-
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  | 339 +---------
 .../dts/nvidia/tegra194-p3509-0000+p3668-0001.dts  |  10 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 351 ++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 282 +-------
 .../arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi |  19 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     | 284 ++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  48 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 299 +++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 175 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 261 ++++++--
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 16 files changed, 2780 insertions(+), 658 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
