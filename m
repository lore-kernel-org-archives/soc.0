Return-Path: <SRS0=zANd=VO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D77C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AACAFC385A8; Fri,  6 May 2022 08:14:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 971F8C385B0
	for <soc@kernel.org>; Fri,  6 May 2022 08:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 971F8C385B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id t6so8990107wra.4
        for <soc@kernel.org>; Fri, 06 May 2022 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/88PareT3FwqgQqeieGvN6EcUA+3T4c6k7+dT7Kdhd8=;
        b=r/cxdJ5nHqykOS3JTkfrKs4GPwUNikKhRZp8payZC+QEejHrBpvXEH58/a03wbuBG/
         VY18f5njTHTnREExBBbT8yoX8BkLGu7N16h+DjFCWqMFG3xDB270EhI1rlwGKAzuQlEN
         X3fTLBW0xyo+MKwnQPF2D0XC63IgshFLpfN68y6s4iSSCRDY94NOOTR/4QDZrwPWFo6l
         Qs+iZt42jCocGmcsWYUAXQffneDbJcE5NTusAxkvn0iaVptGu1ellbDdgE+kLysBhiQO
         lpxatkNrnyak7cyI+ooUnSqad9//ghnbngagLntZaL3SQupdnsIyot2DUFUPKNKMbVZG
         wj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/88PareT3FwqgQqeieGvN6EcUA+3T4c6k7+dT7Kdhd8=;
        b=s+lRPRYeGCZvU0GjkFq+Zi5RXrkp3Tk2MyF2Se9hQ+JzuLdWyWcxEVyAMB+wPIzGgA
         ZzTOBcjjmNjkwRl3ZsIKLQLPlSFZ/+Rv7dYSnWrWshb9czC+l2O8bd1di4EWPksJv5IX
         TRoIQ8zv14jxTDm5xX855/BfKA9cc/8GdkT/Y66o8ULacrlJ0zoRuNjCPWdwBB52Qz8x
         d7devqYMpRg314YtBGvxJsALSf4HKB4qJAbc2YOIpwxlYRx1beWLbpsEdpPXTOtKd02D
         U+VfJ3Df/d4ZRekJfNKrn3WTt7VwnHsKp4Kqeh0LVsEBciFAI0qZggAcRf4ZZmid/Lrr
         oMMw==
X-Gm-Message-State: AOAM532+u6d3FTXDAUah992UU5dIYSXv/0g+A1T9Up7MD7T63AtJUUvj
	azkXVoFiMEw43YI2TY9vsdKHtg==
X-Google-Smtp-Source: ABdhPJwYp8Fq7iZ8niSaeSO+xK9EyZuxtnwlwi33jbqc92ETr6vConll0/LoWvaQT2kFOsd2gYwKyA==
X-Received: by 2002:a5d:5051:0:b0:20c:884b:2347 with SMTP id h17-20020a5d5051000000b0020c884b2347mr1684270wrt.224.1651824883839;
        Fri, 06 May 2022 01:14:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/6] arm64: dts: various cleanup for v5.19
Date: Fri,  6 May 2022 10:14:33 +0200
Message-Id: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Set of cleanup patches for various ARM64 archs.  Some of them were acked by
respective maintainers, some were waiting a bit so I decided to push through my
tree.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt64-cleanup-5.19

for you to fetch changes up to 8dba791a7280542bc125b68b3547bfa2680bc1af:

  arm64: dts: broadcom: drop useless 'dma-channels/requests' properties (2022-05-04 10:26:56 +0200)

----------------------------------------------------------------
Minor cleanup of ARM64 DTS for v5.19

Align SPI NOR node names and freq-table-hz to DT schema. Drop
unused/undocumented dma-channels/dma-requests.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
      arm64: dts: microchip: align SPI NOR node name with dtschema
      arm64: dts: marvell: align SPI NOR node name with dtschema
      arm64: dts: stratix10/agilex: drop useless 'dma-channels/requests' properties
      arm64: dts: broadcom: drop useless 'dma-channels/requests' properties

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi          | 2 --
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi           | 2 --
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi        | 2 --
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi                  | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi                  | 4 ++--
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi              | 2 --
 arch/arm64/boot/dts/marvell/armada-3720-db.dts             | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts           | 2 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 4 ++--
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 4 ++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi                 | 2 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 2 +-
 arch/arm64/boot/dts/microchip/sparx5_nand.dtsi             | 2 +-
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts            | 4 ++--
 arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi     | 4 ++--
 arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi     | 4 ++--
 22 files changed, 25 insertions(+), 33 deletions(-)
