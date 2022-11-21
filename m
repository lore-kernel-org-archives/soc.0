Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126F4C4167E
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 17:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB5BFC433C1; Mon, 21 Nov 2022 17:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD60C433D7;
	Mon, 21 Nov 2022 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669050698;
	bh=5FK7KR+hwZeRWeQht9ieqZkpONb8vAk/9u0hkHt4SDU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=j5HWukBqWDgnWFjWwfdtoYZlTYeiPtfbMJq+nwIJ160/6lZXMIw1nYzNrCRQZ6Qjl
	 C3kah6oKL2yxXb/Y3qqGYZvuhZddFXQ6QqLFQqpc/qyIqFDs0y3ebTDq02jB0RX9hp
	 xSmUZ+rfKudcHJkvUzUej2czQjBOn4GUggNU9hqy1mmj/Qya0/pTgifxV3OS7PfOr3
	 s9Uh5E7u3cM9G6x67p9Rp8VUfeYvcUgGNv6Xu9qIOD4TmUQ48AXMHp3N1nWD4Gv5Ul
	 dsIoUWwGenfukbAbtve0AOgz7LlqTRdjbmmqU8O1deaga7fVGCYCDx7nA7aX9k8XLf
	 Cuin3neZOPMiQ==
Date: Mon, 21 Nov 2022 17:11:35 +0000
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org
Subject: RISC-V DT for v6.2
Message-ID: <Y3uxRylpTUqy9iUC@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hey Arnd,

I've gone and done this the way I would if it'd been for Palmer, so lmk
if there's something you'd rather see changed. Perhaps you'd prefer to
see PRs per vendor?

There's a minor conflict here with the Renesas DT changes - I picked up
a patch the other day that's needed by more than one series that
conflicts with a re-order of cpus.yaml which Geert took when adding the
Renesas RISC-V stuff. Resolution should be trivial.

I'll to get the PRs out slightly earlier going forward, but that was a
bit hard this time around.. There's a couple non-urgent fixes in here
too for a similar reason.

Thanks,
Conor.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.2-mw0

for you to fetch changes up to 4563db4b7988613570d435e7846e553ecf92e521:

  Merge branch 'riscv-thead_c9xx' into riscv-dt-for-next (2022-11-20 11:14:41 +0000)

----------------------------------------------------------------
RISC-V DeviceTrees for v6.2

dt-bindings:
- new compatibles to support the StarFive VisionFive & thead CPU cores
- a fix for the PolarFire SoC's pwm binding, merged through my tree as
  suggested by the PWM maintainers.

Microchip:
- Non-urgent fix for the node address not matches the reg in a way that
  the checkers don't complain about
- Add GPIO controlled LEDs for Icicle
- Support for the "CCC" clocks in the FPGA fabric. Previously these
  used fixed-frequency clocks in the dt, but if which CCC is in use is
  known, as in the v2022.09 Icicle Kit Reference Design, the rates can
  be read dynamically. It's an "is known" as it *can* be set via
  constraints in the FPGA tooling but does not have to be.
- A fix for the Icicle's pwm-cells
- Removal of some unused PCI clocks

StarFive:
- Addition of the VisionFive DT, which has been a long time coming!

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (8):
      riscv: dts: microchip: add the mpfs' fabric clock control
      riscv: dts: microchip: fix memory node unit address for icicle
      dt-bindings: pwm: fix microchip corePWM's pwm-cells
      riscv: dts: microchip: fix the icicle's #pwm-cells
      Merge branch 'riscv-visionfive_v1' into riscv-dt-for-next
      riscv: dts: microchip: remove pcie node from the sev kit
      riscv: dts: microchip: remove unused pcie clocks
      Merge branch 'riscv-thead_c9xx' into riscv-dt-for-next

Cristian Ciocaltea (3):
      dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
      riscv: dts: starfive: Add common DT for JH7100 based boards
      riscv: dts: starfive: Add StarFive VisionFive V1 device tree

Emil Renner Berthing (1):
      riscv: dts: microchip: icicle: Add GPIO controlled LEDs

Samuel Holland (1):
      dt-bindings: riscv: Add T-HEAD C906 and C910 compatibles

 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml   |   4 +++-
 Documentation/devicetree/bindings/riscv/cpus.yaml              |   2 ++
 Documentation/devicetree/bindings/riscv/starfive.yaml          |   4 +++-
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi      |  33 +++++++++++++++++----------------
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts              |  36 +++++++++++++++++++++++++++++++++++-
 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi         |   4 ++--
 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi      |   4 ++--
 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi         |  29 -----------------------------
 arch/riscv/boot/dts/microchip/mpfs.dtsi                        |  32 ++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/starfive/Makefile                          |   2 +-
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts      | 153 +--------------------------------------------------------------------------------------------------------------------------------------------------------
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi                | 161 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts |  20 ++++++++++++++++++++
 13 files changed, 279 insertions(+), 205 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
