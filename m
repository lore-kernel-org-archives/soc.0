Return-Path: <SRS0=Tcyv=NL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1416FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 16:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D265160FBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 16:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D265160FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I5slhqsaQa0Tu7yQJrBOsVrVlUTBtQr3fjVpHu86Z7A=; b=bKjoFh/VWPZEk6
	FD28ZUP66i52L/tY0XqfujGS5OR5IoZ5aq2ST1P1wfA2M6Rs1virrPMdW7wJ2LVERo/fvvcmmxMR2
	PTfAfk3Ovc/vGljnkPF0Xon2ShHf3IIwFniQ8j/V+eZ2AM9DTw43/xgilbigIy6hR5tO645pGEKQe
	kZqC/cQrtsw5WDbQAIf6Vll40+aVg2rghxg7ryfukoyl2DrfQsHFnmunvjznJFMQ1zCixOEPL3XcB
	MCiD/OaNQhckwjs6yPoObshngEZkxAA0UjZ+zm5g8zpoEDLjoDhGIdJ0bE07wGQW7DP/a0Ff9BXwy
	cnsgrm76acAUxAkDp4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH7ik-00BfvD-Mt; Fri, 20 Aug 2021 16:50:18 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH7ih-00BfuA-GE
 for linux-arm-kernel@lists.infradead.org; Fri, 20 Aug 2021 16:50:16 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so15114990oth.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 20 Aug 2021 09:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tjr8j38/Os90LSyEfVorRWiWmsdEDRT1v3ba1dHBUUE=;
 b=JCfvU/FPKiMk7V0bh33UjcAowM4OstpjCgIE7BSRkXy5EKe1x19+pWOwO9o2tOwXsd
 fuTeixJSI39RaNm+M+h4BVEeBjaHHiuyif8mVfgm7I4h0Ys9OihBjwEhRcKifrXNJqHR
 w3BEfOEtcgv7PhBeNlN6rZZ7LKxMj9fgYJR8psHQDrXjpqan8l2pluufnnGAnWS2NqTG
 yqprRqA3T3j8PZFiyVtycQJQQpVSaQfZEn79keobGq+PM7KGUX8DO0j9Oz8yW+XqC0GU
 RrHCmb2YgHtZTaAZzaJJfSdWSvQvRqIU9pS62fQmbNzNtgQ6QWuoG5bOpk/veV+KYCA4
 X2Ig==
X-Gm-Message-State: AOAM530nCnV94IAwAurKK938mkI5bSo2YRjtZ+Dm5fdnr0tdOvO+QlFM
 2s7vlmUX8dwoAFnx8/fgtA==
X-Google-Smtp-Source: ABdhPJy5fLcI0xBVDHqTw60PRbNNC2mIVzZQpGLTCC3DLbu/aupFUri+AAM0yDq7nqUEeb2bZZBnGw==
X-Received: by 2002:a05:6808:140c:: with SMTP id
 w12mr3725698oiv.22.1629478213602; 
 Fri, 20 Aug 2021 09:50:13 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id v11sm1601771oto.22.2021.08.20.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:50:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, soc@kernel.org
Subject: [PATCH] kbuild: Enable dtc 'pci_device_reg' warning by default
Date: Fri, 20 Aug 2021 11:50:11 -0500
Message-ID: <20210820165011.3257112-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_095015_603430_B1AC5611 
X-CRM114-Status: UNSURE (   9.92  )
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
Message-ID: <20210820165011.2YI86A6oj93OXkjcCgoA0HRSt_RKgsuHPWRCCyeDajY@z>

There's only a couple of instances of the 'pci_device_reg' warnings left
and they look legit, so let's enable the warning by default.

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: soc@kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
These are the 2 remaining warnings:

arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi:464.3-52: Warning (pci_device_reg): /pcie@f8000000/pcie@0,0:reg: PCI reg address is not configuration space
arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
---
 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10950559b223..c57f14ac6f99 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -309,8 +309,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
 	-Wno-simple_bus_reg \
-	-Wno-unique_unit_address \
-	-Wno-pci_device_reg
+	-Wno-unique_unit_address
 endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
