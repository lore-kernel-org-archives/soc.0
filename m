Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88026C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE2E61177
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE2E61177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cS1iPDK9IwLg06g2W+7bpYk9Uhqjq53GKM6qEr7NEgk=; b=lyrk0SwGr0b1UYNY5iaqbO6gg
	Ph3W50yRpJrtquUErV9J2cjIuvZvqAqkRay8g+9sb06hMIIzhoY1MOEhmvc/CI5fxZ4vBfX1WIUN2
	1iJSUkN+wjvH198TufARa/1gCt+n1DHQmF9yZQtUvdSdIPHZKVvcfJZUwy7DuWhrC1qCZHBgPfCiZ
	XQl6sDykS3Pg2hYDwQF503Ca0dnWy5clb8MGguVHCqrDzX31hoxiSkmCx5pi+BlYCz+a/wEIGgu35
	yHnlgJguloAmcGM6Kfmto8pJVOvqIT42jh5YlBDA8uFD4FBt+Mw98keQjLPUq1vg76L6IFjP1ezIe
	bwod0Z3xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0pW-00GuCJ-5A; Tue, 04 May 2021 19:35:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p7-00Gu9W-0U
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vGH4gKVqMFGwtn6qnf+9iZ3a3vefAvfwW/d/3Z1krdI=; b=UPg6qCfGMWoZSorJIhiqlUSCwG
 UlGfMGr9LUSj+tBJBFzK2nNiY2qcEPfAtQEIfoxZnZ81ddNkDJjrqOAVhICcEWVfKBZ42r3t6ivOo
 O7V2XPCWotQ29aqziZveq/5C3RbQut6QfyTp8YxkLoRLYNFyzMaxUII5cFN4LNZiw4J6yT953ufiF
 RRViSqkamdZaxgiKZGNbNRp6jwKWFJPf8bNF0ehVG9IfWxqSXIZ/Npbj2ftQyf/kMtabAio3KjNFB
 YBG5hUojsbt1TDXf8sQAtW7Mf3YUwOSLf4ucdxqsAWmxubgquegSa3ngn/A3zjNsT73kUz7KZg5Dh
 RJ4qQAxg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p3-004DmI-9F
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id l2so10628901wrm.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGH4gKVqMFGwtn6qnf+9iZ3a3vefAvfwW/d/3Z1krdI=;
 b=zASfNWHRz1uXc+PDQtDVcFqPtvHY5VdiDHD/4G2VJOJAPRo4NbTO1z2H6LfZ4AzkSr
 tphH6TDrILepJSikB4SgPkvbuFbZu7dFWjLRTLZ4HPfKs89CWxWKKSDFB1DO6wbLQ5ay
 BICt9cqWGaNawYQVMPuxbo8RLfm1F7ph8A3Q1m/tP6w4icJDhN4inbGN93/Ofq//2CVu
 j7QIOi+VHU3ssXB64KWr2dTVK5VjMvtli+jFOwXFt1DWDCFL+bktD+2NWsTCfcoYkOJT
 QGgVVIYVl5kzZfyNxxnWsTyeRAelRQKpaSjFRJ+exqbjhav+RgiiOwJwQxRfR36JVrKT
 pVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGH4gKVqMFGwtn6qnf+9iZ3a3vefAvfwW/d/3Z1krdI=;
 b=gZrCNX42vpiqMtYsVYEPpQdC+BOB6YP3qFgyHe9bFzqEldDsOEHYrGlsnhzxUYWgQB
 tKdblJGOe2bONJ/RrggXmUiAgpJLVe2zUNrEYAGDfWOH20o0kuRliAkkXtVBzwtcu7dp
 Awl6Ij9G4NZVOAA/RPQXIs3s0LVI7QdUz7PfZ+qbKs/Vpw0TXr2WdQ05X9m+jCa+6ax0
 ttm99jeS7mrDnaU/bh/iJYHV6SAdRbpQQeTk6nnDCqWdgwNBtWmd0Ti0t4okt99V48Xg
 GkGZpdg2Zwb9/pnuKoyhU2eVpjpz6AIX/FJuwDJjCejZO7qH72b6O7L5ys4kwM50iiMj
 39AQ==
X-Gm-Message-State: AOAM5302R3effAROBsGYx46yS4QtBoLMyOD8K5zLN5Z+fLi+AttTZvSI
 /yJuIdK/plXK8NwmB1TUFAOvQw==
X-Google-Smtp-Source: ABdhPJyQHKfnAbPYhTTf6e5lMTFkW5CZeYWMhTWodx6MLel4EJC4lf+P/tfcTkGYStfLwQ/drNfktA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr33567229wrs.264.1620156905644; 
 Tue, 04 May 2021 12:35:05 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:05 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] ARM: ixp4xx_defconfig: add MTD_PHYSMAP
Date: Tue,  4 May 2021 19:34:54 +0000
Message-ID: <20210504193457.4008384-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123509_345188_89838DB7 
X-CRM114-Status: GOOD (  10.83  )
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
Message-ID: <20210504193454.ZVeo3D93_7mo3oKh37KCH753rN0uBxDRRWsDuR1rlaU@z>

Without MTD_PHYSMAP/MTD_PHYSMAP_OF the flash partitions of my welltech,epbx100
are not detected.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/configs/ixp4xx_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index e3bcf2bed25c..9a7667383df9 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -109,6 +109,8 @@ CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_IXP4XX=y
 CONFIG_MTD_RAW_NAND=m
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
