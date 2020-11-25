Return-Path: <SRS0=UpL1=E7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF32BC56202
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 17:11:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9B62063A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 17:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaxMe/OW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSInxctv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9B62063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0oWRxbY589AkV8E6JYC1A17WSwD7CnpNReUw+VlMMc=; b=FaxMe/OWTGSFa0Ip/xDbyFpdJf
	7vi08mksgYA8dacA69EWi8tDub21Bq34UAEwbCeJmNkctjRi3AypUHXnYqufOeS+0BiyyQR4PQ4Ue
	ksFR9gKHnCmNSN+N87taeFP7RDUUqqx7V5SbIdhNRsY10NvGmH0oqUiTnKRlOHqz9071Wb4nCYscL
	6/O8B/G6ZzQBQwLeDF69/ApXDFK1O+032vSAGGA13i9ktv71wIYJO2xykyUdyyLwqgP3SsJP3OIO0
	TFubwmp6RNIa69BFU4wpMgjBo/fKS7bvpLuejfOR1rng4rcKCwkZUBxDvJbCOE+ppGRK7c1oOx6jx
	g/pJZTOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khyIk-0001fs-Gi; Wed, 25 Nov 2020 17:09:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khyCL-0006T5-Bf
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Nov 2020 17:03:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id s8so2607932wrw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 25 Nov 2020 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7blJLYjMdEaNh2dhpLR9C25RvuF/uzuAZi3O9yu30Pc=;
 b=KSInxctvqK6IH23Or4fmcxwpwf0vChowIU4vqx95ZTDXmmTcV6W8i5lZ52bsepEjIN
 qTU3BHq5ruk1bQpMOw0vHkfhZCotzNiTx+QJVIhjw0Gp6f6NKB7NsTi7gWkzQsHxwGaE
 b5xRFXgCZiilsfeTyMFHIRBTcZIUvSoqtGps4XPYowi0ToDmjJE6YUsXWSA2DV+rDiDF
 Vn+qHdQWzTpeszppPyjDeaKrEGT9HSKCgbrFGRdkJ9RffKR5NNU/aO8XrxtzZeuZV135
 dzWbHv7mdhuJlCBxvpLqHIwYnUAOL3/3OGs+Wxm7z/flKXJdGNrr0FzByE+/ZcRzCgmU
 ElWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7blJLYjMdEaNh2dhpLR9C25RvuF/uzuAZi3O9yu30Pc=;
 b=CNMeHF1HdCQqNaMvGxl6Q4zlvMMyhifiCjr9GWjsOoUn/Gzg8VjjrdX2F3oGhR8Kpy
 G5PRJUnZ5TQWl5bWTf8a1bvJTCoUKItXFGM68IEYEeih9ScMxLyIY0neQ6LOK7QIOFAU
 6dyHCndKm7cX+sothF0VkKu34wnAELq1KF9CnPS2DXqeOkPe38dnBEyolOQwWRpgacRN
 tjEEKiw2N6F6EgwrRF//bNf5xnKL3a872QeLB+UoB9XsoJ/ny+2qwxNJlHRIPHitgY6y
 RPJPsE8YpMvAuMyIbHLwfvQ44Yp4VEeoaV0ALP9/9CDbO3u5gP9ZObAktiE5vUdRhOhT
 shPw==
X-Gm-Message-State: AOAM531qmonBccrFqH7vOMRUbtNm2W3RtmDkGaWCaF8kA/JPRZlLPJZL
 Doc29qsv+IwAeIUVR8i5GzDKk5WPs/U=
X-Google-Smtp-Source: ABdhPJwJr0K/LRFhc3WnoWvK0FIoEdzUN5Tr2Ir8zxu5h7zWxOUDXxi82ErHH16eNiIi2xv7uxccOg==
X-Received: by 2002:adf:b310:: with SMTP id j16mr5146756wrd.293.1606323793830; 
 Wed, 25 Nov 2020 09:03:13 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id q16sm5672793wrn.13.2020.11.25.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 09:03:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.10-rc6
Date: Wed, 25 Nov 2020 18:03:06 +0100
Message-ID: <20201125170306.1095734-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_120317_463296_B2A957D1 
X-CRM114-Status: GOOD (  11.94  )
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
Message-ID: <20201125170306.b-n3pO4dauAYeB60CdfEdEmH66JyLJFnyjFcyp0yABM@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-dt-fixes

for you to fetch changes up to d98bccf10dd0f36cabee71a425381fce0908de3b:

  arm64: tegra: Fix Tegra234 VDK node names (2020-11-25 15:33:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.10-rc6

This contains a couple of fixes to device trees. Among other things,
this restores suspend/resume on Jetson TX2 and makes USB OTG work on
Jetson TX1.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

JC Kuo (1):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1

Jon Hunter (3):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 12 ------------
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi            |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi      | 20 ++++++++++----------
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts     |  6 +++---
 5 files changed, 15 insertions(+), 27 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
