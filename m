Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5216243964
	for <soc@lists.linux.dev>; Tue, 18 Aug 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087818; cv=none; b=BTiiyBSSCmzYNwNUkDPW305YdwBNNDnNmeJjWAjb7qjblmQpHaiFJMOVSFam6i+YLminNijbK4EU3dzNf6bL6QlJ48wHKQlihhuEh+7mxw0/cJGre5IrEhY4PGLfomglFysO1PmevEnemSox4kfj0SbuPZ/VRQkiyQ5ae23zV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087818; c=relaxed/simple;
	bh=ZzC3aRVjRDjy5Lpx4wJxKXWfECizDd+QlwG5s4h6MpQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=NxxoyPhZlh3afzlRSggUwOFzeO3gCFVl1ye1g4hDyYewNeKwJHLhOvcmKsjpoaUJSLwMs/YYTgoGi2Kulec0wOyRAaiF7cTtzvvHYJyRHMwa16hBTGc0YO+2/FKKR9fXx5U63yptRhlKQOUAK+ObF9rI+8f5Vo/fs62OuIb/hAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=S+Ii/gCS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MyB9OvZa; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="S+Ii/gCS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MyB9OvZa"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 4E631EC0269;
	Tue, 18 Aug 2026 17:16:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787087814; x=1787174214; bh=QR
	u84utBf9RlJY/tfttpbp3GRnV9u4StYipJJvH+meY=; b=S+Ii/gCSl85x8VAveT
	p6WHBldNiwodEEfnJ6mT0/rzZ4Ae4vpqPBy+CHlgA6gNmBEC74KIH9cqrXnFg6cJ
	StiLD9skTWtI4bdniUmqXU2nQFEd/DpM8/poMpw8l7pwAxMZN8AO3aN3gfmycCU6
	XK61Yy2SkP/eC1SFBIWw6zc2IKpQK3UCqKzjyFPc029KWdjVtpaKHQgE5f/ldfeh
	K5wVWpz7PE0PLZPeN3ilzdwIg/alym5bEp/pN6IopJBAtmbmLRWeYG1rVoUc2PPl
	tjCpxkNBY1uXdj1cFJLAyCRPkQ8lxI8HvIx6vaMlfg8vFDUmo3qVxgnNfu/LP4+u
	AllQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787087814; x=1787174214; bh=QRu84utBf9RlJY/tfttpbp3GRnV9
	u4StYipJJvH+meY=; b=MyB9OvZaGVLMq0JYllhXMbL/pAs+ijZ9grYETkGnetSx
	2TAECJ7eWRFp4Fhts1gW9H7/gZwvjN5MiRPMc4NralBS8n289+C3kWtMQRwCfvg/
	pk9BzkoiKcYW2zCLLCWNs7LXzZnvFYj0TF1lhORK5YHaTtBH5kw38i6bZaNpfBrZ
	Ej+Urr1fLUQWYJ9sxDYvPDcoxqjXq0j3/pXCI74jtFCGAVNcFRVa4rpLlMeJgtUg
	X7R9LMxbY1Jj5E9UobT5B1OPZCJRCkCQgiqLwWZFLXfhiFgr4/nFMCNWM3axAVDZ
	NRk88XzSG9xPEn8B3hDrLAXpd8Ns+dQlbkLs/kffZQ==
X-ME-Sender: <xms:wsuEaiVMEiwt5btWgqlD21iYFzHSTu7OavJSHrWHed1CmaP7VGgVXg>
    <xme:wsuEapZ93lc3ktDTJgPf9W-7YEQA3_RKjyleCIvWBGUZn9Ws-1jnzjoHMmZfIije5
    IpWuVKBNmlTwCtyRlpOpHyfxUyXmh7tZha4gQEnqzxTTJcd-nUlTg>
X-ME-Proxy-Cause: dmFkZTFmvl+Dgjtrsa4I8hy90pum+IuYwPVk9dNiWl7vAs+qDtJUiC+95qAU2aDJcW+/eh
    Cv3lBoIjmiQjwA0ikUpl8aXxaX4PSCdmTtOsvMYGWQgY6QePwLLadN/K3Z0VWKdZKjjCaG
    ez4pUIY2unaDHZtcFNFuApr6/15kK2/ECgUR09VYEqUL0oAxT9mGQrExAsfp+fXiAw4cL+
    gm6KpXGjt1EkeqlLveA+0hptM0BrqcaJYrPvV5jqd2F05pCWvukEUj4XSuBTopB80tl2lq
    zUlSpBUE0VRWeImAk0L+Hwup3KSxUAXdQWdSyeBCNafEkJ1xKqEbm6sw2bw9FZmPCDZiY6
    w7JIDfR/y1XdT6h61ILZsKn1JD75oHTB2o8x0UEH5O83SihQp377AxHzHgOA6yiM4RHUtG
    B5vL1e8K2aLECvP7Rx6vTXMz1RJKTVC9OV65Wi883HZ0nM5M7v1XCQGi8lDfDLCkkZ6fxd
    tr5HOl3YUFcAPxgBMTS2lE3K9U5S089eBF0LH30c/R3NdvylcXdK2tZPNibR+bi00iGHQ7
    5Z1O0T22Yy/mhHABP6Wm3HWGGkcEnN7kkXD6i5+eKFpl7QD/BgoOl68AXxIrxafoEQqesX
    crmJHsff3M65pdy9FKcFcTYVGNoUA42LXkh4OVQi5QHh39oChoLt2lz5sWTg
X-ME-Proxy: <xmx:w8uEakBdtFLlkLsccdynXONm2y01ALFImDfeJkg10YHEm9IYaH7sHA>
    <xmx:w8uEatYawNTlfX30VLYqi0rtjVR8rMRNlHioBPyNWWFivL5GrDCehA>
    <xmx:w8uEav5DQiLN5BeRHevbr7Bq6SOsWOxIlGn247YcIxK4QjhPMJHXkg>
    <xmx:w8uEamZRFpdvkgOe5d8LGQz9_Wryv5FdWu2nIkZ0gGWOVQqFlXJ64A>
    <xmx:xsuEajpaIaYhu5u88A1rWZ-w4stzZtdRlJ6m3S8sAjdJLmnLsSkG-3oh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1D77C32A0071; Tue, 18 Aug 2026 17:16:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A4-L8ZROkOzV
Date: Tue, 18 Aug 2026 23:16:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <c6f15430-90bd-4dcf-b35c-749753fcdd1f@app.fastmail.com>
Subject: [GIT PULL 0/4] soc changes for 7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This one is again a little over 1000 non-merge commits, from 263
individual authors, with Qualcomm, NXP and Rockchip devicetree
files making up a majority of the changes. The new SoCs this
time are mostly a bit older, these include Apple M3 Pro/Max/Ultra,
Samsung Exynos 1580, Canaan K210, Sophgo SG2000 and the new
Qualcomm Shikra and as well as Altera Agilex72.

A small but noteworthy change is the deprecation of a number of
older 32-bit Arm platforms that were getting in the way.
For this release, nothing is actually being removed, but my
current testing has shown hundreds of now orphaned drivers that
can be removed along with those platforms.

The long-running devicetree cleanups are slowly getting to the
point of fixing known dtc compiler warnings and being able to
enforce this better for new contributions.

The most active contributors this time are:
     73 Krzysztof Kozlowski
     52 Stefano Radaelli
     50 Manivannan Sadhasivam
     46 Mukesh Ojha
     29 Konrad Dybcio
     23 Frank Li
     21 Arnd Bergmann
     20 Dmitry Baryshkov
     19 Sudeep Holla
     13 Jie Gan
     12 Luca Weiss
     12 Komal Bajaj
     12 James Calligeros
     12 Ioana Ciornei
     12 Aurelien Jarno
     11 Pengpeng Hou

Dirstat:
   0.6% Documentation/devicetree/bindings/arm/
   0.5% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/gpio/
   0.2% Documentation/devicetree/bindings/soc/
   0.5% Documentation/devicetree/bindings/
   0.1% arch/arm/boot/dts/allwinner/
   0.6% arch/arm/boot/dts/aspeed/
   0.1% arch/arm/boot/dts/marvell/
   0.1% arch/arm/boot/dts/nxp/
   0.9% arch/arm/boot/dts/qcom/
   0.1% arch/arm/boot/dts/renesas/
   0.6% arch/arm/boot/dts/rockchip/
   0.8% arch/arm/boot/dts/ti/omap/
   0.3% arch/arm/boot/dts/vt8500/
   0.2% arch/arm/boot/dts/
   0.1% arch/arm/configs/
   0.1% arch/arm/mach-lpc32xx/
   0.1% arch/arm/mach-orion5x/
   0.3% arch/arm/mach-sa1100/
   0.7% arch/arm/
   0.4% arch/arm64/boot/dts/allwinner/
   0.3% arch/arm64/boot/dts/amd/
   0.2% arch/arm64/boot/dts/amlogic/
   8.3% arch/arm64/boot/dts/apple/
   2.0% arch/arm64/boot/dts/exynos/
  16.4% arch/arm64/boot/dts/freescale/
   0.4% arch/arm64/boot/dts/intel/
   0.5% arch/arm64/boot/dts/mediatek/
   0.7% arch/arm64/boot/dts/nvidia/
  28.0% arch/arm64/boot/dts/qcom/
   2.4% arch/arm64/boot/dts/renesas/
  11.8% arch/arm64/boot/dts/rockchip/
   0.2% arch/arm64/boot/dts/sophgo/
   0.1% arch/arm64/boot/dts/tesla/
   5.3% arch/arm64/boot/dts/ti/
   1.2% arch/arm64/boot/dts/xilinx/
   0.2% arch/arm64/boot/dts/
   0.6% arch/riscv/boot/dts/canaan/
   0.4% arch/riscv/boot/dts/sophgo/
   1.3% arch/riscv/boot/dts/spacemit/
   0.1% arch/riscv/boot/dts/thead/
   0.4% drivers/firmware/arm_scmi/
   2.3% drivers/firmware/qcom/
   0.1% drivers/firmware/xilinx/
   0.2% drivers/memory/tegra/
   0.4% drivers/soc/amlogic/
   0.2% drivers/soc/apple/
   0.3% drivers/soc/fsl/qe/
   0.7% drivers/soc/fsl/
   1.1% drivers/soc/mediatek/
   1.7% drivers/soc/qcom/
   0.1% drivers/soc/tegra/
   0.4% drivers/
   0.7% include/dt-bindings/clock/
   0.1% include/linux/soc/qcom/
   0.1% include/linux/
 1088 files changed, 70562 insertions(+), 7263 deletions(-)
