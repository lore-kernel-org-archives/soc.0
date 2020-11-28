Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D49FC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3E724682
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2tgFt7h3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5zmvNWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3E724682
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vp0o02oRFnjUzmU0y/Z2O7fdFWOkSO4oIDOSVieYUuA=; b=2tgFt7h3kJIrkWJdINNvlvJiA9
	tDsFxr5AzxQexfw+lUjAUpHTOimAUPFqSZwcZOF9CYhWGZnYSBKfrFfPycAp6yEJs+JiA67/97hfp
	bZFn1bFEEtYF/xIkhRjfI45OHYqFWxGn+8Xcr1ERDnhRrjn83x9XW4ye9QQ/5FU6pNxs/FifdBPvc
	+vgbw1AXQCOVnP2zdXKuaK+i0KnhHE7uUqEL12oh5dbpa7wWk982xuMQdQzkqtjrn1xb/zoLFgvQQ
	8Tu37sUDu3ivQeLNhKmODyJLpoyvpgl5l3qCOr0wOljusAdeejK4KOjsAj3QkjFd4rZ9zno+MIN2k
	Nth9BY3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3B9-0002A3-G3; Sat, 28 Nov 2020 16:34:31 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3Aw-00027L-LH
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 16:34:19 +0000
Received: by mail-pg1-x52f.google.com with SMTP id t21so6783433pgl.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 28 Nov 2020 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCLiFWd4J+vKotqakdIB8Vu54cAoqpPX+f9TGuaSpEo=;
 b=K5zmvNWvp4Cin9wOqEKm7Y0y8JbB+WMgD0DzqHxT9NInQCA9b4w1uHvyCjJBzJdsZZ
 7rzTvVddDcuP9zli2c7/XuIapVE5QbyDqIdD0fQfQ0lN4oVjj5ydONJIgWgor0J0bd7V
 klvS8hWTO8uxtmLEHSAk0JKEmVCu7OI2F0RM7hg93tqpZASCaaxFXw0shlEH2fqCI5IP
 aEbssfEa8AyjBbajIIywjM1xz6fI1FIdGaXccS1b+OomaCSkCdw6fe1UUr+zM1UNHPM+
 v6m5Yy3+O7ye+4OEp1NyYTOqPRkXW+1S4+ViXSGFGwqsECDBbns++lvn41MOz0aLiXvi
 tgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCLiFWd4J+vKotqakdIB8Vu54cAoqpPX+f9TGuaSpEo=;
 b=Po2c6aSP8vV7ikRdTlWJXg1c6W11di0N/N9HEeLqV/nflcz91/j6xa6Lcb+f4XdSeR
 kZLXbjqGk92Xk+bW34SjSQH/rJPC2kLTrMpcof4TCZChBajmZA2B79BNrjmBo+ygKtD0
 XTYn2oNO2YMsknkkC33zOsHpg91gIH2iVcr9Qeledt5PL6YdjhhJDeW3KYpa783vE0/p
 yhK43YLkm2hNccG0UCn116sanOBnoH+ccLgLw6O0HGDTWJGQ/V/XnPDusP0HduQIoLiY
 pMHhwqAf3Klc3KwtPwQOQFzAN7zCMxGVTd+h9phfNsqdxHcoaGrYkcqgwva7VOauRYb2
 m01A==
X-Gm-Message-State: AOAM530ZJAmOSftQJjeCC/MIvcoeQGeR/Ht9USfftOvAZBqielde/g9/
 6qi2g2Y4dT453cBvMbc/6oM=
X-Google-Smtp-Source: ABdhPJxms06FPMOt1vaSjCpNqcaqLgcapG7a51F4VJ9js0nmohXWUQ6oUFH6rxhDzz+j5MKVjz362A==
X-Received: by 2002:a17:90b:1918:: with SMTP id
 mp24mr16193503pjb.45.1606581256498; 
 Sat, 28 Nov 2020 08:34:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:34:15 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/5] Broadcom defconfig changes for 5.11
Date: Sat, 28 Nov 2020 08:34:06 -0800
Message-ID: <20201128163410.1691529-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_113418_755177_8AC5C481 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Sudeep Holla <sudeep.holla@arm.com>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128163406.ngT_SnEPU8HpcN0w2VOF6ASNQ0xTEEI5l2cTdQlP_6U@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/defconfig

for you to fetch changes up to 950be99fccffa920e148fd46e33db4d509e8af63:

  ARM: multi_v7_defconfig: Enable ARM SCMI protocol and drivers (2020-11-27 20:51:34 -0800)

----------------------------------------------------------------
This pull request contains ARM multi_v7_defconfig changes for 5.11,
please pull the following:

- Florian enables the ARM SCMI protocol, and the common clock, HWMON and
  CPU frequency scaling drivers since those are used by ARCH_BRCMSTB
  platforms

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: multi_v7_defconfig: Enable ARM SCMI protocol and drivers

 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
