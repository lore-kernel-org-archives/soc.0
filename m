Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA085C11F66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 08:22:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B494961183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 08:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B494961183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZpEkOgYLW/Khu9CuBxgB1H8+qjJuYr6iuhAM48gYZ4=; b=FAS6EP9sdZLJnD
	2YgWVK/hV8+dYM35xmgRtwtALBkaAKrY1l5fRbKlC3IwOhoua54yXESuwIsKUrNOKW9SOcIPHD84r
	Eyni+G++/ciQ3oMd5wiyVQ4i3XjVMxygRu/Orn+cW9Rz25ySiEAhIz3l/tIg1sL2jvnKvAf1IsSRB
	WzvuQC7cAtvwHt2JNaeu5UwU+jj3y++BRLK1I7wi1m8xMhgve2D6nOaZUNC91/sLuXiAqRNU2AZSm
	ymHH2H7HjSHWdgHfC85sUps0CUj9T1mOJKVLv6RN66ph8Zn3ofNS0gmC9lW2pD/CoJF4spYMydxLd
	Z2jJ85cee9wtbrfJ6Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3a83-00Cc2s-OA; Wed, 14 Jul 2021 08:20:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3a80-00Cc1w-1z
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 08:20:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id y7so1748673ljm.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IRPiRX2oKTcL3d1pLj17da5E0aRJGr1Bopad8cSB5+Q=;
 b=Ub051rjBzs2+QdF9/sVa6WEyJhQ046LDynRFFv1E6fggKFW0Q0HMhLqAqQi95XIEQO
 b3mgd1TwvHgC4msPrQ54rKGW3zqi90Tj7omWYSecGgSYJl7+q6jbNsjFK/KOnOF/yUSZ
 9a7OUsjB6bKGHVVHSSn7yDuhl7i0+m5QlsOgIc1uudaYZItJFqv2Bu+kaz+w12nJ63fZ
 bx2RmjqkWNQaHsp+8vX753fpkm132Z1moCM67r8bkpGTm2F3BU7w/GC48JZrVXhmVtRk
 LJxgPUubckufv7JDfFSwyP7odqL8QMDmEeYrBzxJdJULkCVcAZ/ocLJUBIZFwi7DnwY7
 Cgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IRPiRX2oKTcL3d1pLj17da5E0aRJGr1Bopad8cSB5+Q=;
 b=qJNDm438LB4mBrP/F7Fpe3PQbcSN43SQwk140/GUnmaEFIUetSNnIl/ehjO1ymN3zl
 1PxYOosJIwrTtwlqYyLLBF0XQOKfk9JvcylpFR7XU1SRos1TJJyd9Z+FvJ8f36IKBwIP
 myvQnOk5komz0TN+zBwq/MDDZjzpD+zY1AwgFIem3bFYyB3hLtyAacCkr7ZEldEqQTnO
 AjDRve0O/V1fIg6XYp5MinynRBYa0nHB5YJXV57vdx/SIuCnh+0X1OmVXwyhZRawTAKq
 nUgSbqdfneGmSUo+mmcl8bOj5FoKXvOkY0ozXuxSBAMqQQcv9dgfvEJKVx9ziznf32pT
 197w==
X-Gm-Message-State: AOAM531szJqftDpYtAeiFammA06wy/A/f+K5aaUusLSZssCvFCmc2Oob
 vg4ibMjtszntNtDufxy/MdX8Mn+M50TReA==
X-Google-Smtp-Source: ABdhPJwWNJDPZNfvvWcse7DmlpiYmGQt0DWmDRx6bGewXX+ernbwA/BSOaqL6/alCofEnbdPiLbJXg==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr8405854ljj.184.1626250821741; 
 Wed, 14 Jul 2021 01:20:21 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id q17sm155210ljp.3.2021.07.14.01.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 01:20:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update Versatile defconfig
Date: Wed, 14 Jul 2021 10:18:19 +0200
Message-ID: <20210714081819.139210-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_012024_142500_8B464E4C 
X-CRM114-Status: GOOD (  12.86  )
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
Message-ID: <20210714081819.gY973lWqKhJUqRDUdxwkC1LNxCN1Om1-W_DY1GpIIhU@z>

This updates the Versatile defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- The CONFIG_FB_MODE_HELPERS are not needed when using DRM
  framebuffer emulation as DRM does.
- The Acorn fonts are removed, the default framebuffer font
  works fine. I don't know why this was selected in the first
  place or how the Kconfig was altered so it was removed.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/versatile_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index e7ecfb365e91..b703f4757021 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -60,7 +60,7 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
@@ -88,8 +88,6 @@ CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
 CONFIG_NLS_CODEPAGE_850=m
 CONFIG_NLS_ISO8859_1=m
-CONFIG_FONTS=y
-CONFIG_FONT_ACORN_8x8=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
