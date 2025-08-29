Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF082D9ECB
	for <soc@lists.linux.dev>; Fri, 29 Aug 2025 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476850; cv=none; b=WdgKtW0QJnROBbPrThjPo/AqH8MZxd/Rugd2S5B2S/J4sQRrph7u9Us3L3ZWa1Mz08pTf6RP8dOMt8k4AwmB+mot4GtBG6JY0Fzu9hxpDehNBdTGhPw0roasankS9lzvXtZ7QU6BR03/pMMpTac2Gio+QpnXcS9v9HOrxQIUPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476850; c=relaxed/simple;
	bh=6RaX0eX4LLNEfVwtvvY1OBTMq0stmpcckK4HXXbVylc=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=l44SrYlKQhrT8PFSzxZ4fMTL12MFC4k+wrhuBKZ+QckBv2D+bhVUgHGDj5xDkuhZSZVcgO2UQxnNfkjp7l0s7flBRtPRyXspWSO/NxLB2km4Rw4uw4kXmvklih31D9gAm8t3oJ1vzTF8vjXyJ/J4d1nh9CDYJKZxmLmqun/xX+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ngE2T5kB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ngE2T5kB"
Received: by smtp.kernel.org (Postfix)
	id 6B4BAC4CEF7; Fri, 29 Aug 2025 14:14:10 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BC57C4CEF0;
	Fri, 29 Aug 2025 14:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BC57C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TCLngL028927;
	Fri, 29 Aug 2025 16:13:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=w2lS6fwJuQLoO12+V3h5B9
	xobNeEFnA0eJP95u8I9Gc=; b=ngE2T5kB567+wnquMd+O8Pb3YkYxsmuc1HH0Xy
	+tw9O7/pA+xz2vybSlCuFBAD9+29hFaqhkEZyAhPjRaoMIFMIvj21F2q5B9ZROG4
	jQUIkz4wNWk4efNBSxQfdjgD2T1QmG+CJJYOP6uXuWbs43kLqIdbd5RE5mql0gFF
	FY8fB60V2zz0+MH+WkAJVS2KtcBDAPl70nN/68OPh/olW2NH+Sv9ZGie8Eyp0eFH
	PubupkBFErCjvsZriexXq2U2jV/qt0Qh4xdDj8K9dPtXq3n0EPYDH2rP6p+qrO7Q
	ue2UO4J/FahycwHsGLlxDM6ybSf7hpFaZi46hElN/Wl2jwYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmy2a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:13:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6B38740047;
	Fri, 29 Aug 2025 16:13:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBC4E748615;
	Fri, 29 Aug 2025 16:12:45 +0200 (CEST)
Received: from [10.252.2.233] (10.252.2.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 29 Aug
 2025 16:12:45 +0200
Message-ID: <e4703e99-e44e-41d2-b744-a12ed4cb6692@foss.st.com>
Date: Fri, 29 Aug 2025 16:12:44 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        "arm@kernel.org" <arm@kernel.org>, <soc@kernel.org>
CC: <patrice.chotard@foss.st.com>,
        Raphael Gallais-Pou
	<rgallaispou@gmail.com>,
        Alain Volmat <avolmat@me.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.18 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_05,2025-08-28_01,2025-03-28_01

Hi 

Please consider this first round of STi DT changes for v6.18 cycle.

Thanks
Patrice

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v6.18-round1

for you to fetch changes up to dee546e1adefd75acf0d69ddc04dc9627d745986:

  ARM: sti: drop B2120 board support (2025-08-18 15:49:33 +0200)

----------------------------------------------------------------
STi dt fixes:
 - Drop STiH407/10-B2120 DT boards and bindings.
 - Remove remaining STiH415/6 reference from STi machine.
 - Fix phy-names value for stih407-family.dtsi.

----------------------------------------------------------------
Alain Volmat (1):
      ARM: sti: removal of stih415/stih416 related entries

Raphael Gallais-Pou (3):
      ARM: dts: sti: rename SATA phy-names
      dt-bindings: arm: sti: drop B2120 board support
      ARM: sti: drop B2120 board support

 Documentation/devicetree/bindings/arm/sti.yaml |   4 ---
 arch/arm/boot/dts/st/Makefile                  |   2 --
 arch/arm/boot/dts/st/stih407-b2120.dts         |  27 --------------------
 arch/arm/boot/dts/st/stih407-family.dtsi       |   4 +--
 arch/arm/boot/dts/st/stih407.dtsi              | 145 ---------------------------------------------------------------------------------------------------------
 arch/arm/boot/dts/st/stih410-b2120.dts         |  66 ------------------------------------------------
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi        | 206 ------------------------------------------------------------------------------------------------------------------------------------------------------
 arch/arm/mach-sti/Kconfig                      |  20 +--------------
 arch/arm/mach-sti/board-dt.c                   |   2 --
 9 files changed, 3 insertions(+), 473 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/stih407-b2120.dts
 delete mode 100644 arch/arm/boot/dts/st/stih407.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stih410-b2120.dts
 delete mode 100644 arch/arm/boot/dts/st/stihxxx-b2120.dtsi
