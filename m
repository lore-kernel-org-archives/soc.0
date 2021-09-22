Return-Path: <SRS0=I0Tm=OM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B7BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A9D0610D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A9D0610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mD4akXAZi9UtXUhYoQfuHlcOE01RtS5aWEfZe/C6uYk=; b=pA8jXWcW3uOedo
	DpuSkJvNXBqEap90VKZiPV22OR6R1tcNEBLeEtHkYG98IwHmsQcl4fC7da0IBorhqEwUMbp/mt6DM
	8aHFjiNwqA0dl9P/xI4qrVWJbRAGTZVdzrGTchPwBQNE9r9UNhafymDiTjbAWLoj770AGD91MCRua
	i0K3I02L4asYPjLosQ/PzPTfO4F3Mdqd6OV0JSk69fIldM/ss3N6m2L8hyJwuxEGn/TUiMuOKOt+u
	Z+6dr+tBsvMKiqMLvoDvu9atWtuAoEgLynGc9WXCBhJpkUAWUV5h0IW1DADOdvGRquJQHQ702teGL
	lYPwh6MhgSyinls+m6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT8am-009Znb-H2; Wed, 22 Sep 2021 20:11:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT8ah-009Zld-Qs
 for linux-arm-kernel@lists.infradead.org; Wed, 22 Sep 2021 20:11:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id u18so16129489lfd.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 22 Sep 2021 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pboqZqvweFsIDQCFgGMzsUC6aFAkqmvJAemT89YbfKI=;
 b=M7MZdfWupPKwjytmjVcaZ2e5BrwSNNAaRMT+slF5tB46+1KjmiBf7/nrsyoeqQNCxz
 jv+GkOlQRSWziYS6VJ/XSDC3FSrID/zV4C+9eGlHLmBZtfvxaNaErSYElN0XesLZEtHn
 SpMNr5koTeXjUkryKkxg3T8ft/Zut6rmpPywIWG7Am2X8cjJIILCE2eDkwo72AvxsFOm
 c2+HU4BGaif+ctr6fLCUq4k/lC50k60lz8j2/8oPPLZ50rMtO2mHXzUYTmCil4G8hf2b
 DFsasfJW4FG6CsyRwTf6aQqjf4dKAv76fhjf9nt0bmF2npeK9qMuoh0brjMNYP7YvvWE
 YVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pboqZqvweFsIDQCFgGMzsUC6aFAkqmvJAemT89YbfKI=;
 b=BQvh8FDVIE7Fu/+9wmX8vB7lPQTpInRSFo+F7WHVgmTNNAZ7XCAqjwsUv4ppYuTLn4
 8kV39+aRben2oUYHDuXUrGomTWKyArBD+B9lEj+yDC+lajxD79aB5BtiulMGRC7sL2IT
 GPDzTJMMrsfZ9ZL/33t0k73EgxREYHgH5VVqu4PGULo4Rv3oEUZ5PooLIH+2aImmU6ly
 9aOPm0l0yE+slTaUe8MGmzkDrJtEWnSVSw3COwnGTsymClPfB59Buflr8fPbF+Vgksig
 JFCCZjc3oknAJ4K0N4kzIhi+3c6mxlUZR1KXRA7hawhTpaHmKCMYGBJfFE+LEXJm74Wq
 46cg==
X-Gm-Message-State: AOAM530FGo2x70EUGfbs+3yI9+wi3baSqXmXRMSZJiUshvlDaeQwhlaF
 V3hxy3NULpgTVj4Il6dNvnxGlQ==
X-Google-Smtp-Source: ABdhPJzlj7Hv8wwmjXRXtHIl7SZrzTXpH2aLDjGBslS3DBdRfXGbq8ZtxT5WJycOt6O0mucWDk7Pug==
X-Received: by 2002:a2e:1510:: with SMTP id s16mr1140306ljd.119.1632341496966; 
 Wed, 22 Sep 2021 13:11:36 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id b7sm255147lfj.19.2021.09.22.13.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 13:11:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: defconfig: gemini: Restore framebuffer
Date: Wed, 22 Sep 2021 22:09:33 +0200
Message-ID: <20210922200933.1825752-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_131139_917593_FF8928B7 
X-CRM114-Status: UNSURE (   9.54  )
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
Message-ID: <20210922200933.i3yWFC2gRD81JCoM1iWOZhvQxUc3oHUycz5h0PFXbiQ@z>

The framebuffer is gone on the D-Link DIR-685, restore it.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks, please apply this directly for fixes.
---
 arch/arm/configs/gemini_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index d2d5f1cf815f..e6ff844821cf 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -76,6 +76,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_ILITEK_IL9322=y
 CONFIG_DRM_TVE200=y
+CONFIG_FB=y
 CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_MON=y
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
