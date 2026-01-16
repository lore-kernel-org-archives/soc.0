Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54A18D658
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768528764; cv=none; b=DcwUWzVl/vy0Ibnl8QZtfTRZv8axe0IdpkSDANDFtyedB29an/XZc3Z/SkUUoOkPbyukmNF+P5lhKj3zMqUxKhiTwbOhB5CwnmQYbhigJM+wk5VjzQwoVScQFraMcxcaywea9iGdEm5oSKdkT+KNjqwRu2ptclgCF1fESR6W2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768528764; c=relaxed/simple;
	bh=furCkmjBRYxGDoWuOijTz10BDQrJxt6CEOe/ISpKJZw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=YII5cj0yHSf2Q93kN2Z6gJ5/ZXyXIGJ01t83eeHDXxEQQJ+/IOuqsoQrsdz4SmZzUaQMGIZsoNN/th6gsBOtQk6e5Wn8ltpCRJizKq4R9+/Dhnv4LqoumjQ+FdMQ+TylihEVU6+SbneOi7z+B+lo9/muB9lOEKCMN5Ac3Amg2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=XX0w0J9d; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="XX0w0J9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768528758;
	bh=LkUWOWXKl9G8yXPR1eulHmtakm6kDYpJNDSloOeIcLo=;
	h=Subject:From:To:Cc:Date;
	b=XX0w0J9deEUHlWxsecb8zMblx8zHhb6/mQaA0xISVC8twjMGp9EpkcE5Ha3fpLzux
	 ei6fWRYJbq+6tAt9zgT6Chx4xlOdd/zrhbQRMvsLeiZj8BorHO2o6WgpGWrKpaT+Lk
	 cDw91RM4RmATTAjlHp6TK8aazLsjiheDhbE8EIJwTKRb9NKjkci7bzkPJz8N/yxU+g
	 7paOXXPsnblM5+98R/lSa/XyallT62f4oH2LpXPSyM15s8BgaojSJENTF/JOmjubZB
	 IxYA78cBL5mzLCvMg0aLeU45/XMG/19I7XcPhHmXcDHwxynMh/Zqaosak20U1pwmoE
	 t1kUznqUKPE4A==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 78B6A64705;
	Fri, 16 Jan 2026 09:59:18 +0800 (AWST)
Message-ID: <c7002883dbeadf44069ef5e8cf573d9f2aefc899.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: second batch of arm devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 12:29:18 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

The following changes since commit 459a5aa171c0f13fcd78faa9594dc4aa5a95770b=
:

  ARM: dts: aspeed: bletchley: Fix ADC vref property names (2025-12-17 15:5=
3:31 +1030)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.20-devicetree-1

for you to fetch changes up to e600933b6e518397b3f256dddd233e5d8e6cff93:

  ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties (2026-01-08 20:=
04:23 +1030)

----------------------------------------------------------------
aspeed: second batch of arm devicetree changes for 6.20

New platforms:

- Facebook Anacapa

  The Meta Anacapa BMC is the DC-SCM (Data Center Secure Control
  Module) controller for the Meta OCP Open Rack Wide (ORW) compute tray.
  This platform is a key component of the AMD Helios AI rack reference
  design system, designed for next-generation AI workloads.

  The BMC utilizes the Aspeed AST2600 SoC to manage the compute tray, which
  contains up to 4 AMD Instinct MI450 Series GPUs (connected via a Broadcom
  OCP NIC) and host CPUs. Its primary role is to provide essential system
  control, power sequencing, and telemetry reporting for the compute comple=
x
  via the OpenBMC software stack.

  For more detail on the AMD Helios reference design:

  https://www.amd.com/en/blogs/2025/amd-helios-ai-rack-built-on-metas-2025-=
ocp-design.html

- ASRock Rack ALTRAD8

  The ALTRAD8 BMC is an Aspeed AST2500-based BMC for the ASRock Rack
  ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards.

Significant changes:

- Switch IBM FSI CFAM nodes to use non-deprecated AT25 properties

Updated platforms:

- bletchley (Facebook): USB-C tweaks

----------------------------------------------------------------
Cosmo Chou (1):
      ARM: dts: aspeed: bletchley: Remove try-power-role from connectors

Peter Shen (2):
      dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
      ARM: dts: aspeed: Add Facebook Anacapa platform

Rebecca Cran (2):
      dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
      ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

Rob Herring (Arm) (1):
      ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml   |    2 +
 arch/arm/boot/dts/aspeed/Makefile                          |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts     |  637 ++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts   | 1045 ++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts |    6 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts        |  128 ++++++--=
----
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi             |   64 +++---
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi             |   64 +++---
 8 files changed, 1814 insertions(+), 134 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dt=
s

