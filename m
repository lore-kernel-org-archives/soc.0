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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20119C63798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AEB20B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qX3XZ82k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIg1Y7US"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0AEB20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANH2Nt9wuTZNe9Z11q04ylLflPTah4sSYH71cuIa2X0=; b=qX3XZ82khMLpLyPvYFqe9yl+O
	cdnrvE2tiaB2+aGAn+SFfjySn9sBWQrvhy3fpF4nb4vzuR3cGG/QTPvh3kMvk+JKCIQpFSk9EiCPw
	OLW+ctwQnOcFvPR281o/FjbNuAPEU7c6bayGN3k6lUBbm8Sa1GuiQ8D7q6B9YRrSljApbtv7qfHH9
	C2iJpspgi+WnGhzp3SK0ZfWxrNDEB9N3/Pej+9OTXXiMGfTz4MT65ckHNTnAzcfsuHw0ZyJxvJkNF
	shFxJiy5DIKsMtwM+oOUBMz6AL2LooFZveBmvxvyVkNaFQivfM50HY7yizsoNB5F4Iaoq/hBTnWD7
	1s58lwsyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyc-0005TY-8f; Fri, 27 Nov 2020 14:43:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyM-0005Oi-HE
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id g14so5793032wrm.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Kh9Jm7QmiQmxxud+Xmj5HmTaSKRgMJx1GoEcOwNpSA=;
 b=kIg1Y7USHaGtQqdqcIAdKsL/Bt7Egm1i7QJhhYQu5XWbcy4jtVvhKiVJShmaIeZvMc
 tjdqV8zt6WAi16p+XJrhKGx8J9oTcYIDT432nR8JQAtgjUPON6egJsy+utnpN1vyF63W
 Rw+Xeycfauh6cY9QMvBQKi+nGWBfcGy1jwI/BbcIWu4SphOgDP44T3AozXeGAyJtI+he
 RqTdj5n8nsINHRmXBVkFcoHFHupFmeXIMU3t8CrSv68FpyrCzqUR2LUp9zL78fA9myWy
 /L0qApICyRpkoYLaUHMWxvEs9sft9ZKRwp6EyBZYQAMrbKyu+9IunMXfjueq+iyjzC/i
 tPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Kh9Jm7QmiQmxxud+Xmj5HmTaSKRgMJx1GoEcOwNpSA=;
 b=ubrN4P6NrK2rrNUHloBEl02AWX/tq6Vnm1V0fV0537Fx6PLv5G85d6WMXx8AH+/gQw
 RILnvD9stuuAGOVB59JR+T0fv5OOHmCZXXXAO+RO9mD6En2oFWEBn1PWyHQAJot9rGzF
 lkXCjQRqUiFO1u52IPaqjSF3+OBzQID4gWzYwODxl9JdosWEAPAIbt48sLCoczrzqzIo
 M9DbWWxwRnp+UKzY7K/AcGu7eY+J3OO90efdLM/ob7E1ZXmK3D1CTVKdJN1yrxd8nn4U
 cxU4eSXzrjmp4JpbXMSPMUD6m1Ab82w1UHJwMDLtR4yfiqr7080tCxYux72rL+uATujr
 cmhQ==
X-Gm-Message-State: AOAM531JktuTwCDQXpfe6PmGSDlkq3PCOkdLdClgFgG0oDib8u564YwC
 +8GdyrGCNsQaQk1telAouXg=
X-Google-Smtp-Source: ABdhPJwBbG6Rmkf63OlbL6061dO06RQMCvwkMraAf6Tou26N8eZMn+8B0JaTqq4zxWCgmtaJYJWCSg==
X-Received: by 2002:a5d:56cb:: with SMTP id m11mr11463040wrw.346.1606488218698; 
 Fri, 27 Nov 2020 06:43:38 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 2sm17797811wrq.87.2020.11.27.06.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:37 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:27 +0100
Message-ID: <20201127144329.124891-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094342_651789_166B368E 
X-CRM114-Status: GOOD (  16.68  )
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
Message-ID: <20201127144327.mrKuVJobdyRFyDtvn_mZmgSsOq4_yFcmwq77-XXCYBQ@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm-dt

for you to fetch changes up to d63250d7fd49503bac48099fcef24ba7985009a3:

  ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON device-tree nodes (2020-11-26 19:08:39 +0100)

Note that this pull in a subset of the tegra-for-5.11-dt-bindings PR to
satisfy a build dependency on the memory client IDs used in some of the
patches from Dmitry in this set.

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.11-rc1

This adds support for the Tegra30-based Ouya game console and enhances a
number of existing device trees. It also fixes a couple of minor issues
that were found during DT validation.

----------------------------------------------------------------
Dmitry Osipenko (19):
      dt-bindings: memory: tegra20: Add memory client IDs
      dt-bindings: memory: tegra30: Add memory client IDs
      dt-bindings: memory: tegra124: Add memory client IDs
      ARM: tegra: acer-a500: Correct thermal zone names
      ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Correct thermal zone names
      ARM: tegra: nexus7: Improve CPU passive-cooling threshold
      ARM: tegra: nexus7: Add power-supply to lvds-encoder node
      ARM: tegra: nexus7: Rename gpio-hog nodes
      ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
      ARM: tegra: Correct EMC registers size in Tegra20 device-tree
      ARM: tegra: acer-a500: Add Embedded Controller
      ARM: tegra: Add interconnect properties to Tegra20 device-tree
      ARM: tegra: Add interconnect properties to Tegra30 device-tree
      ARM: tegra: Add interconnect properties to Tegra124 device-tree
      ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC device-tree
      ARM: tegra: Add EMC OPP properties to Tegra20 device-trees
      ARM: tegra: Add EMC OPP and ICC properties to Tegra30 EMC and ACTMON device-tree nodes
      ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON device-tree nodes

Jon Hunter (1):
      ARM: tegra: Populate OPP table for Tegra20 Ventana

Nicolas Chauvet (2):
      ARM: tegra: Add missing gpu-throt-level to Tegra124 soctherm
      ARM: tegra: Add missing hot temperatures to Tegra124 thermal-zones

Peter Geis (1):
      ARM: tegra: Add device-tree for Ouya

Sowjanya Komatineni (1):
      ARM: tegra: Change order of SATA resets for Tegra124

Thierry Reding (3):
      Merge branch 'for-5.11/dt-bindings' into for-5.11/arm/dt
      ARM: tegra: Hook up edp interrupt on Tegra124 SOCTHERM
      ARM: tegra: Properly align clocks for SOCTHERM

 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |    8 +
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |    8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       |   10 +
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |   10 +
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  419 ++
 arch/arm/boot/dts/tegra124.dtsi                    |   54 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   27 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |    4 +
 arch/arm/boot/dts/tegra20-paz00.dts                |    4 +
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  109 +
 arch/arm/boot/dts/tegra20-ventana.dts              |   11 +
 arch/arm/boot/dts/tegra20.dtsi                     |   33 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   27 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    2 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |   12 +
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 4519 ++++++++++++++++++++
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  383 ++
 arch/arm/boot/dts/tegra30.dtsi                     |   33 +-
 include/dt-bindings/memory/tegra124-mc.h           |   68 +
 include/dt-bindings/memory/tegra20-mc.h            |   53 +
 include/dt-bindings/memory/tegra30-mc.h            |   67 +
 23 files changed, 5844 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
