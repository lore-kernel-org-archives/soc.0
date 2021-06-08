Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E0BC47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 12:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5742461287
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 12:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5742461287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H86Oy0pu916NSXSAImi6uWilDeV+h5oi6wKewGGTY1A=; b=X2ofb7flX7f6qX
	MG9yXRXWTRrz6McAadCyDKKW0x5ahKVUefENOVKCbT/22HXg9nPMqnGstpppSxfdPbqXraXhinIg3
	F9iskv6Hvbfow/kjb8dRfvbkMDfOB9MgGNkrunDgNcNgOQdrq5zMXnjRS8bG9pgWq/YqVIgawqw9u
	l214ab0YOoDXo97xHJ5RBsiAlNwU4P+9vTA55uW4ooEkn9d3N62/XKFMCSvF+cNZM63koga3Qt5Ub
	6Nczdx/OX+A8BVfUhT6mdMudd2QY9J4ZL7RBRCqx+DIraGBbOqYJxHf7uw4QXs+6h9m9qaJn161Go
	iocgsxyn9xtko4CoRtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqavS-008NRd-Va; Tue, 08 Jun 2021 12:33:48 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqacd-008GYr-P2
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Jun 2021 12:14:21 +0000
Received: by mail-wm1-f49.google.com with SMTP id o127so1677919wmo.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 08 Jun 2021 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
 b=EvGQAy0ig/kqB6utTO/JurrQ9MQa5CwTxgV3sdiV5+oJpoTjap93s2deS/haLmSNEY
 krIR8Ws2TSJArJFnE9E8YyMXww27wtBDd+Fx9Q1PA4wKJFdov+JITYzUMLuxVAwajOtr
 uUWKVhq3y6oaWQRkIjEkl5NuDmxPBrExElbtL7dY5z7ptT/N5uAptRH4NIsVKRntjMPR
 /uoVmZuH7FLel//6MeivE0WozvE0cYJII+ovMlVGUVmsP7m/F5dlhkbAB3HMjY0abCII
 M/KhWbdV0arIMmWXjwUCm74i3zOAfXAVdnso6jR+DTWDVnRcpGHtZLB3iqfMx+dvZ3K8
 CHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
 b=C6pibWQqsjBls25r3J5/fk0EQAxbGnAM5UzM8hP6Cs7MGX6AZyU1BlM1s0WDjGPXnz
 MxpL6gOEN+1ZctrNSu4HHnKXkZ2mVM5VPqRA884QKQeAGj93Pi2AwHJ11YyJCkL5fTXd
 oS08DCkwCpLHJetq2ppKBkoc6ZcntAK14Q2v4AyF+/a+KnrCsb89Y0C5TAApVbM+Kpax
 djkQaAn1UmtwKWf6uBA9GCrabgRbBa06np+bSfmbjwTBvpMBmB5x9CnZMR7NemeIj3kn
 2f8+9oa8zVOk/lO4OOeHMXyWCfaqJMyzbjjs/RJ0ObiJFWcsT+aqVuprdFJbB0vKvaDO
 9+fg==
X-Gm-Message-State: AOAM532gdzTLkoDKjcclHiO9JVPdKUYZC6yk9wn3dQ2ko71n8ikE72CX
 BbUcQcH1rV+65ppQJzT3wSM=
X-Google-Smtp-Source: ABdhPJzlNf7ossuAEutPHptMsCAhcoSQO2f9IZYHdnyrWan50tHM/Xmk54r68EJ1CeNz4kcbd8Xj4A==
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr3992803wmp.163.1623154396375; 
 Tue, 08 Jun 2021 05:13:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m3sm20701968wrr.32.2021.06.08.05.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 05:13:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.13-rc6
Date: Tue,  8 Jun 2021 14:14:57 +0200
Message-ID: <20210608121457.3202430-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_051419_870568_21A69AD1 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210608121457.pFMckCt3OcI1o0ZU4GVXwddJOT0Je34MlGMFBqv-CDw@z>

Hi ARM SoC maintainers,

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt-fixes

for you to fetch changes up to 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1:

  arm64: tegra: Add PMU node for Tegra194 (2021-05-28 17:45:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Fixes for v5.13-rc6

This contains a single fix to eliminate an error message during boot
caused by the lack of a PMU device tree node on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
