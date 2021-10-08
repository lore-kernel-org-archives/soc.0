Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A077C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4267B61019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4267B61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8Vg5auqOyjgVTA5zb2+TGZ/PKwv0xJ/UwkCKu2UjWI=; b=VnCYFcpkqrb+VT
	0E/KKDIxHX47VOyTd8TOtCU3jN5qjPmQNxECDv9FYGLURpcuLh3avaKvsXnY5Rn2zhlA0d3p8UwOP
	EOb6T/Nn3h970nwNyNUowW67V97GT/oNT4ohXI4eZTv9HIWsF7WKRmluvVo7+FWSxwtqv6ZIgvZMi
	XmSlKSLPvdt2NIWyidyxoR/d52jKtlnYphwF1Zp3/v8cnIaiGgz5R1fj9bF8iTB3/gj+mOu0Y0KvI
	yx4JhR76S54Y6D/GrYCc2Th7g4NeZJB9+mqSRrQrmYTghmQE1GLOA0dikL/mOz+7A0NYg8YqOhMHI
	qtF5kmkCnvKAbnxDcFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwDp-0042m8-8U; Fri, 08 Oct 2021 20:12:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDT-0042hX-FG
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id r10so33083041wra.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DuOD76MfsujRC/mf1UNyjK0xuxhstBg2jjBGBfCnQDQ=;
 b=cpSlimDtE43CAhY6fWlOlvfboM91zbP1jKnpGHSpM4FnqaHtQU+AJ6F5UiDv5959sI
 FRl8cWkl+E4qWX/qRJIMuZL+bd+q9Yi2QBEGItuMDvjHLbniSkcN/XkLqGeDhbPjz7Nn
 u4PjBCoCPDqDDp95u8AqFhKCeNAso1hpuWy9vziEtMdOALXDYkk4rtasVkCo8COVOeQO
 vsm/Jpc4IDDgnEXBIWQxknw6xLA4Bx2hR53AQSgWwyEb4oG8VvXTaOhHQaCEaqL6f8dJ
 FwJms3XVB2bCwymitvMIurOk1tvWz/Bq1MuMJBHkXptaehKOTMbBS9JM1XiO+T5fPKws
 LQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DuOD76MfsujRC/mf1UNyjK0xuxhstBg2jjBGBfCnQDQ=;
 b=vv7rkXeXNpiXzWAjVTVth4jUivySXYISjkE2doQPujM2HPmTw9K/xDsI8oYxB/5YtT
 h/m/ztMqtjpoTWJMiz2eA9MIIW1EArAkydAFjBgux7rK9D2hwMaJ+4g24s6FiZNrOGHY
 F3fMCnX+vI4P5wbWnW0Gql42NfPx9CA4BvlQ5Wlg6Xy2beAukELKzr3BPHOkaBlko3rX
 Wrq+HbtidGeMSoxq1OUDYseE+UPUxA1YI7RsOLhuLprThltHhJK8ciBv+OGYSMnWanCH
 5MdbblCJT1nxV0n50CR4RJgSRJjjdoMpvFDjXymaNyKo26E9qwqFHqz4brx4NSn7ZNIw
 iFtw==
X-Gm-Message-State: AOAM531c5U8r4tAIfiCLaoc91PlzvL4FfYhYQb889nwr5I+GHVKVaz/4
 WaXHWba8Wufmv+uzW8h64mU=
X-Google-Smtp-Source: ABdhPJw0aRE8+q0mo6vF86bB5SkpC9YG82bp0sXnutrRfW3iiUP3RCi61ArUw7K6IKRas6Ol7OxOjg==
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr5650335wmg.133.1633723898089; 
 Fri, 08 Oct 2021 13:11:38 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id u1sm11734161wmc.29.2021.10.08.13.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:27 +0200
Message-ID: <20211008201132.1678814-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131139_534539_794D27AF 
X-CRM114-Status: UNSURE (   9.57  )
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
Message-ID: <20211008201127.9DGZq3N_QhtR6n6KbEVYiOq9EpXL2k04SlYkfObAG60@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware

for you to fetch changes up to f11c34bddf8cd2a3107a7d11b6446c66deda9590:

  firmware: tegra: bpmp: Use devm_platform_ioremap_resource() (2021-10-07 20:52:24 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.16-rc1

This contains a fix for a stack usage problem that was causing build
failures on 32-bit ARM and a minor janitorial cleanup.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: Reduce stack usage

Cai Huoqing (1):
      firmware: tegra: bpmp: Use devm_platform_ioremap_resource()

 drivers/firmware/tegra/bpmp-debugfs.c  | 26 +++++++++++++++++---------
 drivers/firmware/tegra/bpmp-tegra210.c |  7 ++-----
 2 files changed, 19 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
