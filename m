Return-Path: <SRS0=86FG=GK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58217C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Jan 2021 13:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6FF22B45
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Jan 2021 13:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B6FF22B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J6werhmYpmv3mjUUezzcn6NECLkK7YLxkBdINWlRpr8=; b=BT3+dA5Ci2SO41ph8qLr53QaVI
	Lw3CVPD+uAkXpQy3ii+pMdyWoruVEEbzI81SOi2tMMEzyrABJXa7BzhUfuwYkfEhK5HQxbtkubszo
	aHvpmUdKEX0tWY61cYMFZbo31LVewVH4vKqtnLHF42hsmG5saal0szUrq/V9qFXsHjVnToOLtSEx3
	2u5cCG/YR/bEinsG3oAVTIrBx8HGmO4cnR13NRopBARhBgCowjLpRIQxEqQ7qCELwDaXygWk8qevW
	lgPwLJPIw0VFXkH5niFZeapFkZB06H3PWjclSSsb8iHpTUhldAd48zGThpJ/Su/FsdbM/5RR3RQVq
	pR/NiULw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxVFT-0001WX-8V; Thu, 07 Jan 2021 13:22:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxVFQ-0001Vm-7j
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Jan 2021 13:22:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107DMW21124013;
 Thu, 7 Jan 2021 07:22:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1610025752;
 bh=zx9n/lsjA2NjYjIEY+6vD1Q829vq5WkYbOvLXJLYazQ=;
 h=From:To:CC:Subject:Date;
 b=so5eldP1tdbR50ccHACYp3hVNo0vsx2DwkL50Hp/9DkBHVpZsH9V511oxTAjDUyZ3
 ju8IO5e8wg9cADUhDLl056KKxfE8KmTfqD3PS4U1CQ//Mem3tPBzCYTf3n7vUPQLsl
 anZl0/iqh4BgwdA2TY0sQ4kjnLU9bQqCeC3LBsmA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107DMW09101024
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 7 Jan 2021 07:22:32 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 07:22:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 07:22:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107DMWwS095650;
 Thu, 7 Jan 2021 07:22:32 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, <soc@kernel.org>, Olof Johansson
 <olof@lixom.net>
Subject: [PATCH V2] arm64: defconfig: Drop unused K3 SoC specific options
Date: Thu, 7 Jan 2021 07:22:28 -0600
Message-ID: <20210107132228.6577-1-nm@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_082240_378972_DC7F3185 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210107132228.i7oxmmBqe7POuVS-dp165MKyWCtr8Xz5KKThj1lEqgw@z>

With [1] integrated and all users of the config symbols removed, we
can safely remove the options from defconfig.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201026170624.24241-1-nm@ti.com/

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Could ARM SoC maintainers pick this up for the 5.11 cycle?
unfortunately, this dropped through the cracks as dependencies were
getting pulled together. I dont have any other patches for 5.11 rcs

V1: https://lore.kernel.org/linux-arm-kernel/20201112215438.31432-1-nm@ti.com/

 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..a0bcf0201261 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -991,8 +991,6 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
-CONFIG_ARCH_K3_AM6_SOC=y
-CONFIG_ARCH_K3_J721E_SOC=y
 CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_EXTCON_PTN5150=m
 CONFIG_EXTCON_USB_GPIO=y
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
