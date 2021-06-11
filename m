Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC3FC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD1B613BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD1B613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOpdyvtBpdEe1UGIlHNUdyDw6a1OPxi/Gvt3vePnCjk=; b=jv/TtKmlZO4cpw
	dcEqhiDsAZkyNPHocNVPj737ViYLCmQCU0SSo7nUzXt2utDhM9HTsYg8mmIaM2DzyO9CuMcY3f21X
	e52865R+QzMwyk0SiDtETlZI7G5EP4N/OQhKHlGL64DNrPnN34MF1TnfH5dKjpPL8g5OSHdkkx3sC
	C9LmB9ZTm7jGYwkVa3ftMPr1ffjoDxxZC2z4lHGyTWMhuUSzH9HbQXbX1kQ6BLDpnGHvkGq1yyTXx
	5dNnCpUr+aY2OV71KpP8dA+R18qe6NHzBqYA2fjUwkWTJr34+v3LfysvQnE7EEuGNahqahgO7IYfV
	rHjhQx411idPK2Mu4Chg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkGl-0064ej-0x; Fri, 11 Jun 2021 16:44:31 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkGM-0064QP-DO
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:44:08 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso9017504wmg.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
 b=QA5BVIhdRSLFSHl4Nt2kT2P14yFLZ/x9o/azS5r3wS6A3DFy5r2knf3shzwsymne/W
 TiACsvGeFHuftNHEQ+LeZ/mzkB2stV9I/xvCadQ4fk7M3IxVpvomQI+t5WoBWX2bwG7h
 QVpBJtR/56OTEQhnaWLquAokQvUmTFo7mZWp0H1BXTz0PHjfAmOk8xywHZ8+H06zGyq3
 q6oP9pp3VpqWpJxCp2met1k5d6zniIHx8Ehuv6d/bg+6umfQgi11EDv2fwrjw0OlH1Zv
 stZPAZ/m0lg+V51fWQZX8NLMQv5uRR20oYe7hgliN4hgBoD/5DKPmMwbOktJMxmiyFzP
 NEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PGvWqmX79u2BDZddtKUNdJQ6hsV0VE7RF8nOBTNFPA=;
 b=SFnw1sY+DApWjOuKzWkqjoJH9kyU9Lw07YBhOkHW4rKJ3WJqdVWuX/42iO5PoTLZyr
 VzKOEEM7pNUmVKwi6kgqqDxA4f+O0qSy6qJYvsUzZfw55Ohct0evUmkwWaYJP89R5Vay
 inWGjD/yS9acA8y3LtqZkzKt+R1mAY0K5XRtS3tEBVQwqMfLfKiigWC1nOrwGvVVyzJ6
 f1tOKYwJbCfZcn+RgRI/kHiQ/bMRAncSz9e2xNE7WmemB5fGvvVqrQPhOjrmT8hSU0EV
 W/av+5Unf7PiuhxBuLBoMQKp/AuTTMqKm4KEhOdILZPd7bhbvuUidxCc/LhXeqkxYmN+
 FfTA==
X-Gm-Message-State: AOAM531wlfpYFGvRBaioiNJxownKyMk9bBo8HEpzNMFMZ7QV8Xv65uZd
 8PQmjVtzDqpEEH7sQYahC/4=
X-Google-Smtp-Source: ABdhPJx2UkSalCYd1QzObIlllEjvyEnv67FhhSHetKO+GWfONxgJYkAlN+YEcB4wtkH8YeCbtfpIaA==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr21577690wme.136.1623429785287; 
 Fri, 11 Jun 2021 09:43:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id l31sm6502345wms.31.2021.06.11.09.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:33 +0200
Message-ID: <20210611164437.3568059-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094406_505055_9CE0D856 
X-CRM114-Status: GOOD (  10.82  )
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
Message-ID: <20210611164433.9d8bqMAGlVruh1N-1hO2ZdURtZrGLfIU8Fz8SFxKf7w@z>

Hi ARM SoC maintainers,

The following changes since commit 380d2b2d5a0491e47dfa250b40e3d849a922871d:

  regulator: core: Add regulator_sync_voltage_rdev() (2021-06-01 12:13:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-soc

for you to fetch changes up to e2d0ee225e49a5553986f3138dd2803852a31fd5:

  soc/tegra: fuse: Fix Tegra234-only builds (2021-06-11 13:31:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.14-rc1

These changes implement the core power domain for the PMC, and fix a
couple of minor issues as well as add stubs to help some drivers be
compile tested more easily.

----------------------------------------------------------------
Dmitry Osipenko (7):
      soc/tegra: regulators: Bump voltages on system reboot
      soc/tegra: Add stub for soc_is_tegra()
      soc/tegra: Add devm_tegra_core_dev_init_opp_table()
      soc/tegra: fuse: Add stubs needed for compile-testing
      soc/tegra: pmc: Add core power domain
      soc/tegra: pmc: Add driver state syncing
      soc/tegra: regulators: Support core domain state syncing

Thierry Reding (2):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      soc/tegra: fuse: Fix Tegra234-only builds

Yang Yingliang (1):
      soc/tegra: fuse: Don't return -ENOMEM when allocate lookups failed

 drivers/soc/tegra/Kconfig              |   2 +
 drivers/soc/tegra/common.c             |  97 ++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra.c    |   6 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |   3 +-
 drivers/soc/tegra/pmc.c                | 144 +++++++++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra20.c |  94 ++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c |  93 ++++++++++++++++++++-
 include/soc/tegra/common.h             |  31 +++++++
 include/soc/tegra/fuse.h               |  20 ++++-
 include/soc/tegra/pmc.h                |   7 ++
 10 files changed, 485 insertions(+), 12 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
