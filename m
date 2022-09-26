Return-Path: <SRS0=MT2l=Z5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4BEC32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 10:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC5D5C433D7; Mon, 26 Sep 2022 10:50:35 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10EC6C43140
	for <soc@kernel.org>; Mon, 26 Sep 2022 10:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10EC6C43140
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id o2so10139804lfc.10
        for <soc@kernel.org>; Mon, 26 Sep 2022 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sduujl6DN3SaLa2Y/Z6Vcki+0Q9QqbCZHpdlm19R0rM=;
        b=HClTHAMIFLCVpN//cX5WfolUCp9f5W8XmUg56K+JFJnIwNX/lYJWCoQ5LILmvgomLh
         C4CjPZopxlEoI5Um32N8WfnhzJaFu673dK75xzxf9azpwx9iDHPeacw3NEm2wgSd4j0X
         eTYDF1Getx1o+K3IyfbEKGjnAwRM/Tm8RaE8DfnFDbcn/b7SzcyqB8OE0xHUXJcHFI6F
         rg8uUU6GetaJBaEOO7MAhmiSzkNpKxVFBaRfNLnPEH+VSsQIFKSmoIJshVz3nN5vEUpk
         60FHyAT4TrNTEbL3gTn3T0zvUNuVJYzpw4FsxDbZJbaGibyBvm1S/pt02rMwHYkmIc4/
         7pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sduujl6DN3SaLa2Y/Z6Vcki+0Q9QqbCZHpdlm19R0rM=;
        b=0UioNbFxpugW0BfZKvI43WBxFYdYZ1eujqGkhqbs1oUP0CaiUXbZithubIpH0Gb9PB
         Yyyq/ar5jW9Vd/Wt/lcCGN9sWhYw+c8x7zYfNLxxTKeiZ4WH1ONrquM0wSvgy8oRrygg
         oZoS/8oUq3Yxfuj1nRRcHqRJzWmm4R9fxrByKokAQ90YqS0VrM3NV+XuuNMudYI7R8Kj
         vN3uUzaR3pt78HuwSSrdQjsVXmY1ro7Qn0Et3j4eB15BDUuPuJNFhlv6KzOfCgMrxAIO
         iP6427t5nT40jfBN61BA/qKk77sASISmJ5YsHhTtaucW/QQFjQ+Qsa+4VX7BjbW0yu/0
         roUw==
X-Gm-Message-State: ACrzQf2MwH/o40GSZCunVxgzr79NR3zyM8xKhqeTswxbmFT/VCh1G7Ix
	n7hMz04jPqO5DFbcjS9XT+GQVA==
X-Google-Smtp-Source: AMsMyM4b3s9UOlbwdHOcusBcEnFj1C2J/V/PMZte/5G+lp2fXQHMBGTCPDUbre0H5aFETqL4hgiYgQ==
X-Received: by 2002:a19:651e:0:b0:497:aaa5:44c with SMTP id z30-20020a19651e000000b00497aaa5044cmr8211896lfb.280.1664189432064;
        Mon, 26 Sep 2022 03:50:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm2492936lfd.29.2022.09.26.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:50:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: Second round for v6.1
Date: Mon, 26 Sep 2022 12:50:23 +0200
Message-Id: <20220926105023.119781-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 9f8fb8032febf594914999c33493c682eaf138cb:

  dt-bindings: memory: mediatek,smi: Update condition for mt8195 smi node (2022-08-16 12:21:14 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.1-2

for you to fetch changes up to 5514acb0dd030356e628cdd88b266efaa0a22315:

  dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props (2022-09-21 20:34:58 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.1, part 2

Improvements in Synopsys DesignWare Universal Multi-Protocol Memory
Controller Devicetree bindings.  The bindings are being split into
one related to Synopsys core and into quite different derivative Zynq
A05 DDR Memory Controller.  Extend the Synopsys bindings with additional
properties to match upcoming new device support (Baikal-T1 support).

----------------------------------------------------------------
Serge Semin (4):
      dt-bindings: memory: synopsys,ddrc-ecc: Detach Zynq DDRC controller support
      dt-bindings: memory: snps,dw-umctl2-ddrc: Use more descriptive device name
      dt-bindings: memory: snps,dw-umctl2-ddrc: Replace opencoded numbers with macros
      dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props

 .../memory-controllers/snps,dw-umctl2-ddrc.yaml    | 118 +++++++++++++++++++++
 .../memory-controllers/synopsys,ddrc-ecc.yaml      |  76 -------------
 .../memory-controllers/xlnx,zynq-ddrc-a05.yaml     |  38 +++++++
 MAINTAINERS                                        |   2 +
 4 files changed, 158 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/synopsys,ddrc-ecc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml
