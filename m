Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738D3C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4624D61357
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4624D61357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb3c6xUSP0E9YCamkPqyu8HkqDdJ/wzvm92XTQBeFKw=; b=zg6RIJRqcFfTbk
	wfS99jWQ6VNpqCdlvrEZ0yJUgPDcBlkuj7859ZbKW9x8WKmUJDLue/RURc6XIMSLADX7wie2LUMlF
	j9MPtTXWakCgdAQUDUWzTLIdNDu26rVfrTqKJh9KQ2qMQe4EkaFi6iv4zKJtSjG+EVfUtQHPwPzpg
	7qJ1eUzP9kswnNfeUHLhmboL+CczVGwM2Rt7pCXyOpPQSpVaBTAv//Ig6DpOuQmW6txwdCtFEjYxr
	ANblhR+OnOiObrkY/9XK3hDKTwXwzEaLwKrNehpftRFV13fyRWmDrtVhA8tX/3WebxWHm3OQx70B/
	szpXrt5h55mDINJeuPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkFg-0064DZ-Qq; Fri, 11 Jun 2021 16:43:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkFX-0064C8-Fe
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:43:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so9058147wms.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
 b=iez4rN3vAMHTJIPw2rqGcFe2ApmgbqvQnn+9CpLUWSibs/OeCbNnSVgv3GGKoghC+S
 5fsnNSjwi1bTmhqRtGLauAxXQjSmMZfp4tRqkkqQ37aqobJPwb+7wRskwfQhe84H6rxL
 Qtf+VZL1AnhmTDrki9VdxooGT7kv8tyfT019TSAKELGgfNNpzdZ/WmsphvV1LQ0l6prQ
 HknaZdlHFXjF7CKEl+8pVYd+CNcAvqAho964qMepsN6pHdfEuTR93zTJ9eRE2/XD8S5P
 wGN8/wLlXytNZ/6f6hu54LCrttPat0uvRyCpUlIBzLXHE7hIEAvK236UR68r9GCTCcIN
 bj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
 b=VcFUh2pMQ3NQ608PhM+lgHJU0LjV5WsvnFocwxGrFFEEEZPZ9zN8QBEzEMAQQSng+A
 ZOpP8uet3OuyMlXbRXQqC17/GSK/qNPJo9VlEhYeIpvD6/GIxM5/4bFCGuokLOgV1u79
 bk4A/TIcjaMov+hdU0Tq9BG1vneQ0zRM/7bFPgXchDqTcZVi6UbgL2ntCakP6MnmJDYI
 Bye3Zif7POx2TyA/FsHWXPtReaBAlqbhWeXH2bzdJYBDwuSCO77nplwVBeMyKpiQCoX1
 fQ6QOiir0SBtHjRNKYWV8bltpoOrNMhCC3+vQPWUK5iZUdm+ri7sauf1b2MJuGWf0MY7
 GESQ==
X-Gm-Message-State: AOAM533/3qRqOkt/o624QIqi7pA5qSrQeZ9D31/o3EmJuDbJ2/CEd32Z
 t8nwsIyh81np3i/n3EoR60I=
X-Google-Smtp-Source: ABdhPJxrExfJMaXN5MHYDcipIcjUhjeVg0YmkBliymAlsgthJyItoy35E7ZHDiFs7rW8X5omCVe0Vw==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr4982551wmh.84.1623429794246; 
 Fri, 11 Jun 2021 09:43:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m132sm6612796wmf.10.2021.06.11.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:37 +0200
Message-ID: <20210611164437.3568059-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094315_549569_46F56791 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611164437.xVq0x3OFsM_M2lfKxJmer3u_a3mOEE9pnJBnKemz28E@z>

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt

for you to fetch changes up to c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.14-rc1

Contains changes to consolidate audio card names, adds audio support on
Jetson Xavier NX and enables SMMU on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

Sameer Pujar (1):
      arm64: tegra: Audio graph sound card for Jetson Xavier NX

Thierry Reding (4):
      arm64: tegra: Consolidate audio card names
      arm64: tegra: Use correct compatible string for Tegra186 SMMU
      arm64: tegra: Hook up memory controller to SMMU on Tegra186
      arm64: tegra: Enable SMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   4 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 595 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 100 ++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   4 +-
 8 files changed, 705 insertions(+), 10 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
