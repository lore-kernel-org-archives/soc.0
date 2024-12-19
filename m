Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E8E194C6A
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629545; cv=none; b=Q1uGKh8GknOVVdh8iwIPJ5sF9oS/ZTd44zyw/MBjXSXkRDu7nzp99yJVkCA9IKB+cUxlCgAPbQFsL98+hw+IXvtBjEvU5aqFxTssUP9HGlwI7QLoQceIk15Fnat0XsZvVocrsRSrA0QBuawP3LVCTnjLM6PJGi3cHRk7AmVASk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629545; c=relaxed/simple;
	bh=abBrVrGGhvxfzkmztihipB7+weKeoPmlC4uUwNZhKIE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvzPhl6uKGsLx1a/giATZEeRaTuaJHmAzuCeyAOiiToi49llTyUeFvf8lZ2XTUEYIi8TpzyGWWaNA7CQBU5t0XtEl0T+QiR5RkaunReLI5ADjrNyBRdfWAqVlhRePLkE1E46BynAfbBaiglcz2n6mUAf3Lpn8JwYPuip5FJt6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aapFnS/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aapFnS/a"
Received: by smtp.kernel.org (Postfix)
	id CE8F4C4CECE; Thu, 19 Dec 2024 17:32:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989B6C4AF0B
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 989B6C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYDm7028720;
	Thu, 19 Dec 2024 18:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=9grDHNlPqw1x/CKbQq0D6Q
	lOnJq+PsfKbzn8Mv8RRsE=; b=aapFnS/aIeAZgDgpUzKtvkbzsAkFpxYnrUWJom
	bcxKl0qtlg5B4+VeABJLbnqj8Ti3DAh74KHS8jXeWWTLXW04BT62XC9AgCG1d6cW
	GCWAFKxVREu7eOfxqnZe7EVu4lGUXOIW7qmlgVMbQcHLoPoeq96JGYq9+V9Ka2eT
	haBYbjIVkUlV30/SzRPAP12NjetPYhhUATg+7Ku8KRi6C8M5NZ6qNfAAMh6BY7iL
	UwjSvEvAA5XzN7NduRAI7SdYh2dNVGUY6M34xQpv/yMa3TxQEcmIn/5tvIucWbwc
	XNtq2nmU72sz+dIl2CGOLJAC+8leX520kRC+XMfnvdrxR3Sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5213440053;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5938E285168;
	Thu, 19 Dec 2024 18:29:57 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:57 +0100
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
Subject: [PATCH 0/7] ARM: config: stm32: Disable useless flags
Date: Thu, 19 Dec 2024 18:29:27 +0100
Message-ID: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
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

*** BLURB HERE ***

Patrice Chotard (7):
  ARM: configs: stm32: run savedefconfig for STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
    defconfig
  ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_IO_URING in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_POSIX_TIMERS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_GCC_PLUGINS in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

