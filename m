Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C1C433EF
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 17:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8458C34118; Wed, 18 May 2022 17:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91863C34100
	for <soc@kernel.org>; Wed, 18 May 2022 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652894373;
	bh=rikXJjN5EtlfiBOVji9JEeOLRL+AN6S5Eetf2ixOMWY=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=VRADUatEBpID9HzfIQCI1H+s0VAXEAgAk6VukmxalrsMh0KoIoOkfFN3AtkztRmYh
	 AzJ6uIiyxSa98mKnB0paKmsJYdSp+Eo0hba3q5hEqFsvBmI6201fufUSccinTgfE9t
	 ISHtWXDAykOYc4cJ5rkdVl2+KPJH1iyEDhHZTLACGXWxiNlCB8S/0ng+BpHRMO1M99
	 8GviZ8Y9x9adMjmr6qPkdCS0co8UgP9SHziqgkHM2CTrS12/jqYmZsKLuMbFUrd/a2
	 02kNwozcn1qYHO5fiGtJNP/fdqomo9Iup9ZYDsum6M/jBOAop5Maa2Dknd5DKPXEbx
	 iNoCj/iFLMjzw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f83983782fso31892097b3.6
        for <soc@kernel.org>; Wed, 18 May 2022 10:19:33 -0700 (PDT)
X-Gm-Message-State: AOAM530VmW8OCNCYhRTmU2ec6+BVOKjnyqq7Q4irknSe0P/J0wDfbTig
	FX9Wt1kl1Pa0ejg0gnQYPug2k2YspJs3SCPRQEY=
X-Google-Smtp-Source: ABdhPJxwgKGDrpmkRJiq1bujruDF+qD3hJ2C494pqO6Ecb7fVBLcvKVeATWg29enH5ZT2dEx4WHbRq1N2IHh7RCCkeA=
X-Received: by 2002:a81:950:0:b0:2fe:d88e:5529 with SMTP id
 77-20020a810950000000b002fed88e5529mr465175ywj.320.1652894372512; Wed, 18 May
 2022 10:19:32 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 18 May 2022 18:19:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
Message-ID: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.18, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 672c0c5173427e6b3e2a9bbb7be51ceeec78093a:

  Linux 5.18-rc5 (2022-05-01 13:57:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes

for you to fetch changes up to 609a097f5f0687539490625523ec3075b7d404b8:

  Merge tag 'v5.18-rockchip-dtsfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes (2022-05-12 22:33:17 +0200)

-----
ARM: SoC fixes for v5.18, part 4

The SoC bug fixes have calmed down sufficiently, there is one minor update
for the MAINTAINERS file, and few bug fixes for dts descriptions:

 - Updates to the BananaPi R2-Pro (rk3568) dts to match production
   hardware rather than the prototype version.

 - Qualcomm sm8250 soundwire gets disabled on some machines to avoid crashes

 - A number of aspeed SoC specific fixes, addressing incorrect pin cotrol
   settings, some values in the romed8hm board, and a revert for an
   accidental removal of a DT node
----
I'm sorry for the lack of a signed tag this time, I'm travelling at
the moment and
forgot to tag it first. The top commit in the branch is tagged with my
usual key,
and I can send the signed tag when I'm back on Saturday if you prefer to wait.

       Arnd
----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'maintainers-signed-take2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge tag 'aspeed-v5.18-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'v5.18-rockchip-dtsfixes1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/fixes

Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8250: don't enable rx/tx macro by default

Frank Wunderlich (2):
      arm64: dts: rockchip: Change io-domains of bpi-r2-pro
      arm64: dts: rockchip: Add gmac1 and change network settings of bpi-r2-pro

Howard Chiu (1):
      ARM: dts: aspeed: Add video engine to g6

Jae Hyun Yoo (5):
      ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
      pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
      dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
      dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
      ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group

Johnny Huang (2):
      pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
      ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi

Rajendra Nayak (1):
      MAINTAINERS: omap: remove me as a maintainer

Zev Weiss (2):
      ARM: dts: aspeed: romed8hm3: Add lm25066 sense resistor values
      ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |  4 +--
 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  |  4 ++-
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           | 10 +++---
 arch/arm/boot/dts/aspeed-g6.dtsi                   | 10 ++++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            | 12 +++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  4 +++
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 40 +++++++++++++++++++---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         | 17 +++++----
 9 files changed, 79 insertions(+), 23 deletions(-)
