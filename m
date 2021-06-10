Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F87C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931CA613E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931CA613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5r2OsOcspaU/ivobxITHrumd7Zo+1EvwW+TBSeS/iSw=; b=FhvCNWYjkZ87Hp
	aBFUIQdzkxFzWS9Pqg1W5buojr7sBGbgXgIRMNUT1mVZuOJqcciukPMXKD4ItYcsuJFp6gO5GS6J5
	9MNk4UrhmXvPktz+wONvSaEVG/31+Dga5exwDzTWlh0ZHTR9uuHIOqkBLXAD3gQjLXgoBUp+Q7bo0
	ZWurAfkNnjiGK4Ir9YSpcAwh57KbSwct7au83ITRUJyELFsjYiPvBluyozf5n1Koa67cwUbsgyOUM
	ggOMP9Uu7PDn+aOJBrwxG/l/t4RHW/WtytWaxBQk0FuuDCU8tUOMbZt7E1aGVZjcnZuGZ44DFfhOh
	NV02XbXMW6CfFWUVxvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU6N-002t30-0m; Thu, 10 Jun 2021 23:28:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU6I-002t1e-HT
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:28:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so7087058wmq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fY39Ptk0sw5qXBAnjzWmLKrEgOiYPHLxRS1HTe3/ra8=;
 b=a/MiVDn1JdEQF9wRpjW4aEDvLn1WR4dUr3dVfjAg2cV8yAdEsdR/hsZXp3Qxwq21Sd
 4TI/x+j1vfVV5nfCkZe/1T6aPR+FAYy3wjVksI/ryDaU5Y7oyWLd46Bgi71YqG1pC/tv
 Sft8hMp55HpAxY15hgXgls8SpkoWrsV3I4g9FU1uDIQ8vuNEH4BF/dTOqshCjrPOk22V
 CTHZai335bSowLt1rNe7zUYkrGBMSkVtiJp67O7cCvA052LmtQTGXo067npFVKPZQkss
 IoZVnZXCLAbXcsmTGV3mVqp6AVlw17PUr7w/iLvuhLjf61YtWsjCCImhia2CbSCpiEKj
 1z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fY39Ptk0sw5qXBAnjzWmLKrEgOiYPHLxRS1HTe3/ra8=;
 b=ueVNJ/L0/OPyPuC9o8CozMYgsNOX3zTbQdVxebp7htYEQbm65/3QewXSXm1Uiz7r+N
 WikDvbh+YcndcIKZiVmsj1iA4AtDS4SivBo3UrJdhO5vjkJfry7Rk1H7k30sB760VbNd
 YdzxyUrl9W0WM1p2eySCwT638dwos4Rw4nlMYK+ZvVlbiP+MIrXnNg+xx8qjGHkV3rq6
 AuUDVQtYWCxD4fXrzEApTFysBcMz/Qu29Qdx9d3Bdc92FKDRjU+nPQlJ53n5HJjSpgJ/
 AFRR/DlRutDdpHEfx3/VJvv4bOJkGUxsnHn54i+4gktSqI6w+Zrwf4ocqZy4DIJ/mcGJ
 J4Dg==
X-Gm-Message-State: AOAM532kY4kDFKGdmcYSRDfP+3v4XCdjpoVDGpq+UQqXw+hqJEW6oMKo
 mDDmpnz5Lr4mvrs3Mg92y6dPUjmWsUE=
X-Google-Smtp-Source: ABdhPJy+s2yIZkcJEiGe84bEKlWeqiQEB0JakPzVhGXnIuj7SAMYOp9sVBFq4Je+XRMXvzk1PZe56w==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr17327237wmg.44.1623367716526; 
 Thu, 10 Jun 2021 16:28:36 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id o7sm5433527wro.76.2021.06.10.16.28.35
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:28:36 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
Date: Fri, 11 Jun 2021 00:27:14 +0100
Message-ID: <20210610232727.1383117-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_162838_609888_09266262 
X-CRM114-Status: GOOD (  11.81  )
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
Message-ID: <20210610232714.TZzrv4WInNCu9vMVhUj5vZYIjte6QORn14apOoLiY78@z>

Add Makefile entries for the Meraki MX64/MX65 series devices.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5066e7..033d9604db60 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958525xmc.dtb \
 	bcm958622hr.dtb \
 	bcm958623hr.dtb \
+	bcm958625-meraki-mx64.dtb \
+	bcm958625-meraki-mx64-a0.dtb \
+	bcm958625-meraki-mx64w.dtb \
+	bcm958625-meraki-mx64w-a0.dtb \
+	bcm958625-meraki-mx65.dtb \
+	bcm958625-meraki-mx65w.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
