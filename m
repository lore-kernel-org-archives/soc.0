Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AFEC04A68
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 15:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EBDCC433B5; Wed, 27 Jul 2022 15:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A77C433C1
	for <soc@kernel.org>; Wed, 27 Jul 2022 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658935278;
	bh=l5X/tU+3cn+0jyUw7hxv+ZnXgRSPHH2NmCpgppFQMbg=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=EeVMf9veGl8zggNVPJ1zqh7ZxCcL0dWIaEuSaosbxhWWP+78OEwQ2Wa9DPPpv2Jms
	 E+vbIrIqvDNwwS9FKA+gNpKib9wHTLgnLc/VGWiea78D+mc6AnEZ89NytGASsBF/AW
	 7xv7akoduUsfE65EXDoE3sIuNbyznh1AeQoo6M+WynwwSA5wKm80LOCBrwQ6dQ4JIh
	 sJ0f4G4TOYY3xQOiWtm4H1g7/CABwRtYmpgB72FLxVkyWBfrrXMJF7QtmYFljz7Ci1
	 I89PcUOUyX8SjrxujW5pu5ErEIO1nvWPSjeC2pxJsJjz7bS1hpWK5/gqqTKkhNBTmb
	 bDpnUGTartvww==
Received: by mail-wr1-f50.google.com with SMTP id i8so1905908wro.11
        for <soc@kernel.org>; Wed, 27 Jul 2022 08:21:18 -0700 (PDT)
X-Gm-Message-State: AJIora9jXLIsa+Kit2he5MzNy82ZE8+km+smeuEkpcQCnz3MWDOIBNth
	cscyMS0RBICR6fjrfdI6XtjoXIuOqZUxkG14iE0=
X-Google-Smtp-Source: AGRyM1vvNRwYwlC5TF9DzfXDvzQvTr+HAxplujQxVsSIta4VnhwW3M8G0PjPPsUibg4zP8ioHePN41JnrkPdfHCNwbc=
X-Received: by 2002:a1c:f719:0:b0:3a3:15d4:5752 with SMTP id
 v25-20020a1cf719000000b003a315d45752mr3626566wmh.194.1658935276632; Wed, 27
 Jul 2022 08:21:16 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 27 Jul 2022 17:21:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
Message-ID: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.19, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.19-4

for you to fetch changes up to c5cdb9286913aa5a5ebb81bcca0c17df3b0e2c79:

  ARM: pxa2xx: Fix GPIO descriptor tables (2022-07-22 15:03:08 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.19, part 4

One last set of changes for the soc tree:

 - fix clock frequency on lan966x

 - fix incorrect GPIO numbers on some pxa machines

 - update Baolin's email address

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'at91-fixes-5.19-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes

Baolin Wang (1):
      mailmap: update Baolin Wang's email

Linus Walleij (1):
      ARM: pxa2xx: Fix GPIO descriptor tables

Michael Walle (1):
      ARM: dts: lan966x: fix sys_clk frequency

 .mailmap                       | 4 ++++
 arch/arm/boot/dts/lan966x.dtsi | 2 +-
 arch/arm/mach-pxa/corgi.c      | 2 +-
 arch/arm/mach-pxa/hx4700.c     | 2 +-
 arch/arm/mach-pxa/icontrol.c   | 4 ++--
 arch/arm/mach-pxa/littleton.c  | 2 +-
 arch/arm/mach-pxa/magician.c   | 2 +-
 arch/arm/mach-pxa/spitz.c      | 2 +-
 arch/arm/mach-pxa/z2.c         | 4 ++--
 9 files changed, 14 insertions(+), 10 deletions(-)
