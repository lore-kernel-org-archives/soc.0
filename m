Return-Path: <SRS0=pv8K=22=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C326DECDFA1
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 22:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81CF3C433D7; Tue, 25 Oct 2022 22:06:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68409C433D6;
	Tue, 25 Oct 2022 22:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68409C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id y16so12933282wrt.12;
        Tue, 25 Oct 2022 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkWFdDFpA2ET/e9kHATFDJrw30e54fmgfWvyavm263M=;
        b=A2RonXpa0rFb4YytEH1Z5+99MJaAl/mVWZzNqQ6EQRWGLl1Pco/PQ/opjEz0hTKxhC
         uyn6V7aiH7V21Gw1DiODqEBSeLWqJ/vy1M4kQQ/JoCrZVmaWz8lZVJygGBePG0DFa9mI
         KTt0s9CqhVkjTdFJrFMr6AR37vg9dnA0BrIJO7pD+3F6L2ZYzaii5WGqV1+4sQ4QCxX8
         9RnATpPBanielQGojIwyXsmK3QndMiGyit62HUB7vsBzXseIlIEhenOn/9v3nJI6kGGI
         jMz2yrTXtG6JqzDfUqXPhaMRobqyHLA9TlgbmxPKs2S4Gfl43mkbtSCgqX3OevAZ9OY6
         CcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkWFdDFpA2ET/e9kHATFDJrw30e54fmgfWvyavm263M=;
        b=IeEpNAvwgfFIY7a8xDfSdxtJf/brQfhuCvWiknVxPVmYbiF47ed5N12P/JW/oq0QNq
         9toYNfVnUIlc5RDEVb4BfH4OmNOldNJ8ATS5ixLh2mO9lKlyaFAgHwlTLPnbGoubv2/8
         txiuu4skciLd2ZSlF1bLt5bCmzGy9g/wOKUgH73sEzvXdqPBOsB5Xj/lbA0nFvLTpost
         ithP7jKL5yROsADkGtI3xK8qcWgH2bzAQJRIXb+7axUPvOJhREuFeuH/ATu8p4Lz96aL
         2N5xCGteOqiRCvOgzOojYRUL+U1/ZaaAtqA2osMsj5ebYcHp18tGofFv4NcBSwIFQoC3
         PQlw==
X-Gm-Message-State: ACrzQf0vTEhSXNbeiP+wC6GhwYoZtxkHfGPuLv4slHGkteIST1HA8CVg
	Q1wvRWV4jo6I0h8NA0UKRXA=
X-Google-Smtp-Source: AMsMyM6S2hCm+V5CuUIkT7HUDf8wqISyruffcau/S2wjKVy5wCFulcnX5ktIboGrM8eoVZNxd0ohXw==
X-Received: by 2002:a05:6000:1ac8:b0:231:909f:a4ba with SMTP id i8-20020a0560001ac800b00231909fa4bamr27793833wry.675.1666735603495;
        Tue, 25 Oct 2022 15:06:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:1d2a:d2a2:361e:a475])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b003a342933727sm210534wms.3.2022.10.25.15.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 15:06:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] RZ/G2UL separate out SoC specific parts
Date: Tue, 25 Oct 2022 23:06:27 +0100
Message-Id: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
so that this can be shared with the RZ/Five SoC.

Implementation is based on the discussion [0] where I have used option#2.

The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
(r9a07g043f.dtsi)

r9a07g043f.dtsi (RZ/Five SoC DTSI) will look something like below:

#include <dt-bindings/interrupt-controller/irq.h>

#define SOC_PERIPHERAL_IRQ(nr)	(nr + 32)

#include <arm64/renesas/r9a07g043.dtsi>

/ {
   ...
   ...   
};

Although patch#2 can be merged into patch#1 just wanted to keep them separated
for easier review.

Changes for v2:
- Fixed review comments pointed by Geert
 - Changed the SOC_PERIPHERAL_IRQ() macro

RFC-> RESEND RFC
* Patches rebased on top of renesas-arm-dt-for-v6.2 [1].

RESEND:
- https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

RFC:
- https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-arm-dt-for-v6.2

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
    to specify interrupt property
  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 347 ++++++++----------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  72 ++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
 3 files changed, 220 insertions(+), 201 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

-- 
2.25.1

