Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07339C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:04:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6E1611AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6E1611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RaOoXIUSg2jHRG308N+tVD8Fl2R46DoafkYRwtY8tLs=; b=bpnntMcvnyaowo
	9F/DjunETTpjIpv8QInU7QOQvoMJtX/q++S6D+bkmzDhLByoPahnQggODUI2uqOQ73u7GmQFBLP9h
	+tMsjXdIGgTcvaETQ8g4Xgn4u+iFnJNt4EH74+1WCye3U3CJv/uPWMxvrgtDuVgD7ewgNooD48NaU
	eqciWonFPghrcmZsnNsxix9RplICP/QsBHAYjTyh6l1fM9suigH+WD0rxDEIRQn6Zq4HJaB4ButYD
	bdn3nsgWq82k+7avYt+JEBwoD1IKlXdeQ7TQMHdKlvd1npQt20kkBRcGOwz+F6wOk4ZUifsjN7s6o
	9VmYttIoErEaOUBfhWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3an2-00Cp1c-2F; Wed, 14 Jul 2021 09:02:48 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3amy-00Cp0m-ME
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 09:02:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id 141so2341894ljj.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Glr3iLRAWPh3TJw841jqQiLsY6cVS6fOsaPgnbpItW0=;
 b=xLzA715oqAqRjuvl5ZpLt8EntiG+7AFNXkDqdq45X/76w10kH2hlk6Zgz28gbv4hss
 0umHJy68MRJPSuKolrhiphFf8Ts1fBpY+rVx21wIWepNwLJobyqjxsDwt/SX253y4VH1
 /zB94jtGZwyZlZvvcfLkuTjGyUk1+s05LchmJrO8JFULR7xkpIwv5d8+zpCfCsJvqzIX
 Pov83GJG0qtOrmljUk1OG8u284x9KKRkGCN7DiL0lRZ7Ob2WTLFGf9grpFeAwrrmYSFO
 8v/Y42d2Xhk2b7BHpQfsQWS5QG70pUWrw6fkuwIZALux+PCFN4BJqIKHgWt9ECHun7PU
 MS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Glr3iLRAWPh3TJw841jqQiLsY6cVS6fOsaPgnbpItW0=;
 b=XJOYmaSAilbqC4y8TfB5mV1iOprsgBZYYcL4Is7xOVnNP1wW6V01sOD8KuQoLIrCft
 tYtgm2n1kyl6GE1JXwH1SwEXdFLftB7dOsvAedb6LZmHRCd8OoTuKElxQDzma2TFlftH
 CHLrlZgRS+PgO5R7B35WnT96KltFCb66eMNtXUVkh+nT3BrQ9nAe0x0+6TboY7npe5ea
 8qplfy9DXKXLr1ywP5j2KeMI4hiPyqvBajZw6AenIwXmc1yvezD9YT13SmB02ibZv4zV
 kws5cyaTIfTvTWS1P2P+5ghbaWrZ+MKLZcQ6Ns87L9hJ1gSyG37t2rV9H8J2H1QOnu8/
 2lxA==
X-Gm-Message-State: AOAM532OLJvCeSZ8cWkFDOGWJCPW/qgQYt6EMaVrWKXUpdcIpe2glZH5
 HvrI3Tq7gZ7KqXHbxUSqH/xVZQ==
X-Google-Smtp-Source: ABdhPJwa3++aYCczrX4i+LfcKkwRXe1gyCq+wIYz8+NiJ26uVIJsO1qOwZetb5DZgN3sfQa+ijSpZA==
X-Received: by 2002:a2e:a4a6:: with SMTP id g6mr8233830ljm.152.1626253362526; 
 Wed, 14 Jul 2021 02:02:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id r9sm161429ljc.62.2021.07.14.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update RealView defconfig
Date: Wed, 14 Jul 2021 11:00:40 +0200
Message-ID: <20210714090040.182381-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_020244_839562_9D8F1E01 
X-CRM114-Status: GOOD (  12.24  )
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
Message-ID: <20210714090040.F5B-Y6jM_15S5EJ6M7wZOZVCe6wD-bBQrt9q44OodDA@z>

This updates the RealView defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- The CONFIG_FB_MODE_HELPERS are not needed when using DRM
  framebuffer emulation as DRM does.
- Drop two unused penguin logos.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/realview_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 483c400dd391..4c01e313099f 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -64,11 +64,9 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_DRIVERS is not set
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
