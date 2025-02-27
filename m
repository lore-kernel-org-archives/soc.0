Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081C1487D5
	for <soc@lists.linux.dev>; Thu, 27 Feb 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740652223; cv=none; b=agyRIGFU7LTayuLjRUvBQU2bKbIu0X1jscJx8tyzE7LUf9WYSHhizGhrVuHCJtzCdTnQtSLE+93Q2emIJfbcpBdRzfbDNHpLtLUS/vmPyZvtg4bSQbJ14ijHPpKiatRYPHt9FDRgI4lYxXh0OaEPLPzaMdqY1jzsJ7+ujt2SSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740652223; c=relaxed/simple;
	bh=GaSgLST/tBv0E/MPGw6ZCFKMm27+YvybP4d9v5gSsAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxCCQoqQPjeQ351Y4AT2q5q0E32g+0mEXscKH0DM3AuLrnqJe88mdRnd7HSvYpGfclRZ5+j9nFDj7HLjHSwJn+Ukz06j5BL07TrldmaDxwQioizKimUsBim52t7bSSomk0vISvammMK/ApzyntSyadn4IfTNJRuaWGqsDX1AAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=de6IKaUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="de6IKaUW"
Received: by smtp.kernel.org (Postfix)
	id 32769C4AF0B; Thu, 27 Feb 2025 10:30:22 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.kernel.org (Postfix) with ESMTP id CDB23C4CEDD;
	Thu, 27 Feb 2025 10:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDB23C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qd4HzO5DI05dF9t4EH+iv2z6iNBamypUQVWMX+idBZQ=;
	b=de6IKaUWk4gJS58kgVUA8ARoMXnGwGbRNG4BeySV+MMY3ZiTd1W24oSrMyonRA
	Xft550fi30swTpCZE7b9RAa4Ocbx4Uy9E6eIt/yF3FFcaezDzUwADcWLq5be/OcW
	tZrTUTJXSNocCDhrCKPGcwGJnDFUzohLZBjyGa4rlgegU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3EYquPsBnJxMcCg--.28199S3;
	Thu, 27 Feb 2025 18:30:08 +0800 (CST)
Date: Thu, 27 Feb 2025 18:30:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.14
Message-ID: <Z8A+rihFV4K3l8QR@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:Ms8vCgC3EYquPsBnJxMcCg--.28199S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW7WF18WFykKFW8XF1UKFg_yoW8CFW3pF
	4fArnxKr18JryfArnxXw48XF9xta1rJF45Wr13t3y8CF15CFn7Jr1jqryIgry2qryxAr43
	tF17JryUCFy5Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA8BZWfANJQmPgAAsw

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.14

for you to fetch changes up to 2c1092823eb03f8508d6769e2f38eef7e1fe62a0:

  arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card (2025-02-23 16:13:33 +0800)

----------------------------------------------------------------
i.MX fixes for 6.14:

- A tqma8mpql board fix from Alexander Stein to correct vqmmc-supply for
  usdhc3
- A change from Joe Hattori to fix OF node leak in imx-scu driver probe
- A soc-imx8m driver fix from Peng Fan unregister cpufreq and soc device
  in cleanup path
- A couple of changes from Stefan Eichenberger to fix iMX6 Apalis
  poweroff and iMX8M verdin-dahlia sound-card descriptions

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply

Joe Hattori (1):
      firmware: imx-scu: fix OF node leak in .probe()

Peng Fan (1):
      soc: imx8m: Unregister cpufreq and soc dev in cleanup path

Stefan Eichenberger (3):
      ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
      arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
      arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 10 ++++-----
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  6 ++---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 16 ++++---------
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  6 ++---
 drivers/firmware/imx/imx-scu.c                     |  1 +
 drivers/soc/imx/soc-imx8m.c                        | 26 ++++++++++++++++++++--
 6 files changed, 40 insertions(+), 25 deletions(-)

