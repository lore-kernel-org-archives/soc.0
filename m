Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47D9C64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:36:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54ADA20671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXVPm/Ub";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZST6Fw4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54ADA20671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jppPklvXzVcisx5zkYUfNhWFyYDHL8ycF/Q8o+r6UjE=; b=dXVPm/Ubj18t8t8JPa3w6L5zdM
	Z/AZfaKZ1ADDAaD7Pw66X/iEWyaSeLC9iyr3mnjSBKiG05DPI1mWxNebU2zGMDbyBQSsdVVHqfr58
	bYstDD36GTFGIwMcYiH9m/Mckmws5lx9qOSOnqndYPvNCzg9rsmgrQPvIYx+FoIKYdinVPzMg7At3
	Uf77ql0sYfH7jxabkALiiAbotWKb2d96hlYNnIE/3mRe5lG3M0KmCKE7IeGp/z7P8RHBlAaw1f79P
	GSbleWepgEHLqPcHNH4NZO81yLoKw0OH3SMZMSBoh67kTCkJcySfOMEUXLcyqIt9ssyzq5OmlUk9b
	ypMm6BoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEEn-0007I9-Uj; Tue, 01 Dec 2020 22:35:09 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEEd-0007F7-Oi
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 22:35:05 +0000
Received: by mail-pf1-x442.google.com with SMTP id y7so2116032pfq.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 14:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=aGQqxI7BSHJYya4XZgJoIopRrzfmqvdzORIcT9D0uPQ=;
 b=ZST6Fw4ysrrh9mw5IRrjK15bszqvlR0tzsmBb7hi7rvvThDqNFgndnCuWuX9E2Hxlg
 Tb3WINyOJ8l1oqtyVPhgA94aIWGaDcQLGCwtFZHuRBpvVVWYUuaJTTI4HfN9YqkD6yxr
 zSHmUUceg663ZShP2FdKq2wpwIfwjoq+vNqT70QVUaRlaBJ6HxBP7VFgsOpfBb9Iw6JO
 RFlnjl24Ul4HC/LJPVzvwP/SriL3+/u3GTlyeIgsDUdZ+KUQEi/R3/F/n2FjTXZyJ7CE
 TZyjzjyNcnxR0oKLt6XmnjRBkPa+Bi0RH0UvrBrlSabLDejiqN7qh+oOopiDKqqhxKQw
 xtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=aGQqxI7BSHJYya4XZgJoIopRrzfmqvdzORIcT9D0uPQ=;
 b=CtEa4YKSqGsU0IAC8t4Qfn2SqfRpxri8LeeO1gmNIR20wDpROpI6C1fr/l9QQHjcvB
 u3vti6rkJW4wxO+rpjohcEppW2OK7LnCqMfWnFldlzW9HRVbdJVRnnE6sahFa/sZgumI
 CafVqmQsf9bkRGggNS+VakStKzHO/cjB14TILfyYMVm4yOl9M3bhBHCg4u7Medhtpmw3
 jbJV5eKR8rv0dHflF+YOtBBZB9t4z0zjrCIxywh4lBIe3HFz83Gi5NYcAzR0bl6flrWp
 7sTvjbiIV/Lzn2UrHRqMidm8IbtIPSWM4e5oWDjw25wje9n2CvvUrdDW9CUw4rZXF652
 aEVw==
X-Gm-Message-State: AOAM533Dwujhe0NtotTCrQ9ZlDKHVeADpEXUVWWzCSC64QNbt4oX1nZN
 zDv86rKDUHoKoymFr/vZ7Xofvw==
X-Google-Smtp-Source: ABdhPJx2hvwzYerdcMG1+5d3dqSYH69vQm2/X3cj/bSxjESiCDASFmXpEinxjRhcHAb5PM05fycLwQ==
X-Received: by 2002:aa7:982b:0:b029:197:cb05:a315 with SMTP id
 q11-20020aa7982b0000b0290197cb05a315mr4533763pfl.33.1606862097360; 
 Tue, 01 Dec 2020 14:34:57 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q4sm587150pgl.14.2020.12.01.14.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 14:34:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] soc: amlogic: driver updates for v5.11
Date: Tue, 01 Dec 2020 14:34:56 -0800
Message-ID: <7him9ljgtr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_173500_028774_7658A4EC 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201223456.SLpWhD00-tQsIMX_xIpofhyKG4A_BCIgXw5_v_1ZvSE@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 1116e43e7e4be7c7d76578ffac1d3a73f4ebcafe:

  soc: amlogic: replace devm_reset_control_array_get() (2020-11-30 16:23:11 -0800)

----------------------------------------------------------------
soc: amlogic: driver updates for v5.11
- enable building as modules
- reset API updates

----------------------------------------------------------------
Kevin Hilman (3):
      soc: amlogic: socinfo: build for specific arch
      soc: meson: enable building drivers as modules
      firmware: meson-sm: enable build as module

Yejune Deng (1):
      soc: amlogic: replace devm_reset_control_array_get()

Yu Kuai (1):
      soc: amlogic: canvas: add missing put_device() call in meson_canvas_get()

 drivers/firmware/meson/Kconfig          |  5 +++--
 drivers/firmware/meson/meson_sm.c       |  1 +
 drivers/soc/amlogic/Kconfig             | 12 ++++++------
 drivers/soc/amlogic/meson-canvas.c      |  4 +++-
 drivers/soc/amlogic/meson-clk-measure.c |  5 ++++-
 drivers/soc/amlogic/meson-ee-pwrc.c     |  8 +++++---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c |  7 +++++--
 drivers/soc/amlogic/meson-secure-pwrc.c |  5 ++++-
 8 files changed, 31 insertions(+), 16 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
