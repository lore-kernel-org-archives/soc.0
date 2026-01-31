Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D52E9EA4
	for <soc@lists.linux.dev>; Sat, 31 Jan 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769845121; cv=none; b=rl8Q6UKnGlBBJTqHUr4pCJ7lyqGK/Ptaq4yepvEbzG55Nr4Z9Pd8YZKDAblR3q+Tj3nsNufrFMle3jE+jnoWSQoleV+Hpb09tRnZit9S3XmrOXcG44L19de+mIR9nRhmHxjxi/fy3ochuhQs4TNGOedi1KqZQ/TF3qwLdk7MCr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769845121; c=relaxed/simple;
	bh=eclQ23sIG18gb4JxlkTU7MMp/HFpW65y7SlWuKBfcnY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=HkXuq5fNerFhkbsekOfu2jAXxs/bjX2faJYNcW0ScQLFix8aYYGyZZA3OgbCsc97WwjOg3eNcCJ0vFuEqgEw02ZF+ThUXYVM4F8YSh99+yZbmFALUu9m9GiIYGd9cHYF3fqdpEPmxLWX/5IEDW7mHvsYSgZM/B3Fj2+k77IHNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1Y+Sj2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1Y+Sj2f"
Received: by smtp.kernel.org (Postfix)
	id 5CCA5C19422; Sat, 31 Jan 2026 07:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12209C4CEF1;
	Sat, 31 Jan 2026 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769845121;
	bh=eclQ23sIG18gb4JxlkTU7MMp/HFpW65y7SlWuKBfcnY=;
	h=Date:From:Subject:To:Cc:From;
	b=V1Y+Sj2faYa/7u54iAcl9v13aSghARgzcmzGfdqipEFN2lsN/dX03cpz29Wqq+m0J
	 riUaPMbtS6EDyBJrylf4d8Ex+jD7WcBDuDYwbGiFxe5cWua+bbocGbXDGmKddJyZVZ
	 jndGjNPpd8h6UNYb7fTq1ZBOy4hKRTUB11nOtOAP1bC1cS2pqZZlmDLBC9HPjtZdpd
	 +1hvjLi9jN4hNuvg0Gj5VRN83cWjotEqzW0qRctewQ2wqFk+WnEuGqadO4uyiI6NDQ
	 YwsCRVY32DuP9s2x0bkZkj0mSrkN/4sEpzX0+xEaZdfncdOH8+8LQQqfinPeS3qx1W
	 ol8rd8pP2Cr7g==
Message-ID: <3bc83479-015b-4367-9eef-7d8ca6005578@kernel.org>
Date: Sat, 31 Jan 2026 08:38:31 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 6.20
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.20

Documentation is acked by Conor Dooley and changes to fsl-mc bus are 
reviewed or acked by Ioana Ciornei.

Thanks
Christophe

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-6.20-1

for you to fetch changes up to 52f527d0916bcdd7621a0c9e7e599b133294d495:

   bus: fsl-mc: fix an error handling in fsl_mc_device_add() (2026-01-28 
13:35:48 +0100)

----------------------------------------------------------------
FSL SOC Changes for 6.20

Freescale Management Complex:
- Convert fsl-mc bus to bus callbacks
- Fix a use-after-free
- Drop redundant error messages
- Fix ressources release on some error path

Freescale QUICC Engine:
- Add an interrupt controller for IO Ports
- Use scoped for-each OF child loop

----------------------------------------------------------------
Chen Ni (1):
       soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler 
install/remove

Christophe Leroy (CS GROUP) (2):
       soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
       dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC 
Engine Ports

Gui-Dong Han (1):
       bus: fsl-mc: fix use-after-free in driver_override_show()

Haoxiang Li (1):
       bus: fsl-mc: fix an error handling in fsl_mc_device_add()

Krzysztof Kozlowski (1):
       soc: fsl: qe: Simplify with scoped for each OF child loop

Uwe Kleine-KÃ¶nig (2):
       bus: fsl-mc: Drop error message in probe function
       bus: fsl-mc: Convert to bus callbacks

  .../interrupt-controller/fsl,qe-ports-ic.yaml      |  51 ++++++++
  drivers/bus/fsl-mc/fsl-mc-bus.c                    |  89 ++++++-------
  drivers/soc/fsl/qe/Makefile                        |   2 +-
  drivers/soc/fsl/qe/qe_ports_ic.c                   | 141 
+++++++++++++++++++++
  drivers/soc/fsl/qe/qmc.c                           |  13 +-
  5 files changed, 233 insertions(+), 63 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
  create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c
