Return-Path: <SRS0=hBlL=FO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72496C4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 20:03:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3649622E00; Thu, 10 Dec 2020 20:03:19 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE4322D5A
	for <soc@kernel.org>; Thu, 10 Dec 2020 20:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE4322D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f196.google.com with SMTP id 15so7123365oix.8
        for <soc@kernel.org>; Thu, 10 Dec 2020 12:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtR9F6p1ys0YkETvTwwNV2ZO40Vezo7i8tec8Hr766Q=;
        b=HDSellfK+lJ7TKO/LOMpBUiP9VLjDCrpgCLSUTa3Wt2B2pyYBkqd36qevLOgWgBb3U
         zYGI+AZbqbIVkV4uiWUngEYIMBBVmZj8W4vxjl7Ew7NakwQtzpgPBtKSVlZLLZ1eg624
         1ombSKSLnh8s4LoSWOWsP5uLA863sHzm/hAGtwFQLBcUpMyvhU/JX+EtMFbUXnejzPn/
         nedZkx9b+L9CGt+iPN05emJsiWLmZC5wwgQ0zUaVE4nlegiXmyKzndpRsh+1v04XDmF8
         10tPMUcBA+ulrRT0kIyp1VNrp7YXLcFhbPosbLsq54YNq/dL1PhocDnHvKXfCnvTyCHX
         74fg==
X-Gm-Message-State: AOAM530f8U4jaCUpoADNQDcAonbAYiFI9hTJAccapIWKbFd9D/F6WfXp
	ABdQEFEpjCcBw7j/4dhwiw==
X-Google-Smtp-Source: ABdhPJydQtd6sep0NfygPaKwINOdAqbJ8No1je6RXTu8rcLYonG8EvpVSZkgmcSslyjfqjgtpt8U9Q==
X-Received: by 2002:aca:383:: with SMTP id 125mr6508871oid.122.1607630597802;
        Thu, 10 Dec 2020 12:03:17 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id o82sm1220636oih.5.2020.12.10.12.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:03:17 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] Remove PicoXcell
Date: Thu, 10 Dec 2020 14:03:11 -0600
Message-Id: <20201210200315.2965567-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PicoXcell has had nothing but treewide cleanups for at least the last 8
years and no signs of activity. The most recent activity is a yocto vendor
kernel based on v3.0 in 2015.

These patches can go via the respective maintainers' trees.

Rob

Rob Herring (4):
  ARM: dts: Remove PicoXcell platforms
  ARM: Remove PicoXcell platform support
  crypto: Remove PicoXcell driver
  dt-bindings: Remove PicoXcell bindings

 .../devicetree/bindings/arm/picoxcell.txt     |   24 -
 .../bindings/crypto/picochip-spacc.txt        |   21 -
 .../devicetree/bindings/net/macb.txt          |    2 -
 .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
 MAINTAINERS                                   |    9 -
 arch/arm/Kconfig                              |    2 -
 arch/arm/Kconfig.debug                        |   13 +-
 arch/arm/Makefile                             |    1 -
 arch/arm/boot/dts/Makefile                    |    3 -
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
 arch/arm/mach-picoxcell/Kconfig               |    9 -
 arch/arm/mach-picoxcell/Makefile              |    2 -
 arch/arm/mach-picoxcell/common.c              |   81 -
 drivers/crypto/Kconfig                        |   18 -
 drivers/crypto/Makefile                       |    1 -
 drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
 drivers/crypto/picoxcell_crypto_regs.h        |  115 --
 20 files changed, 1 insertion(+), 2869 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
 delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
 delete mode 100644 arch/arm/mach-picoxcell/Kconfig
 delete mode 100644 arch/arm/mach-picoxcell/Makefile
 delete mode 100644 arch/arm/mach-picoxcell/common.c
 delete mode 100644 drivers/crypto/picoxcell_crypto.c
 delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h

--
2.25.1
