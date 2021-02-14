Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E78C433E0
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:38:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBFDE64E4E; Sun, 14 Feb 2021 22:38:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91F2F64E27
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342300;
	bh=2wALrn8VAAbK/1x1XX+Lop9OH26WAwPXH9B1Wn+KeHc=;
	h=From:Date:Subject:List-Id:To:From;
	b=gjAXr4NHD4s2/2xlbf5/XJpLIh5JZ/zfO/oRNkXaq2QoARTQbyTTOkATaj4c8N4q6
	 rW+q+nuZ/gpAGSyr5kFF1mAPpLjdWMPqH2bmebYzJiBPL5zhAdTFD9zwJoeu8TKfav
	 AaaTWPfCvlQ1vXijke2fGGVYQC/vwbNqnZ/xE1IWt6Zc5T4upWXAkaK9vVBg22byPC
	 Dm/mHr3yxQzn6iUkuZcVU311cOayxY4+fqfEE5kDcc5keA3kvDZcMFv6zLDVL8K8PF
	 Ll22XK4tPK32NfZ57+/2NNod4YtfHEdqyN/mFdgXwuy1zfgq90j4Z5ZZH0l9h+bZZA
	 s/Yf0dIwNqcSw==
Received: by mail-ot1-f48.google.com with SMTP id l23so4495270otn.10
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:38:20 -0800 (PST)
X-Gm-Message-State: AOAM530n3JNZmvJLr6BOzsJ83blaUk0AWHPkuUupIkXiwh2mHX1LsrIZ
	zYRvPJ7qWNavKye0NzHOgxxs//qKIABxnEtIs8Y=
X-Google-Smtp-Source: ABdhPJxhKcABtd+TMhOp7xAMleHJyMln/77KiRekZ5trzivBzHsFc5dt8UPOdtw5SFO5oDoTd8snKP9tsF/7pnqUR+M=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr9895956otf.251.1613342299853;
 Sun, 14 Feb 2021 14:38:19 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:38:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
Message-ID: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
Subject: [GIT PULL 0/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

5.12 seems to be a fairly quiet release for the SoC tree. The main
highlights are:

 - Removing six of the older platforms that have no known users, as well
   as the arch/c6x architecture. Despite all that removed code, there is st=
ill
   a small overall growth:
   907 files changed, 33888 insertions(+), 26918 deletions(-)
   I sent patches to remove an additional 50875 lines of driver code for th=
ese
   platforms, but those patches are merged through other subsystem trees.

- Support for three additional SoCs: Broadcom BCM4908 is used in wireless
  routers, Qualcomm Snapdragon 888 is the latest high-end phone chip and
  Qualcomm X55 is the a 5G modem chip that can also run as a standalone SoC

- Support for the Apple M1 is coming up nicely, but didn't make the cut thi=
s
  time as there are still some fundamental decisions to be made, expect thi=
s
  to be added for v5.13.

- Among the newly supported boards, there are once more a number of older
  mobile phones and tables, as well as modern development platforms and
  industrial machines

- A total of 752 non-merge changesets were written by 187 individual
  developers. The six branches contain 78 pull requests from 29 downstream
  maintainers, as well as a small number of patches that I applied directly=
.

=3D=3D=3D Top 20 contributors by number of patches =3D=3D=3D

     34 Manivannan Sadhasivam
     30 Adam Ford
     26 Konrad Dybcio
     25 Dmitry Baryshkov
     19 Maxime Ripard
     18 Oleksij Rempel
     17 Michal Simek
     17 Krzysztof Kozlowski
     16 Michael Walle
     16 Johan Jonker
     15 Vinod Koul
     14 Gustave Monce
     12 Lubomir Rintel
     11 Rafa=C5=82 Mi=C5=82ecki
     11 Martin Kepplinger
     11 Cristian Ciocaltea
     11 Andre Przywara
     10 Linus Walleij
     10 Guido G=C3=BCnther
      9 Zhen Lei

=3D=3D=3D Dirstat =3D=3D=3D
   2.8% Documentation/devicetree/bindings/
  28.3% arch/arm/boot/dts/
   1.4% arch/arm/mach-prima2/
   1.1% arch/arm/mach-u300/
   3.0% arch/arm/
   1.6% arch/arm64/boot/dts/amlogic/
   8.5% arch/arm64/boot/dts/freescale/
   1.0% arch/arm64/boot/dts/hisilicon/
   4.3% arch/arm64/boot/dts/nvidia/
  11.6% arch/arm64/boot/dts/qcom/
   4.0% arch/arm64/boot/dts/renesas/
   1.5% arch/arm64/boot/dts/rockchip/
   1.1% arch/arm64/boot/dts/xilinx/
   1.4% arch/arm64/boot/dts/zte/
   2.5% arch/arm64/boot/dts/
   1.1% arch/c6x/boot/dts/
   3.3% arch/c6x/include/asm/
   5.5% arch/c6x/kernel/
   1.7% arch/c6x/lib/
   4.4% arch/c6x/platforms/
   1.7% arch/c6x/
   1.0% drivers/memory/
   3.9% drivers/soc/
   1.0% drivers/tee/optee/

         Arnd
