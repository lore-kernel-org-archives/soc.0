Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A422080DF
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543315; cv=none; b=o8Th2EJ1T58ZhywifsVusMkdAvKIZAQAy2hDwtzRhVrGIbE2GcZraFuCiqLSRZA+ssydJ+J4b8C+DGT0714M5vCNs/9lmgbg4AoWJX76zbynJ6rh469BxVHFhgAv6eL82gNm0yPHL+w+kWT1iLvqBk0NzcLQPzfXDXOO/kCWweo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543315; c=relaxed/simple;
	bh=jl2RVbBj3WdnQSscajqXDP9ig0Yrhu1K4YY93cjVI/c=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THq3JeQro3ErkFAP5aEgPtq2oxH0bsh8t5IFZgM5CulHhY8e/nOmz2tqfqyVss4AffRXg5q3j0P0HfvNusHnhaHBsJUYFAelKHJiUtmTAr4exL0J1KRXDiTn4cMcatiII3FcqRZxAiV0GOaVXzcTZbpAtgE6qd0nw8qznuzjzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k44kWVsg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k44kWVsg"
Received: by smtp.kernel.org (Postfix)
	id 3EB38C4CEE1; Fri, 10 Jan 2025 21:08:35 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20A88C4CED6;
	Fri, 10 Jan 2025 21:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20A88C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8Qa33468797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 15:08:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543306;
	bh=r/ue8Aiufy/wDZ3a45YXCfTJFJXDyUS9LLmOc/rSl44=;
	h=Date:From:To:CC:Subject;
	b=k44kWVsgWgbYhmIgJeQr4L2mChKNVOgqLSLb7yIKrVv+eV7Ucwe+x1/QqkbgiuAw9
	 ANIhqZjhXlumYKyIChtPXEfIkA13BtCcn31bpOKiK8PPNDf9f+7IXuF3JeoJ80kZO6
	 wshTwOela3fW4e5wgvGeXWkeF+DPd6sRnlc6maR4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8P7K031422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:08:25 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:08:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:08:25 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL8PBN034126;
	Fri, 10 Jan 2025 15:08:25 -0600
Date: Fri, 10 Jan 2025 15:08:25 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 4/4] MAINTAINERS: TI updates for v6.14
Message-ID: <20250110210825.emk6zh4tfc6obv26@celestial>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi SoC maintainers,

Note: this PR could potentially go with soc drivers as well, but decided
to keep it separate to allow your discretion as to the path to take.

Please pull

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-maintainer-for-v6.14

for you to fetch changes up to 31bd1f4517b651e132fae7cbb5f63b190015da94:

  MAINTAINERS: Add entry for linux/pruss_driver.h (2025-01-02 10:36:36 -0600)

----------------------------------------------------------------
TI Maintainer updates for v6.14

- Maintain Programmable Real-time Unit Subsystem(PRUSS) SoC library interface
  header linux/pruss_driver.h

----------------------------------------------------------------
MD Danish Anwar (1):
      MAINTAINERS: Add entry for linux/pruss_driver.h

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
