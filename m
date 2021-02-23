Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A45C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8EB64E62
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8EB64E62
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=unxO0W5TK57qMapzBwl/jOzXJ1QFq4t8N3fulXZfav0=; b=wB5pY2FUVlju8t0J/v+Up+fv+
	4r3qL9oV7tjEM2rLlmzh4RBfpDR2mjdZMuQYWZ4XVR2S41C8QLbsAXiXvi9P2ayK2U+yp7b/EXoaA
	fMilcMcnLVcAUzeyZR6yyLRY7BadDuNxgSCHy3DG+GHBQfFuAqSnR3Sp8N0GamYFQltZQGvyQET72
	LWZrZabWhFvavmaZ034KM4m0GNJuUvx1I4uvHuwTjMMzIpy7IYVmxY3zwqXxQEUMdsuSrzAByt6rp
	lJNFI9eZ8zN8B8tAM7MCNMhremF1s82ogZ1TStWW8KcO866EpbeKQIZgjvjOPQTC63iIoJp4LNfpI
	OjysWl9Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER2h-0006od-2d; Tue, 23 Feb 2021 06:19:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2Y-0006lW-CG
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id u11so9188866plg.13
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
 b=DeXXljYGddSCbpsw5yQZDdWWq/dbOTy0CmpXadmiPDNqrp0kPHRgRzwK11zwiGd6AO
 BY+r+BrMSNGMhKk+KRhiTLh2ke5g/iRd1c0XY2bJIWXOC/JSLO4AUt9qWVD5qNlZIcOE
 vlc8lAkWXzdwQkm1q3G4APE7sDzXfl4MycAic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
 b=mJs1BfzSqCmAhTHYVbE41DIhXdriGWU6b6GW1mrkh7mSobWlJH8+xzubJkbkjMgJC+
 t/kfJDsEgSqYAA6zs/19mFZRSpfwFu9VENxXDq6wRJ/dI54+gKwC1sjvkS0wbBzLDrwy
 Z6bbRoyqfXOQ4FyqrU9d/fJza/wyZsU4TYLz37ARhjlR4jXz1r8OLO4hxFSpHa3RRKJM
 SplULxZuK5T8OwrwyV5Eo36FAc89EBta8Ec1QtZKVyPB6aI4qwgIaA3dJHfgRPNF1nWr
 Tiajbj9I2QUVqGi2o7zvyzbtH6Dh90cHwSyK2u5pJ3ewQfDhhzTAGR5+fmMBvF3kwqjC
 Ju2Q==
X-Gm-Message-State: AOAM531MzK9z2FIY5nuIAlIc5/DbxeDgqzwU+nZ8khOn39lRMRgEMngf
 gp18Xl/aL24/tMczHyXoVcPV2w==
X-Google-Smtp-Source: ABdhPJzUFcIDoQ53XoBGFCZHB+j9nJd4ObgYI5HbP5VqqkuvxkGhU56VmEE/a/ZFZLF7fjsQVyhI2Q==
X-Received: by 2002:a17:90a:ea88:: with SMTP id
 h8mr27156943pjz.154.1614061160369; 
 Mon, 22 Feb 2021 22:19:20 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:20 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 3/8] ARM: mstar: Add cpupll to base dtsi
Date: Tue, 23 Feb 2021 15:18:25 +0900
Message-ID: <20210223061830.1913700-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011922_868183_A23B8537 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210223061825.yme6GLgnkQVDb8clg724pdeUtdaHTUW2UxTOt2RjgpI@z>

All MStar/SigmaStar ARMv7 SoCs have the CPU PLL at the same
place so add it to the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 075d583d6f40..d323c1a3f3c2 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -132,6 +132,13 @@ mpll: mpll@206000 {
 				clocks = <&xtal>;
 			};
 
+			cpupll: cpupll@206400 {
+				compatible = "mstar,msc313-cpupll";
+				reg = <0x206400 0x200>;
+				#clock-cells = <0>;
+				clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
