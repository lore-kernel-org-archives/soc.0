Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE023AB
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710874; cv=none; b=Uppv1zBHQK6m4n3HPStkATVNIDS47c64gZTtgSbyPpu1kKFBo5AJRQTC86o0AdHRd97gRFooVVLu1nUHFZ2YTTL8WeLawswwKfPyfcdftppTTsXCd67sfxFiOX4dIT4Jszag2/GJ2wKHgwuL8GU/SmbD7XBeY9rPdFG7pfuW8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710874; c=relaxed/simple;
	bh=hJkw7OQdC9vR6otyZ3lmsqp9ohKw3YDDMS5y3tALtjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7KJILs5p5re+dHBPieUSwHNFVvpcW0fwP76furLwx4UzIXj2JCuQVXy8gnTnpOChNFpftfKktmVkI2JtvDO0DIlX5LgUnqCXyEe41iMAQj0IbgIDoukGb9fhi8J3wcgn2AaBiBp8+QkuEu19WTW6HwslWkkgyn3q6fa2GAAPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=W24XxvFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="W24XxvFn"
Received: by smtp.kernel.org (Postfix)
	id 0C29BC4CED4; Mon,  4 Nov 2024 09:01:14 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.kernel.org (Postfix) with ESMTP id 8144BC4CED9;
	Mon,  4 Nov 2024 09:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8144BC4CED9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=NQOwH/EH5RsK+sUPmOSDwLSkkwWhH4FAujH0mstfmQk=;
	b=W24XxvFnZ3Sv5utXPcGep1qPjlunI5y0pD8hbuOQeNXpKFCG2i5lw4ITd+nxU2
	sbGhCq7UCYrMIep5qClXOSE3bQLU4f+erU2GHEixysxHAR6h4J5+oqK4OB0de3lq
	i+mw1n6QM9hapRMW8rvJLYP42iwtpkINS3DdhcV2yGA3M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S4;
	Mon, 04 Nov 2024 17:01:01 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings changes for 6.13
Date: Mon,  4 Nov 2024 17:00:52 +0800
Message-Id: <20241104090055.1881860-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4xJryrWFWrJF4DGrykKrg_yoW5Xw4xpF
	sIkF9xJrykJF17Jw4avF1kCw1rXr18A3WfJF9xGw1kJ3W5AF1jqFn5twn5ur9rKryIqF1Y
	yF1UCrnYg34xZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhpnPUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwqNZWcoYr+P7AAAsY

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.13

for you to fetch changes up to f1f6309aa9065487c527b538f476b49771aa0c4d:

  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E (2024-11-04 15:15:23 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.13:

- Add vendor prefix for ComVetia AG
- Add new board compatibles for Kobo Clara 2E, Boundary Device Nitrogen8MP,
  Comvetia LXR, Kontron i.MX8MP OSM-S, Verdin i.MX8MM/P Ivy, DH Electronics
  DHCOM, IOTA2 Lumpy, Gateworks GW82XX-2x
- A couple changes from Fabio Estevam to improve imx-anatop and imx-gpc
  bindings
- A fsl,dsp bindings update from Laurentiu Mihalcea to correct power domain
  count

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E

Bhavin Sharma (1):
      dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC Carrier Board

Fabio Estevam (5):
      dt-bindings: vendor-prefixes: Add an entry for ComVetia AG
      dt-bindings: arm: fsl: Document the Comvetia LXR board
      dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7 irq number
      dt-bindings: soc: imx: fsl,imx-anatop: Add additional regulators
      dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX8MP OSM-S based boards

João Paulo Gonçalves (2):
      dt-bindings: arm: freescale: Add verdin imx8mm ivy board
      dt-bindings: arm: freescale: Add verdin imx8mp ivy board

Laurentiu Mihalcea (1):
      dt-bindings: dsp: fsl,dsp: fix power domain count

Marek Vasut (3):
      dt-bindings: arm: fsl: Document DH i.MX8MP DHCOM SoM on DRC02 carrier board
      dt-bindings: arm: fsl: Document DH electronics i.MX8M Plus DHCOM PicoITX
      dt-bindings: arm: fsl: Document i.MX6DL DHCOM SoM on PDK2 carrier board

Michal Vokáč (1):
      dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board

Tim Harvey (1):
      dt-bindings: arm: fsl: Add Gateworks GW82XX-2x dev kit

 Documentation/devicetree/bindings/arm/fsl.yaml     | 45 ++++++++++++++++++++--
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 31 ++++++++++++---
 .../devicetree/bindings/mailbox/arm,mhuv2.yaml     |  2 +-
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     |  1 +
 .../bindings/soc/imx/fsl,imx-anatop.yaml           | 20 +++++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 6 files changed, 90 insertions(+), 11 deletions(-)

