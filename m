Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988321519F
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699433; cv=none; b=cwTpefmboytbbVFIG58ef5h5F192glMD4eAVcIIlEeFRXGGspLoViHWctF4ABgmXWYlamBvRVUz4pwabzyqkNPSqHQGKeXrFtOnPUFdDNy3wE8OLfBATJaxF/cEYcvtTOQRDuEPznrktq8yvt9b47duuyeOpxKHFU+2wSkK+lpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699433; c=relaxed/simple;
	bh=tNJHZb19NqzzQR7YaqOVvuPuPaNnIBbBxvEdYPeJ8hg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HBYs18wnJGhcFaJrYyTmOeXCLd4rHh21hGrPETo90gTGYwu2siSR4twNk1pl0hLYS9P1IwnV6nNuzsmvCpA8OLu2F2++4j6efHwaQwGqI5ca3OVTwyGCvjj9dS0cV9Ovy2ek1a+KVS5e9qXNnyFZhucIdz94xATlqeI1eOm5h3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cbNqS2HH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cbNqS2HH"
Received: by smtp.kernel.org (Postfix)
	id 7A7DDC4CEE2; Fri, 20 Dec 2024 12:57:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 567B4C4CED7
	for <soc@kernel.org>; Fri, 20 Dec 2024 12:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 567B4C4CED7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdFUi004018;
	Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=dTNG0nibu7UYo45+nRmB7l
	qVuql0kGdP8sbH3SBpRbk=; b=cbNqS2HHeHCpZwYociD56gu52aYjKaeVeum1vu
	2NSL2Vs9on0oSTYygyae2nBwFolnr9WR1esvA5M7nsI1bEiyT5brGk/pc2Ealp77
	9d0KfCRyE3c3kZJVUkxNhzUEYA2wFUrGFK8TiAQhM9TavDO87lW1HWYHVOr3p5Mz
	aLaKNyTx9mWU7455jTl1CWDbcXqxyMuC/koH6iyEP5RlPHO4I/+Fo4BTATtXr7a6
	dNEa7oFsZZAFtaC22jeQAjul27YJ1X+V4KfviGhT58iM8TMzNRqUJBKk4v0bkxjf
	vgv4krrhOadXoMWTVkgVDx+0EXQ+VX9cJrAby19hFuk1hIRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bsrpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8A8E4004F;
	Fri, 20 Dec 2024 13:55:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B02C272C3A;
	Fri, 20 Dec 2024 13:55:10 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:09 +0100
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
Subject: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Date: Fri, 20 Dec 2024 13:55:02 +0100
Message-ID: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
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

Running "make savedefconfig" highlights that some flags are no more used,
remove them.
Remove some flags to reduce the kernel image size as STM32 MCU's board
embeds low amount of RAM.

Changes in V2:
  _ squash patches 2-7
  _ split patch 1 in three parts and add epxlanations about flags removal.

Patrice Chotard (4):
  ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32
    defconfig
  ARM: configs: stm32: Clean STM32 defconfig
  ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
  ARM: configs: stm32: Remove useless flags in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

