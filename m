Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEF7C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:38:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DEEC61004
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DEEC61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHChlAGz1rNXPhBElojVdv0+JWvGW8swlwHmg1aVgcw=; b=rXLEeTDCQNLxkWt+dXr19xbf05
	9ZP2ANv+Vy49GJLAucL0qRstPwvQbhvtnF47bPV8Dca3kOHTNLdaOsmyRZl2IZyXm4tad82W4aaer
	1ZZ9WaJ1EtXHcXim6GeOJvOfC0/rZ0C5WzSmHp9lknKjDy6SeOUd0SJDjNzohjizArsaiiTh/I7++
	FmLUL05sDeAXX7UIHYU+8sLkIzd/Tvtyo70LGmzFJGomqOa7l1Q2LL5zZHlRqnljmWKBsbUylmtqv
	LKomKSbNaKXq0v3JXw+mazzVVlTenLP5v+z99QTZLw09Hm2z9yssUmTJqI8RHvc+T1t+EY6NWBQn0
	7F+AU3Gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRugu-009G41-Vo; Thu, 01 Apr 2021 10:36:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRugp-009G3K-5m
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:36:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECA2C61056;
 Thu,  1 Apr 2021 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617273397;
 bh=WDW63YezYw5yHa+C19nI4CxKQ4BR33uzdV1BAfusmvU=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=mbOvDEtVfpndYeMn/uoLK2lVUlkRJbkqhib0ZZD1kWnfAUQp7sWztDmMVCwfjcU4M
 EOy9O5/6wNsAKR/JIehMp3OzwKtPkh33MCMqFkb4SUid4EuMWqcSZhSBAUFBXqJL/+
 vDr8cHZ8pdb2bjjQdwrDQM4vOPF5Qr71Ej+MsGUeLtT02X21E84DFPBWcLJpjfNgcA
 igz6TIjbtgyEIXG8ar/9r/46PpbO0e7niNdD2WynzowbxZcrKgJqI95tIhoGRSl6W1
 4w5dl09xqdbzN1nn7b9shXsgi9i0xhjAkaxNL9KNJbkgkN6XhWtTuS7qVgFT/if2RU
 Uxw1s4u5gjqAQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
Date: Thu,  1 Apr 2021 11:28:58 +0100
Message-ID: <20210401102858.4095-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=+RbiIogrLT+K6jXTcLOETVTqp/e3MFeHurCtKlDVtnU=;
 m=SeDjL1Nm5xTh5K56o6KAegi9gkKz+jy4AWsqzKXb3mU=;
 p=8jyG402PKWoUB3KvWrU+GujYAu0FJGkyNOEkXGWm8J4=;
 g=42a7430ae9c7fb87483eb501d3ecb516185d9dd8
X-Patch-Sig: m=pgp; i=broonie@kernel.org; s=0xC3F436CA30F5D8EB;
 b=iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBln8wACgkQJNaLcl1Uh9DBVwf/VXV
 uJAcxkPWuT2jSRSofV7h4ryyqp9FYX8KPc/ADqLa0llsZDod0uUaLfmnT2jDmcGOnOIFkZr2DNCSk
 qi1/bcoOVBS2lSl8quyPz8YU3CxzyFJlnZbKShSdCSPPnbbAjWEL+W9X8nR5r5qEdMwKYs86oNqYC
 LpJDztRtIHe6bLZzj0z8u4QTjti6QzgTkfE9rCtPemeBEwcz4ZVdLhWCvzt3qClrBXny1g3Jv2Ax6
 ZSuuwwsJiEpmePRENCkUeKzhPRunJhao7hCihKr3XcX64cggLB4BFsJnJgGNbYqMHv5Y61betYBaW
 dPloL9BNUe2eNOshANIVKmRhb6dEpzA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_113639_684216_D9CB0354 
X-CRM114-Status: UNSURE (   9.02  )
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
Message-ID: <20210401102858.qyoI8Y8DfY8hM0Dzljf7e9AU_-l73gKqkWLAJtPm_AA@z>

The userspace consumer is a development tool, not intended for producton
systems and so should not be present in defconfigs especially not those
for specific machines so is not a good fit for defconfig, remove it from
those defconfigs where it is enabled. No system in mainline actually
instantiates one.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/ezx_defconfig    | 1 -
 arch/arm/configs/imote2_defconfig | 1 -
 arch/arm/configs/pxa_defconfig    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 81665b7abf83..a49e699e52de 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -213,7 +213,6 @@ CONFIG_POWER_SUPPLY=y
 CONFIG_EZX_PCAP=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
-CONFIG_REGULATOR_USERSPACE_CONSUMER=y
 CONFIG_REGULATOR_PCAP=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_VIDEO_DEV=y
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index ae15a2a33802..118c4c927f26 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -194,7 +194,6 @@ CONFIG_POWER_SUPPLY=y
 CONFIG_PMIC_DA903X=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
-CONFIG_REGULATOR_USERSPACE_CONSUMER=y
 CONFIG_REGULATOR_DA903X=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_VIDEO_DEV=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index bd7dd81c9c54..875a3c28a267 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -415,7 +415,6 @@ CONFIG_MFD_TC6393XB=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=m
-CONFIG_REGULATOR_USERSPACE_CONSUMER=m
 CONFIG_REGULATOR_ACT8865=m
 CONFIG_REGULATOR_AS3711=m
 CONFIG_REGULATOR_AXP20X=m
-- 
2.20.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
