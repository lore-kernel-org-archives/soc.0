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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADBEC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD3F20B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wJbyDB8u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttCs+eVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD3F20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BqyQF/5qa1t0qKILI/fBDy4ovGtlJA26SaTZRS//6C8=; b=wJbyDB8uca6D4Tfv8B8Oz3ixV
	S0b7in/WZ6URUlNfvj7Eft6cNvTwnqanEdjzfcDsFScCy5g3qXWCP/sSG113S9Wkzlo6bwneFxfJ6
	2Yqw/+pGRU18ja2W+hD25yAxHC2uXkdSGHdQ35m+pz4pggcOG0De9H6NrUomD98a5Rdgp+ubBKSA9
	UTQtMLpUrrKbAToe4iRm8S38HNZorrTT4CeKTRjd0fc756QGC1CliP4/NwIUw2l1q3qlMgmA0/rib
	I9yyPnZSQSeCU3rQjf45Ux4gwQvadkyQ/gh6WUJz0p6OA5j4MyfKNvCGv52twTlyv+bZ1oqTfrbRc
	kvNSl+THw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyg-0005UY-2F; Fri, 27 Nov 2020 14:44:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyM-0005Oj-Rg
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id a3so6724413wmb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uX/GVbnqAzBXx0E85jAnDMgOaxp18AQUYwU0Wycd3tw=;
 b=ttCs+eVUAu/Nlj0Q3UhP7icO8sHCRwrehl0jqHQmJ6mA6K6zIR3xr9VXXGB+GJfIKu
 F2YRz8viDwXvk+GiLfJlcAJaLcPMkZCAtcb5TDoXj+lrr8ClLb+cnzkA3xrO/Eh8Gzgs
 NN2mvcfFhNobc6K4dpDq1Cl0qXUVMRiXW5VV7eb/6ev4UKgvD3fjz4uAOKjuNzal+Q7q
 MfMGEx5JrpDyAGvD4jP01QOH0h/+zJZ9xixbNPWFU1shWZeTnf04YC8xGsXFoFVjf+MB
 ydR2bZXI6xsQqizuwUHZSJ8/zfm9aNiy3jGWG6EjLnact8NFsNtbkMIAAuuWHB3tVJPr
 GzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uX/GVbnqAzBXx0E85jAnDMgOaxp18AQUYwU0Wycd3tw=;
 b=e39COj0VDdv6QeEfkpNP10bYstKCSH5vHbr2z4tP9G/R2Vygw1c1I0JjmLmg8OvMie
 XKYjST7BVHfiToaGk2rjm2OusjZCOPexvpPpUs4+Q3u7xX70hsNNMSDBwXi+rLsXmXzS
 KOcoqj5b0rju6u2rAhTgFxM4zCTydiCZiL6Z7TqL1AGa+ysOu+QegTExPE1Asbp8Dp16
 NZDsHQ0tx7akQxQGPu8vZ3Tt0EJIr0EL3yjsgCEWanFoC6bNMd4JZjoAdEaXoipr01f0
 mTeeiNbDmGd6X+UdZild8S0+b0JdiGBDU10ItgEXwLw0D7x47DbYhJli/WWHkw5+ZTPP
 Yp5A==
X-Gm-Message-State: AOAM533A6yo88K/kNwmkXGJG28AU3NyoVlXlVALQhxkGcRSuozbd0sYn
 DB15NA5e1KdW8NtCPBG26b8=
X-Google-Smtp-Source: ABdhPJzl20W3YHhp9wpXMsQPwnEu/2ZLBS4mjNLkOLU/zk+AOSHSHT9E1+wHKIdHfcW1s19Mob2d8g==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr9503850wmh.54.1606488221257; 
 Fri, 27 Nov 2020 06:43:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v1sm14934804wrr.48.2020.11.27.06.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:28 +0100
Message-ID: <20201127144329.124891-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094342_969683_0CD0393A 
X-CRM114-Status: GOOD (  12.84  )
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
Message-ID: <20201127144328.zAJYCBGcpXi7DGR15K6kCv3Uem2BfkvbRlyllsO7rgk@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm64-dt

for you to fetch changes up to 48f6e195039486bc303118948f49a9873acc888f:

  arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering (2020-11-26 16:33:04 +0100)

Note that you've already pulled part of this earlier as fixes for
v5.10-rc6, but I've included the whole lot for completeness. Let me know
if that doesn't work for you and you'd rather have a completely separate
branch.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.11-rc1

These changes are mostly minor fixes across the board, but they also
enable PMUs on Tegra186 and enable SATA support on Jetson TX2.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

JC Kuo (2):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1
      arm64: tegra: Add XUSB pad controller interrupt

Jon Hunter (3):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names

Marc Zyngier (2):
      arm64: tegra: Add missing CPU PMUs on Tegra186
      arm64: tegra: Fix GIC400 missing GICH/GICV register regions

Nicolas Chauvet (3):
      arm64: tegra: Add missing hot temperatures to Tegra132 thermal-zones
      arm64: tegra: Add missing gpu-throt-level to Tegra210 soctherm
      arm64: tegra: Add missing hot temperatures to Tegra210 thermal-zones

Sameer Pujar (2):
      arm64: tegra: Rename ADMA device nodes for Tegra210
      arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering

Sowjanya Komatineni (2):
      arm64: tegra: Change order of SATA resets for Tegra132 and Tegra210
      arm64: tegra: Enable AHCI on Jetson TX2

Thierry Reding (1):
      arm64: tegra: Hook up edp interrupt on Tegra132 SOCTHERM

Vidya Sagar (1):
      arm64: tegra: Fix DT binding for IO High Voltage entry

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           | 20 +++++--
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 16 ++----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 61 +++++++++++++++++++---
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 19 +++----
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 20 +++----
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 22 ++++++--
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |  6 +--
 11 files changed, 119 insertions(+), 53 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
