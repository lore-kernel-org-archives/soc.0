Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0147D07D
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699433; cv=none; b=t0tyOyMDnZegZWvlvLUuaxO/com8uj6bRkDMWYAzFxftiUphFqP43mcmsgP537HibsviUknnh1RXOaA3E2J+vCUVNAm/7l9nF8enjo5g85lZyPHKWuPmwaoxXBMqOC2nKscIQhZl0LVa6ykjCmGKW5SuE2lzHnx1NcyffMh+EQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699433; c=relaxed/simple;
	bh=+VhWi7/d5K/wLb3DYGRz/98UMVFoH53OpUTiZtBVj1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=It3fwYiG2VhfVepX125VxncHxfApuIjWHr8TqZ4+vHhvQ0UF5EWx4djeDULvhO2ItNzzj0r5I1ZeClnrvyiQOy9w8h0hDpvShDmHW4EhkqbgTWRuAqseHi51t4q48BBdgWtRbDwKFEYgaL/kjRXJ8CRbqyy8+i6jHoRrcHQnUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3TRX3D/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3TRX3D/P"
Received: by smtp.kernel.org (Postfix)
	id B2741C4CED3; Fri, 20 Dec 2024 12:57:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56818C4AF09
	for <soc@kernel.org>; Fri, 20 Dec 2024 12:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56818C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdHQF005325;
	Fri, 20 Dec 2024 13:57:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8d0M5vH214nW5hWYmS4DvqlNBlCNRLTZNSi1A6vgKkE=; b=3TRX3D/PmM4vGP5E
	YjDqSrLncoXckuU/gmpLex+umB8CExH3JyRoyBdS59MRjXMdaPo8fZzXoPhhelLl
	9TyXLkB9ALX3RSq6yHZrMdM1YWy0ZPbsPm3V8lkpSXynaF/u9YM3BO3Aeka+xtmz
	MyCxr/8IV8d+OmjA95NxX5y39+ksYs0fbKR8oUFfdpkkNc8AYJeyUIdw/sYAKwxB
	SJ3t64+eQWRvjfyNarG+sf/8yMzkn8bLbWFNyjsq0dkvkEfWrCKGu07AoWERj61h
	T/z+jS9jPYJArss1zA/9fkJntOlngq7gqQ7z5ODHPsthWZkFsGZ+LRhJvGq7VoB3
	hQr1rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n4vu1b2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1171640052;
	Fri, 20 Dec 2024 13:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 668A427665D;
	Fri, 20 Dec 2024 13:55:12 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:12 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [PATCH v2 3/4] ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
Date: Fri, 20 Dec 2024 13:55:05 +0100
Message-ID: <20241220125506.3157268-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Patrice Chotard <patrice.chotard@foss.st.com>

Running make savedefconfig highlights some useless flags.

Since 1c92d4a0edcf ("ARM: configs: stm32: Enable MMC_ARMMMCI and EXT3_FS support")
CRYPTO is selected by EXT3_FS, so CRYPTO can be removed in stm32_defconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index be7b63036730..d62a0c0b7ce5 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -75,4 +75,3 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SLUB_DEBUG is not set
-CONFIG_CRYPTO=y
-- 
2.25.1

