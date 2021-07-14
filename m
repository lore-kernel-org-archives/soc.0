Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053CDC07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 12:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A4F61396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 12:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A4F61396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=neRHuWvI9bq6O2i25R89psKes5AaSmkgEd2TxBepf/I=; b=1W7Jm/LbU5dbX6
	bUkkDz4kO9BxTUxGYWdfHNTonOJj7iKu1wVFcegyl/UXigOoXvTBd3TrQL7Gke6lY5wh7En7uU44c
	iyPrc2CetwCeDbAXNXVSOyvC60gcZznqARY+PebYF1EVjlS6Juaso7S9VTBfPDJcweiXFWX3P+UzQ
	viRUNg5ry1Sb/AXRw1+8VVt7dmEpJbU02rjgX6r9hd0xLUv4tff0xolOq50tFC+9g79NAPcmo4rTb
	2L8sHFjW60PwNMRKy0IRTeZLHNk3rrZnnaCgUAvPBGex0emUp26son7yViPu0FkuBL2Ycjy+c3q0+
	1Mklt6iyo1B+81Cb3MHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3e0m-00DXjF-CX; Wed, 14 Jul 2021 12:29:12 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3e0j-00DXi8-3D
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 12:29:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 8so3265152lfp.9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlpXWYOq8PAFMBU6sDvuljQJ5yI9oKIOvoGdtgIJ6pg=;
 b=oV3Oy7gUK14rxwxyvu3/u6mG3xJsEyTdaWwi+sPUjx9llbKqOPudHplyiWQm0gq+HO
 +99QcFCjKvx58cU3d1H7DQx9df/l4qXHgNreihcn8sXZ0190ErtYWGAEevFsRbajfFMv
 f0md381ng+Omb6GlQPU2M6Ngv5IDBWZ43sKK6FgHHMuCFM7zeKfDZwzTXbIehyDkDI07
 SB2RIxTj3DM+Z6wr3jqa/FM6aioC9K4ERf+sL/HWUvbYxLjpbgWZ2qeN0bqtyREq+bkx
 to+Etc9W2LROlhOb/KKo5elwSN2qqAkzwpoVi2dRvFZR0kD2MkiHT9anxwUaDMgmXpM8
 L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlpXWYOq8PAFMBU6sDvuljQJ5yI9oKIOvoGdtgIJ6pg=;
 b=LS+MIJfNOA0tm9gF5YvCtjX8zbSTFgYhr/53z+UWf/eAlX5GD288abNS0aXYZsi4r7
 wbsVtfJHXxwV1+sRkDRMR4N73shsw7QKpIUR6unybAjWILVKwY/nDVPkmW7rpRJkK5tT
 M6rtNimjNWhB3uvymk/gg3ECKMXchAq2hvyZI1fPKKBasizGzYfFh2xKZLMe3cbEfky2
 ctDhcv7QJmO3l6LMFeC20ztRw+GXORI1Er2ek3eAahdQ4hl4k3mS4B7UoQ465clNlkhe
 drRb6p73e7Lf5nB/HnxhjnrzKFOOQ1+/Jk6rpzPOqPeLFO3GbXxlmzTZ/nPWuhqHYVrA
 +D0A==
X-Gm-Message-State: AOAM531L3LsBBH/1NZs/Ge5GUG8stgf4SWrg3fRQwGc00CI5Sld+Lsl7
 xipZrRgz6WeX0FPFz0G0klW+Ig==
X-Google-Smtp-Source: ABdhPJxZPQBdu0qq0eeqX53V8P70cI6tQSAtXJR8KGBKufnfTgpsldHl4JeG3/Xk1+JG24YCKfOrjw==
X-Received: by 2002:a19:2d0f:: with SMTP id k15mr7966853lfj.237.1626265747095; 
 Wed, 14 Jul 2021 05:29:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id s21sm220960lji.57.2021.07.14.05.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 05:29:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: configs: Update Integrator defconfig
Date: Wed, 14 Jul 2021 14:27:03 +0200
Message-ID: <20210714122703.212609-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_052909_192502_B6C2CB19 
X-CRM114-Status: GOOD (  11.61  )
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
Message-ID: <20210714122703.KFa3nVDedBnNsx_aPcC4ckagR9gXpLZk_gYrGeihKN4@z>

This updates the Integrator defconfig for the changes
in the v5.14-rc1 kernel:

- The Framebuffer CONFIG_FB needs to be explicitly selected
  or we don't get any framebuffer anymore. DRM has stopped to
  select FB because of circular dependency.
- Drop the unused Matrox FB drivers that are only used with
  specific PCI cards.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for the v5.14 rc:s.
---
 arch/arm/configs/integrator_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
index b06e537d5149..4dfe321a79f6 100644
--- a/arch/arm/configs/integrator_defconfig
+++ b/arch/arm/configs/integrator_defconfig
@@ -57,10 +57,7 @@ CONFIG_DRM=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_MATROX=y
-CONFIG_FB_MATROX_MILLENIUM=y
-CONFIG_FB_MATROX_MYSTIQUE=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_LOGO=y
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
