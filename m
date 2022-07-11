Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCD0C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 956ADC341C8; Mon, 11 Jul 2022 16:45:19 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5B87C34115;
	Mon, 11 Jul 2022 16:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5B87C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id s21so5287192pjq.4;
        Mon, 11 Jul 2022 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gvq9fRocj1mv6TDsG70Rw7WPOwdlIYO2EV775Kn6cYk=;
        b=HYD1qirsbo/HdEtwANxIt1hBprhFivEtbVyyYjfF1u8t3/yV7v9QXz/32XtXHG+w+0
         26ezlLlDgK5C12I46GkokoqYzf1lB7OVb/ZcuCzLc05nYCiY/VX/QjCdOPlFXdsBvbmy
         oaPDsvHAkg4wmm3yd0UX63rXE1otyGj2EiwcEJwmqhhVpBdnTbj2OlEgkNZIwvC98yU3
         hUGLWbam3uLNMQWlJ1x7qeGSErFWySFemlO8hqFMoRQu/XWJM0qx1ineHJCTLB/TTlqv
         2ieqx2Kc1+U7ep9B/cIcCjTy37FwBsYwazr+KOJrdQ9T8knyTq0Pt0iLHHjCnrszWyK/
         Uk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gvq9fRocj1mv6TDsG70Rw7WPOwdlIYO2EV775Kn6cYk=;
        b=E3f/gIBknY8k+hAd7L3AwTh3znqgLdPkMuwAfkq1TrvQSB5/5CNX03SdsORHSuc6KF
         5xy4GSjYnP5gpw/pQQKGqjtsDGrRjANBwKFmId2tk6a59DEByP58kIBHy8UjqOfnSFwO
         LQIGbOd/IVlqP3KWDuNWzcdTSaF7qrKMJWu5Rhr50GJSizmJyDfuMZsLnpImY9tLWs9m
         8dWMJd+1PXnNqYnzEUCFeLmoP5AUMApOhsuxH8nQOaJiJuJTirPngl2rqx4GqIH/3Rlb
         nHGZpYDr/poLp07DqDmWtfzGzVAGpzY65CZNx+wfDsdvZs6GwMAUyqLCaQA4J40Xb8Kp
         bV8w==
X-Gm-Message-State: AJIora+ke0TpFQ+mHSRevSzrKsHgjl3rWC99R1TFShm1eakiTYESl6/9
	q4RU6s/1zRKjD8W166P++jdYQwZsekY=
X-Google-Smtp-Source: AGRyM1uhImqejHVtqYUd3puZvB6zOT8Z3fNCwmmZVFB92HXoRVxwb1+208PCziB3Qf283JwI9DcMpw==
X-Received: by 2002:a17:90a:890e:b0:1ef:85d5:515d with SMTP id u14-20020a17090a890e00b001ef85d5515dmr18997241pjn.109.1657557918054;
        Mon, 11 Jul 2022 09:45:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:16 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 7/7] Broadcom soc changes for 5.20
Date: Mon, 11 Jul 2022 09:44:51 -0700
Message-Id: <20220711164451.3542127-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/soc

for you to fetch changes up to fa0ef5a086a05306fc5322bbda73459725eda923:

  ARM: debug: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA (2022-07-08 14:08:51 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers changes for 5.20, please
pull the following:

- Miaoqian fixes a device_node reference count leak in the Kona SMC
  initialization code

- William moves the 63138 support code to use CONFIG_ARCH_BCMBCA which
  is how all of those similar SoCs from the BCA division are supported
  moving forward. This includes machine code and UART low-level debug
  code.

----------------------------------------------------------------
Miaoqian Lin (1):
      ARM: bcm: Fix refcount leak in bcm_kona_smc_init

William Zhang (3):
      arm: bcmbca: Move BCM63138 ARCH_BCM_63XX to ARCH_BCMBCA
      arm: bcmbca: Add BCMBCA sub platforms
      ARM: debug: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA

 arch/arm/Kconfig.debug           |  2 +-
 arch/arm/mach-bcm/Kconfig        | 61 ++++++++++++++++++++++++++++------------
 arch/arm/mach-bcm/Makefile       | 11 ++++----
 arch/arm/mach-bcm/bcm63xx.c      | 27 ------------------
 arch/arm/mach-bcm/bcm_kona_smc.c |  1 +
 5 files changed, 50 insertions(+), 52 deletions(-)
 delete mode 100644 arch/arm/mach-bcm/bcm63xx.c
