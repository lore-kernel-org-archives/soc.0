Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E5C04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45C2EC43470; Thu, 28 Jul 2022 22:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEE0C433C1
	for <soc@kernel.org>; Thu, 28 Jul 2022 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047305;
	bh=U6v4Ig/viG4vOwfuGRr2WjJ6SHtwrnaHCIocysqrlMs=;
	h=From:Date:Subject:List-Id:To:From;
	b=TiHsWg5w9HOJX4mkxqhLutqdpgSSta+dii7YRpHzZVzHLDIDqSKVLxP7jd+KvOQjv
	 nJOCz3ZXDzQPWyByyqe6UeWOhFCjwEOsburtfEhaDn4JmGlRzwas4jXzsDgbWHhwee
	 GSt+CmNhgHEztGET9X5zPnQVnx/HxxYMLg+9+4+Rq9EyAQ1I7B0aDWz3aK+/efYqh0
	 ho0vMprZ9TMRwlQ9g/3x57EapH8fKSWK4/rC7g2QQyyjwR25j1+9SZmV2q5uMUhQtb
	 GJHVn2jR2hj1hZbdUc/6e1nG5ZQDYL6OZgD1JF/Ja3RW2gP//9kGdQ944g1U4zlzWF
	 z68oQ8u+Z8mXA==
Received: by mail-ed1-f49.google.com with SMTP id m8so3841343edd.9
        for <soc@kernel.org>; Thu, 28 Jul 2022 15:28:25 -0700 (PDT)
X-Gm-Message-State: AJIora86x4Wz99pum7CXWODrmNiuNuvlFgjpWmXOfxU92gYgiLiECN1M
	APOKZN8dVJPc+QYUzXJ7yksthpLO4D59BTC41aw=
X-Google-Smtp-Source: AGRyM1uNifgxwWQLNtOrOzN4WVp4eDHaKCkxpwyBRf8Dvxgd+onNwBHLhjs2oPzY8bFBGLkpsbZf8uZHxV+t8GGyrwI=
X-Received: by 2002:aa7:cd99:0:b0:43c:4f9c:4977 with SMTP id
 x25-20020aa7cd99000000b0043c4f9c4977mr982702edv.303.1659047303399; Thu, 28
 Jul 2022 15:28:23 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 00:28:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
Message-ID: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
Subject: [GIT PULL 0/6] SoC branches for 5.20
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is another large merge window for us, with over 1000 patches from 177
contributors. I'm sending these early since I'll be out of office for the n=
ext
few days.

The main highlights are the addition of two new SoC platforms (Nuvoton
NPCM8XX and Sunplus SP7021), marking 80% of the remaining pre-DT
board files as unused for later removal, and a ton of new hardware support
in particular for Qualcomm and Broadcom SoC platforms.

The main contributors by number of patches this time are:
    208 Krzysztof Kozlowski
     46 William Zhang
     42 Dmitry Baryshkov
     36 AngeloGioacchino Del Regno
     26 Arnd Bergmann
     22 Johan Hovold
     21 N=C3=ADcolas F. R. A. Prado
     19 Marcel Ziswiler
     19 Konrad Dybcio
     18 Geert Uytterhoeven
     17 Bjorn Andersson
     16 Marek Vasut
     15 Tomer Maimon
     15 Max Krummenacher
     14 Abel Vesa
     13 Samuel Holland
     13 Rohit Agarwal
     12 Cristian Marussi
     11 Douglas Anderson
     11 Christian Marangi
     11 Chanho Park
     10 Michael Walle
     10 Fabio Estevam

Dirstat:
   2.9% Documentation/devicetree/bindings/arm/
   3.2% Documentation/devicetree/bindings/
  18.9% arch/arm/boot/dts/
   1.0% arch/arm/configs/
   6.5% arch/arm/mach-davinci/
   1.7% arch/arm/
   1.7% arch/arm64/boot/dts/allwinner/
   1.3% arch/arm64/boot/dts/broadcom/bcmbca/
   3.1% arch/arm64/boot/dts/exynos/
  11.1% arch/arm64/boot/dts/freescale/
   4.2% arch/arm64/boot/dts/mediatek/
   1.2% arch/arm64/boot/dts/nvidia/
  20.1% arch/arm64/boot/dts/qcom/
   1.5% arch/arm64/boot/dts/renesas/
   1.2% arch/arm64/boot/dts/rockchip/
   3.7% arch/arm64/boot/dts/
   3.4% drivers/firmware/arm_scmi/
   5.6% drivers/soc/mediatek/
   1.1% drivers/soc/qcom/
   2.8% drivers/
   1.2% include/dt-bindings/clock/
   1.0% include/
 1297 files changed, 45609 insertions(+), 12448 deletions(-)
